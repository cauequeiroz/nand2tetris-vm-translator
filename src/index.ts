#! /usr/bin/env node

import CodeWriter from "./CodeWriter";
import Parser from "./Parser";

class VMTranslator {
  private parser: Parser;
  private codeWriter: CodeWriter;

  constructor() {
    const filename = process.argv[2] || './examples/StackArithmetic/SimpleAdd/SimpleAdd.vm';
    this.parser = new Parser(filename);
    this.codeWriter = new CodeWriter(filename);

    while(this.parser.hasNextInstruction()) {
      let instruction = this.parser.nextInstruction;
      
      if (instruction.type === "C_PUSH") {
        this.codeWriter.writePushPopInstruction(instruction);
      }

      if (instruction.type === "C_ARITHMETIC") {
        this.codeWriter.writeArithmeticInstruction(instruction);
      }

      this.parser.advance();
    }
  }
}

new VMTranslator();
