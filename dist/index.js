#! /usr/bin/env node
"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var CodeWriter_1 = __importDefault(require("./CodeWriter"));
var Parser_1 = __importDefault(require("./Parser"));
var VMTranslator = /** @class */ (function () {
    function VMTranslator() {
        var filename = process.argv[2] || './examples/FunctionCalls/NestedCall';
        this.parser = new Parser_1.default(filename);
        this.codeWriter = new CodeWriter_1.default(filename);
        this.codeWriter.writeBootstrapInstructions();
        while (this.parser.hasNextInstruction()) {
            var instruction = this.parser.nextInstruction;
            var counter = this.parser.counter;
            if (instruction.type === "C_PUSH") {
                this.codeWriter.writePushInstruction(instruction);
            }
            if (instruction.type === "C_POP") {
                this.codeWriter.writePopInstruction(instruction);
            }
            if (instruction.type === "C_ARITHMETIC") {
                this.codeWriter.writeArithmeticInstruction(instruction, counter);
            }
            if (instruction.type === "C_BRANCHING") {
                this.codeWriter.writeBranchingInstruction(instruction);
            }
            if (instruction.type === "C_FUNCTION") {
                this.codeWriter.writeFunctionInstruction(instruction);
            }
            if (instruction.type === "C_CALL") {
                this.codeWriter.writeCallInstruction(instruction);
            }
            if (instruction.type === "C_RETURN") {
                this.codeWriter.writeReturnInstruction();
            }
            this.parser.advance();
        }
    }
    return VMTranslator;
}());
new VMTranslator();
