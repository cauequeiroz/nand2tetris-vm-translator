# Nand2Tetris VM Translator

VM Translator written in Typescript for Nand2Tetris Hack Computer. This VM Translator is the project 7/8 of [Nand2Tetris Part 2](https://www.coursera.org/learn/nand2tetris2) course.

**Input:** A folder with`.vm` files (hack computer vm language)  
**Output:** `.asm` file (hack computer assembly language)

More information at: [https://www.nand2tetris.org/project07](https://www.nand2tetris.org/project07)

## Usage

```
$ npm install -g @cauequeiroz/nand2tetris-vm-translator
$ nand2tetris-vm-translator ./path/to/folder
```

```
$ npx @cauequeiroz/nand2tetris-vm-translator ./path/to/folder
```

After that, the output file with assembly language (`.asm`) will appears inside the given directory.
