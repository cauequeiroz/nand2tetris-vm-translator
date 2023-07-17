import * as fs from 'fs';
import * as path from 'path';

type Instruction = string;

export default class Parser {
  private file: string = "";
  private instructions: Instruction[] = [];
  private counter: number = 0;
  private outputFile!: fs.WriteStream;

  public nextInstruction!: Instruction;

  constructor(filename: string) {
    this.getFileFromDisk(filename);
    this.createOutputFile(filename);
    this.convertFileToInstructions();
    this.updateNextInstruction();
  }

  private getFileFromDisk(filename: string): void {
    this.file = fs.readFileSync(path.resolve(process.cwd(), filename), {
      encoding: "utf-8",
      flag: "r"
    });
  }

  private createOutputFile(filename: string) {
    this.outputFile = fs.createWriteStream(
      path.resolve(process.cwd(), filename.replace('.asm', '.hack')),
      { flags: 'w' }
    );    
  }

  public writeOnOutputFile(instruction: string) {
    this.outputFile.write(`${instruction}\n`);
  }

  public hasNextInstruction(): boolean {
    return this.counter < this.instructions.length;
  }

  public advance(): void {
    this.counter++;
    this.updateNextInstruction();
  }
  
  public reset(): void {
    this.counter = 0;
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
    return instruction;
  }

  private updateNextInstruction(): void {
    this.nextInstruction = this.instructions[this.counter];
  }
}
