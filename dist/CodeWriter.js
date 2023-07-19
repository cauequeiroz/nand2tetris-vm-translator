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
        this.staticName = path.basename(filename).replace('.vm', '');
        this.createOutputFile(filename);
    }
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
            this.writeOnOutputFile("\n        // ".concat(instruction.comment, "\n        @").concat(this.staticName, ".").concat(instruction.value, " \n        D=M\n        @SP\n        A=M\n        M=D\n        @SP\n        M=M+1\n      "));
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
            this.writeOnOutputFile("\n      // ".concat(instruction.comment, "\n      @SP\n      M=M-1\n      A=M\n      D=M\n      @").concat(this.staticName, ".").concat(instruction.value, " \n      M=D\n    "));
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
    CodeWriter.prototype.createOutputFile = function (filename) {
        this.outputFile = fs.createWriteStream(path.resolve(process.cwd(), filename.replace('.vm', '.asm')), { flags: 'w' });
    };
    CodeWriter.prototype.writeOnOutputFile = function (instruction) {
        // console.log(instruction)
        this.outputFile.write("".concat(instruction));
    };
    return CodeWriter;
}());
exports.default = CodeWriter;
