import * as fs from 'fs';
import * as path from 'path';
import { Instruction } from './Parser';

export default class CodeWriter {
  private programName!: string;
  private outputFile!: fs.WriteStream;
  private segmentLabel = {
    'local': 'LCL',
    'argument': 'ARG',
    'this': 'THIS',
    'that': 'THAT'
  } as Record<string, string>;
  private functionName!: string;
  private className!: string;
  private returnCounter: number = 0;

  constructor(filename: string) {
    this.handleProgramName(filename);
    this.createOutputFile(filename);
  }

  public writeBootstrapInstructions(): void {
    this.writeOnOutputFile(`
      // Bootstrap code: Initialize SP  
      @256
      D=A
      @SP
      M=D
    `);

    this.writeCallInstruction({
      type: 'C_CALL',
      name: 'Sys.init',
      numberOfArgs: 0,
      comment: 'Bootstrap code: call Sys.init'
    });
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

    if (instruction.segment === 'temp') {
      this.writeOnOutputFile(`
        // ${instruction.comment}
        @${5 + instruction.value} 
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      `);
    }

    if (instruction.segment === 'pointer') {
      this.writeOnOutputFile(`
        // ${instruction.comment}
        @${instruction.value === 0 ? 'THIS' : 'THAT'} 
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      `);
    }

    if (instruction.segment === 'static') {
      this.writeOnOutputFile(`
        // ${instruction.comment}
        @${this.className}.${instruction.value} 
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      `);
    }

    if (['local', 'argument', 'this', 'that'].includes(instruction.segment)) {
      this.writeOnOutputFile(`
        // ${instruction.comment}
        @${this.segmentLabel[instruction.segment]}
        D=M
        @${instruction.value} 
        D=D+A
        A=D
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      `);
    }
  }

  public writePopInstruction(instruction: Instruction): void {
    if (instruction.type !== 'C_POP') return;

    if (['local', 'argument', 'this', 'that'].includes(instruction.segment)) {
      this.writeOnOutputFile(`
        // ${instruction.comment}
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @${this.segmentLabel[instruction.segment]}
        D=M
        @${instruction.value} 
        D=D+A
        @R15
        M=D

        @R14
        D=M
        @R15
        A=M
        M=D
      `);
    }

    if (instruction.segment === 'temp') {
      this.writeOnOutputFile(`
      // ${instruction.comment}
      @SP
      M=M-1
      A=M
      D=M
      @${5 + instruction.value}
      M=D
    `);
    }

    if (instruction.segment === 'pointer') {
      this.writeOnOutputFile(`
      // ${instruction.comment}
      @SP
      M=M-1
      A=M
      D=M
      @${instruction.value === 0 ? 'THIS' : 'THAT'}
      M=D
    `);
    }

    if (instruction.segment === 'static') {
      this.writeOnOutputFile(`
      // ${instruction.comment}
      @SP
      M=M-1
      A=M
      D=M
      @${this.className}.${instruction.value} 
      M=D
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

  public writeBranchingInstruction(instruction: Instruction): void {
    if (instruction.type !== 'C_BRANCHING') return;

    if (instruction.command === 'label') {
      this.writeOnOutputFile(`
        // ${instruction.comment}      
        (${this.functionName}$${instruction.name})
      `);
    }

    if (instruction.command === 'if-goto') {
      this.writeOnOutputFile(`
        // ${instruction.comment}      
        @SP // Get [stack-1]
        M=M-1
        A=M
        D=M
        @${this.functionName}$${instruction.name}
        D;JNE
      `);
    }

    if (instruction.command === 'goto') {
      this.writeOnOutputFile(`
        // ${instruction.comment}      
        @${this.functionName}$${instruction.name}
        0;JMP
      `);
    }
  }

  public writeFunctionInstruction(instruction: Instruction): void {
    if (instruction.type !== 'C_FUNCTION') return;

    this.functionName = instruction.name;
    this.className = instruction.name.split('.')[0];

    this.writeOnOutputFile(`
      // ${instruction.comment}      
      (${instruction.name})      
    `);

    for (let i=0; i<instruction.numberOfLocals; i++) {
      this.writePushInstruction({
        type: 'C_PUSH',
        segment: 'constant',
        value: 0,
        comment: "push constant 0"
      });
    }
  }

  public writeReturnInstruction(): void {
    this.writeOnOutputFile(`
      // return
        // Save *LCL on endFrame (R13)
        @LCL
        D=M
        @R13
        M=D
        // Save returnAddressLabel (R14)
        @5
        D=D-A
        A=D
        D=M
        @R14
        M=D
        // Get [stack-1]
        @SP
        M=M-1
        A=M
        D=M
        // ARG 0 = [stack-1]
        @ARG
        A=M
        M=D
        // SP = ARG 0 + 1
        D=A+1
        @SP
        M=D
        // Restore @THAT
        @R13
        A=M-1
        D=M
        @THAT
        M=D
        // Restore @THIS
        @R13
        D=M
        @2
        D=D-A
        A=D
        D=M
        @THIS
        M=D
        // Restore @ARG
        @R13
        D=M
        @3
        D=D-A
        A=D
        D=M
        @ARG
        M=D
        // Restore @LCL
        @R13
        D=M
        @4
        D=D-A
        A=D
        D=M
        @LCL
        M=D
        // Jump to returnAddressLabel
        @R14
        A=M
        0;JMP
    `)
  }

  public writeCallInstruction(instruction: Instruction): void {
    if (instruction.type !== 'C_CALL') return;

    const returnLabel = `${this.functionName}$ret.${this.returnCounter}`;

    this.writeOnOutputFile(`
      // ${instruction.comment}
        // push returnLabel
        @${returnLabel}
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current LCL
        @LCL
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current ARG
        @ARG
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THIS
        @THIS
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THAT
        @THAT
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // ARG = SP - (5 + numberOfArgs)
        @SP
        D=M
        @${5 + instruction.numberOfArgs}
        D=D-A
        @ARG
        M=D
        // LCL = SP
        @SP
        D=M
        @LCL
        M=D
        // Jump to function
        @${instruction.name}
        0;JMP
      (${returnLabel})      
    `);

    this.returnCounter++;
  }

  private handleProgramName(filename: string): void {
    if (!filename.endsWith("/")) {
      filename += "/";
    }

    const directories = filename.split('/');
    this.programName = directories[directories.length - 2];
  }

  private createOutputFile(filename: string) {
    this.outputFile = fs.createWriteStream(
      path.resolve(process.cwd(), filename, `${this.programName}.asm`),
      { flags: 'w' }
    );
  }

  private writeOnOutputFile(instruction: string) {
    // console.log(instruction)
    this.outputFile.write(`${instruction}`);
  }
}
