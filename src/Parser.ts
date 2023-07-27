import * as fs from 'fs';
import * as path from 'path';

type MemorySegments = 'argument' | 'local' | 'static' | 'constant' | 'this' | 'that' | 'pointer' | 'temp';
type ArithmeticCommands = 'add' | 'sub' | 'neg' | 'eq' | 'gt' | 'lt' | 'and' | 'or' | 'not';
type BranchingCommands = 'label' | 'if-goto' | 'goto';

export type Instruction = 
  | {
    type: 'C_PUSH';
    segment: MemorySegments;
    value: number;
    comment: string;
  }
  | {
    type: 'C_POP';
    segment: MemorySegments;
    value: number;
    comment: string;
  }
  | {
    type: 'C_ARITHMETIC';
    command: ArithmeticCommands;
    comment: string;
  }
  | {
    type: 'C_BRANCHING';
    command: BranchingCommands;
    name: string;
    comment: string;
  }
  | {
    type: 'C_FUNCTION';
    name: string;
    numberOfLocals: number;
    comment: string;
  }
  | {
    type: 'C_CALL';
    name: string;
    numberOfArgs: number;
    comment: string;
  }
  | {
    type: 'C_RETURN';
    comment: string;
  };

export default class Parser {
  private file: string = "";
  private instructions: Instruction[] = [];
  public counter: number = 0;

  public nextInstruction!: Instruction;

  constructor(filename: string) {
    this.getFileFromDisk(filename);
    this.convertFileToInstructions();
    this.updateNextInstruction();
  }

  private getFileFromDisk(filename: string): void {
    const completePath = path.resolve(process.cwd(), filename);

    fs.readdirSync(completePath).forEach((file) => {
      if (file.endsWith('.vm')) {
        const fileContent = fs.readFileSync(path.resolve(completePath, file)).toString();
        this.file += fileContent;
      }
    });
  }

  public hasNextInstruction(): boolean {
    return this.counter < this.instructions.length;
  }

  public advance(): void {
    this.counter++;
    this.updateNextInstruction();
  }
  
  private convertFileToInstructions(): void {
    this.instructions = this.file
      .split("\n")
      .map(line => {
        if (line.startsWith("//") || line.startsWith("\r") || !line) return;

        let instruction = line;
        instruction = instruction.replace('\r', '');
        instruction = instruction.split('//')[0].trim();

        return this.createInstruction(instruction);
      }).filter(line => line) as Instruction[];
  }

  private createInstruction(instruction: string): Instruction {
    const instructionParts = instruction.split(' ');

    if (instructionParts[0] === 'push') {
      return {
        type: 'C_PUSH',
        segment: instructionParts[1] as MemorySegments,
        value: Number(instructionParts[2]),
        comment: instruction
      }
    }

    if (instructionParts[0] === 'pop') {
      return {
        type: 'C_POP',
        segment: instructionParts[1] as MemorySegments,
        value: Number(instructionParts[2]),
        comment: instruction
      }
    }

    if (['label', 'if-goto', 'goto'].includes(instructionParts[0])) {
      return {
        type: 'C_BRANCHING',
        command: instructionParts[0] as BranchingCommands,
        name: instructionParts[1],
        comment: instruction
      }
    }

    if (instructionParts[0] === 'function') {
      return {
        type: 'C_FUNCTION',
        name: instructionParts[1],
        numberOfLocals: Number(instructionParts[2]),
        comment: instruction
      }
    }

    if (instructionParts[0] === 'call') {
      return {
        type: 'C_CALL',
        name: instructionParts[1],
        numberOfArgs: Number(instructionParts[2]),
        comment: instruction
      }
    }

    if (instructionParts[0] === 'return') {
      return {
        type: 'C_RETURN',
        comment: instruction
      }
    }

    return {
      type: 'C_ARITHMETIC',
      command: instructionParts[0] as ArithmeticCommands,
      comment: instruction
    };
  }

  private updateNextInstruction(): void {
    this.nextInstruction = this.instructions[this.counter];
  }
}
