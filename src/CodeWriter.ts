import * as fs from 'fs';
import * as path from 'path';
import { Instruction } from './Parser';

export default class CodeWriter {
  private outputFile!: fs.WriteStream;

  constructor(filename: string) {
    this.createOutputFile(filename);
  }

  public writePushInstruction(instruction: Instruction): void {
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

  public writeArithmeticInstruction(instruction: Instruction, counter: number): void {
    if (instruction.type !== 'C_ARITHMETIC') return;

    if (['add', 'sub', 'and', 'or', 'eq', 'gt', 'lt'].includes(instruction.command)) {
      const compareAction = (jump: string) => `
          D=D-M
          @IS_TRUE_${counter}
          D;${jump}
          D=0
          @END_${counter}
          0;JMP
        (IS_TRUE_${counter})
          D=-1
        (END_${counter})
      `;

      const actions = {
        'add': 'D=D+M',
        'sub': 'D=D-M',
        'and': 'D=D&M',
        'or': 'D=D|M',
        'eq': compareAction('JEQ'),
        'lt': compareAction('JLT'),
        'gt': compareAction('JGT')
      } as Record<string, string>;

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
        @R15 // D Register [op] R15
        ${actions[instruction.command]}        
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      `);
    }

    if (['not', 'neg'].includes(instruction.command)) {
      this.writeOnOutputFile(`
        // ${instruction.comment}      
        @SP // Go to [stack-1]
        M=M-1
        A=M
        M=${instruction.command === 'not' ? '!' : '-'}M
        @SP // update stack pointer
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
