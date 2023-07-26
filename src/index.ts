#! /usr/bin/env node

import CodeWriter from "./CodeWriter";
import Parser from "./Parser";

class VMTranslator {
  private parser: Parser;
  private codeWriter: CodeWriter;

  constructor() {
    const filename = process.argv[2] || './examples/FunctionCalls/SimpleFunction/SimpleFunction.vm';
    this.parser = new Parser(filename);
    this.codeWriter = new CodeWriter(filename);

    while(this.parser.hasNextInstruction()) {
      let instruction = this.parser.nextInstruction;
      let counter = this.parser.counter;
      
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

      this.parser.advance();
    }
  }
}

new VMTranslator();
