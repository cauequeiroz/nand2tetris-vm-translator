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
        var filename = process.argv[2] || './examples/MemoryAccess/StaticTest/StaticTest.vm';
        this.parser = new Parser_1.default(filename);
        this.codeWriter = new CodeWriter_1.default(filename);
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
            this.parser.advance();
        }
    }
    return VMTranslator;
}());
new VMTranslator();
