#! /usr/bin/env node

import Parser from "./Parser";

class VMTranslator {
  private parser: Parser;

  constructor() {
    this.parser = new Parser(process.argv[2]);

    while(this.parser.hasNextInstruction()) {
      let instruction = this.parser.nextInstruction;
      console.log(instruction);     

      this.parser.advance();
    }
  }
}

new VMTranslator();
