"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
var fs = __importStar(require("fs"));
var path = __importStar(require("path"));
var CodeWriter = /** @class */ (function () {
    function CodeWriter(filename) {
        this.segmentLabel = {
            'local': 'LCL',
            'argument': 'ARG',
            'this': 'THIS',
            'that': 'THAT'
        };
        this.returnCounter = 0;
        this.handleProgramName(filename);
        this.createOutputFile(filename);
    }
    CodeWriter.prototype.writeBootstrapInstructions = function () {
        this.writeOnOutputFile("\n      // Bootstrap code: Initialize SP  \n      @256\n      D=A\n      @SP\n      M=D\n    ");
        this.writeCallInstruction({
            type: 'C_CALL',
            name: 'Sys.init',
            numberOfArgs: 0,
            comment: 'Bootstrap code: call Sys.init'
        });
    };
    CodeWriter.prototype.writePushInstruction = function (instruction) {
        if (instruction.type !== 'C_PUSH')
            return;
        if (instruction.segment === 'constant') {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "\n        @").concat(instruction.value, "\n        D=A\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n      "));
        }
        if (instruction.segment === 'temp') {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "\n        @").concat(5 + instruction.value, " \n        D=M\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n      "));
        }
        if (instruction.segment === 'pointer') {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "\n        @").concat(instruction.value === 0 ? 'THIS' : 'THAT', " \n        D=M\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n      "));
        }
        if (instruction.segment === 'static') {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "\n        @").concat(this.className, ".").concat(instruction.value, " \n        D=M\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n      "));
        }
        if (['local', 'argument', 'this', 'that'].includes(instruction.segment)) {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "\n        @").concat(this.segmentLabel[instruction.segment], "\n        D=M\n        @").concat(instruction.value, " \n        D=D+A\n        A=D\n        D=M\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n      "));
        }
    };
    CodeWriter.prototype.writePopInstruction = function (instruction) {
        if (instruction.type !== 'C_POP')
            return;
        if (['local', 'argument', 'this', 'that'].includes(instruction.segment)) {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "\n        @SP\n        M=M-1\n        A=M\n        D=M\n\n        @R14\n        M=D\n\n        @").concat(this.segmentLabel[instruction.segment], "\n        D=M\n        @").concat(instruction.value, " \n        D=D+A\n        @R15\n        M=D\n\n        @R14\n        D=M\n        @R15\n        A=M\n        M=D\n      "));
        }
        if (instruction.segment === 'temp') {
            this.writeOnOutputFile("\n      // ".concat(instruction.comment, "\n      @SP\n      M=M-1\n      A=M\n      D=M\n      @").concat(5 + instruction.value, "\n      M=D\n    "));
        }
        if (instruction.segment === 'pointer') {
            this.writeOnOutputFile("\n      // ".concat(instruction.comment, "\n      @SP\n      M=M-1\n      A=M\n      D=M\n      @").concat(instruction.value === 0 ? 'THIS' : 'THAT', "\n      M=D\n    "));
        }
        if (instruction.segment === 'static') {
            this.writeOnOutputFile("\n      // ".concat(instruction.comment, "\n      @SP\n      M=M-1\n      A=M\n      D=M\n      @").concat(this.className, ".").concat(instruction.value, " \n      M=D\n    "));
        }
    };
    CodeWriter.prototype.writeArithmeticInstruction = function (instruction, counter) {
        if (instruction.type !== 'C_ARITHMETIC')
            return;
        if (['add', 'sub', 'and', 'or', 'eq', 'gt', 'lt'].includes(instruction.command)) {
            var compareAction = function (jump) { return "\n          D=D-M\n          @IS_TRUE_".concat(counter, "\n          D;").concat(jump, "\n          D=0\n          @END_").concat(counter, "\n          0;JMP\n        (IS_TRUE_").concat(counter, ")\n          D=-1\n        (END_").concat(counter, ")\n      "); };
            var actions = {
                'add': 'D=D+M',
                'sub': 'D=D-M',
                'and': 'D=D&M',
                'or': 'D=D|M',
                'eq': compareAction('JEQ'),
                'lt': compareAction('JLT'),
                'gt': compareAction('JGT')
            };
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "      \n        @SP // Save [stack-1] on R15\n        M=M-1\n        A=M\n        D=M\n        @R15\n        M=D  \n        @SP // Save [stack-2] on D Register\n        M=M-1\n        A=M\n        D=M        \n        @R15 // D Register [op] R15\n        ").concat(actions[instruction.command], "        \n        @SP // push D Register to stack\n        A=M\n        M=D\n        @SP\n        M=M+1\n      "));
        }
        if (['not', 'neg'].includes(instruction.command)) {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "      \n        @SP // Go to [stack-1]\n        M=M-1\n        A=M\n        M=").concat(instruction.command === 'not' ? '!' : '-', "M\n        @SP // update stack pointer\n        M=M+1\n      "));
        }
    };
    CodeWriter.prototype.writeBranchingInstruction = function (instruction) {
        if (instruction.type !== 'C_BRANCHING')
            return;
        if (instruction.command === 'label') {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "      \n        (").concat(this.functionName, "$").concat(instruction.name, ")\n      "));
        }
        if (instruction.command === 'if-goto') {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "      \n        @SP // Get [stack-1]\n        M=M-1\n        A=M\n        D=M\n        @").concat(this.functionName, "$").concat(instruction.name, "\n        D;JNE\n      "));
        }
        if (instruction.command === 'goto') {
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "      \n        @").concat(this.functionName, "$").concat(instruction.name, "\n        0;JMP\n      "));
        }
    };
    CodeWriter.prototype.writeFunctionInstruction = function (instruction) {
        if (instruction.type !== 'C_FUNCTION')
            return;
        this.functionName = instruction.name;
        this.className = instruction.name.split('.')[0];
        this.writeOnOutputFile("\n      // ".concat(instruction.comment, "      \n      (").concat(instruction.name, ")      \n    "));
        for (var i = 0; i < instruction.numberOfLocals; i++) {
            this.writePushInstruction({
                type: 'C_PUSH',
                segment: 'constant',
                value: 0,
                comment: "push constant 0"
            });
        }
    };
    CodeWriter.prototype.writeReturnInstruction = function () {
        this.writeOnOutputFile("\n      // return\n        // Save *LCL on endFrame (R13)\n        @LCL\n        D=M\n        @R13\n        M=D\n        // Save returnAddressLabel (R14)\n        @5\n        D=D-A\n        A=D\n        D=M\n        @R14\n        M=D\n        // Get [stack-1]\n        @SP\n        M=M-1\n        A=M\n        D=M\n        // ARG 0 = [stack-1]\n        @ARG\n        A=M\n        M=D\n        // SP = ARG 0 + 1\n        D=A+1\n        @SP\n        M=D\n        // Restore @THAT\n        @R13\n        A=M-1\n        D=M\n        @THAT\n        M=D\n        // Restore @THIS\n        @R13\n        D=M\n        @2\n        D=D-A\n        A=D\n        D=M\n        @THIS\n        M=D\n        // Restore @ARG\n        @R13\n        D=M\n        @3\n        D=D-A\n        A=D\n        D=M\n        @ARG\n        M=D\n        // Restore @LCL\n        @R13\n        D=M\n        @4\n        D=D-A\n        A=D\n        D=M\n        @LCL\n        M=D\n        // Jump to returnAddressLabel\n        @R14\n        A=M\n        0;JMP\n    ");
    };
    CodeWriter.prototype.writeCallInstruction = function (instruction) {
        if (instruction.type !== 'C_CALL')
            return;
        var returnLabel = "".concat(this.functionName, "$ret.").concat(this.returnCounter);
        this.writeOnOutputFile("\n      // ".concat(instruction.comment, "\n        // push returnLabel\n        @").concat(returnLabel, "\n        D=A\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n        // push current LCL\n        @LCL\n        D=M\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n        // push current ARG\n        @ARG\n        D=M\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n        // push current THIS\n        @THIS\n        D=M\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n        // push current THAT\n        @THAT\n        D=M\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n        // ARG = SP - (5 + numberOfArgs)\n        @SP\n        D=M\n        @").concat(5 + instruction.numberOfArgs, "\n        D=D-A\n        @ARG\n        M=D\n        // LCL = SP\n        @SP\n        D=M\n        @LCL\n        M=D\n        // Jump to function\n        @").concat(instruction.name, "\n        0;JMP\n      (").concat(returnLabel, ")      \n    "));
        this.returnCounter++;
    };
    CodeWriter.prototype.handleProgramName = function (filename) {
        this.programName = path.basename(filename);
    };
    CodeWriter.prototype.createOutputFile = function (filename) {
        this.outputFile = fs.createWriteStream(path.resolve(process.cwd(), filename, "".concat(this.programName, ".asm")), { flags: 'w' });
    };
    CodeWriter.prototype.writeOnOutputFile = function (instruction) {
        this.outputFile.write("".concat(instruction));
    };
    return CodeWriter;
}());
exports.default = CodeWriter;
