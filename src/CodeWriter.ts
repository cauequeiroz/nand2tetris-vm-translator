import * as fs from 'fs';
import * as path from 'path';
import { Instruction } from './Parser';

export default class CodeWriter {
  private outputFile!: fs.WriteStream;

  constructor(filename: string) {
    this.createOutputFile(filename);
  }

  public writePushPopInstruction(instruction: Instruction): void {
    if (instruction.type !== 'C_PUSH') return;

    if (instruction.segment === 'constant') {
      this.writeOnOutputFile(`
        // ${instruction.comment}
        @${instruction.value}
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      `);
    }
  }

  public writeArithmeticInstruction(instruction: Instruction): void {
    if (instruction.type !== 'C_ARITHMETIC') return;

    if (instruction.command === 'add') {
      this.writeOnOutputFile(`
        // ${instruction.comment}      
        @SP // Save [stack-1] on R15
        M=M-1
        A=M
        D=M
        @R15
        M=D  
        @SP // Save [stack-2] on D Register
        M=M-1
        A=M
        D=M        
        @R15 // D Register + R15
        D=D+M        
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      `);
    }
  }

  private createOutputFile(filename: string) {
    this.outputFile = fs.createWriteStream(
      path.resolve(process.cwd(), filename.replace('.vm', '.asm')),
      { flags: 'w' }
    );    
  }

  private writeOnOutputFile(instruction: string) {
    console.log(instruction)
    this.outputFile.write(`${instruction}`);
  }
}
