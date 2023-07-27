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
var Parser = /** @class */ (function () {
    function Parser(filename) {
        this.file = "";
        this.instructions = [];
        this.counter = 0;
        this.getFileFromDisk(filename);
        this.convertFileToInstructions();
        this.updateNextInstruction();
    }
    Parser.prototype.getFileFromDisk = function (filename) {
        var _this = this;
        var completePath = path.resolve(process.cwd(), filename);
        fs.readdirSync(completePath).forEach(function (file) {
            if (file.endsWith('.vm')) {
                var fileContent = fs.readFileSync(path.resolve(completePath, file)).toString();
                _this.file += fileContent;
            }
        });
    };
    Parser.prototype.hasNextInstruction = function () {
        return this.counter < this.instructions.length;
    };
    Parser.prototype.advance = function () {
        this.counter++;
        this.updateNextInstruction();
    };
    Parser.prototype.convertFileToInstructions = function () {
        var _this = this;
        this.instructions = this.file
            .split("\n")
            .map(function (line) {
            if (line.startsWith("//") || line.startsWith("\r") || !line)
                return;
            var instruction = line;
            instruction = instruction.replace('\r', '');
            instruction = instruction.split('//')[0].trim();
            return _this.createInstruction(instruction);
        }).filter(function (line) { return line; });
    };
    Parser.prototype.createInstruction = function (instruction) {
        var instructionParts = instruction.split(' ');
        if (instructionParts[0] === 'push') {
            return {
                type: 'C_PUSH',
                segment: instructionParts[1],
                value: Number(instructionParts[2]),
                comment: instruction
            };
        }
        if (instructionParts[0] === 'pop') {
            return {
                type: 'C_POP',
                segment: instructionParts[1],
                value: Number(instructionParts[2]),
                comment: instruction
            };
        }
        if (['label', 'if-goto', 'goto'].includes(instructionParts[0])) {
            return {
                type: 'C_BRANCHING',
                command: instructionParts[0],
                name: instructionParts[1],
                comment: instruction
            };
        }
        if (instructionParts[0] === 'function') {
            return {
                type: 'C_FUNCTION',
                name: instructionParts[1],
                numberOfLocals: Number(instructionParts[2]),
                comment: instruction
            };
        }
        if (instructionParts[0] === 'call') {
            return {
                type: 'C_CALL',
                name: instructionParts[1],
                numberOfArgs: Number(instructionParts[2]),
                comment: instruction
            };
        }
        if (instructionParts[0] === 'return') {
            return {
                type: 'C_RETURN',
                comment: instruction
            };
        }
        return {
            type: 'C_ARITHMETIC',
            command: instructionParts[0],
            comment: instruction
        };
    };
    Parser.prototype.updateNextInstruction = function () {
        this.nextInstruction = this.instructions[this.counter];
    };
    return Parser;
}());
exports.default = Parser;
