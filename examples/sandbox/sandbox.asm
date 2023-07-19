
        // push constant 32767
        @32767
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 32766
        @32766
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // gt      
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
        
          D=D-M
          @IS_TRUE_2
          D;JGT
          D=0
          @END_2
          0;JMP
        (IS_TRUE_2)
          D=-1
        (END_2)
              
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      