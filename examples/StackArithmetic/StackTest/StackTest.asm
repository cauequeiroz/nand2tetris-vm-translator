
        // push constant 17
        @17
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 17
        @17
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // eq      
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
          D;JEQ
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
      
        // push constant 17
        @17
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 16
        @16
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // eq      
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
          @IS_TRUE_5
          D;JEQ
          D=0
          @END_5
          0;JMP
        (IS_TRUE_5)
          D=-1
        (END_5)
              
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 16
        @16
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 17
        @17
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // eq      
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
          @IS_TRUE_8
          D;JEQ
          D=0
          @END_8
          0;JMP
        (IS_TRUE_8)
          D=-1
        (END_8)
              
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 892
        @892
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 891
        @891
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // lt      
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
          @IS_TRUE_11
          D;JLT
          D=0
          @END_11
          0;JMP
        (IS_TRUE_11)
          D=-1
        (END_11)
              
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 891
        @891
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 892
        @892
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // lt      
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
          @IS_TRUE_14
          D;JLT
          D=0
          @END_14
          0;JMP
        (IS_TRUE_14)
          D=-1
        (END_14)
              
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 891
        @891
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 891
        @891
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // lt      
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
          @IS_TRUE_17
          D;JLT
          D=0
          @END_17
          0;JMP
        (IS_TRUE_17)
          D=-1
        (END_17)
              
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
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
          @IS_TRUE_20
          D;JGT
          D=0
          @END_20
          0;JMP
        (IS_TRUE_20)
          D=-1
        (END_20)
              
        @SP // push D Register to stack
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
      
        // push constant 32767
        @32767
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
          @IS_TRUE_23
          D;JGT
          D=0
          @END_23
          0;JMP
        (IS_TRUE_23)
          D=-1
        (END_23)
              
        @SP // push D Register to stack
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
          @IS_TRUE_26
          D;JGT
          D=0
          @END_26
          0;JMP
        (IS_TRUE_26)
          D=-1
        (END_26)
              
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 57
        @57
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 31
        @31
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 53
        @53
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // add      
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
        D=D+M        
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 112
        @112
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // sub      
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
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // neg      
        @SP // Go to [stack-1]
        M=M-1
        A=M
        M=-M
        @SP // update stack pointer
        M=M+1
      
        // and      
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
        D=D&M        
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 82
        @82
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // or      
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
        D=D|M        
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // not      
        @SP // Go to [stack-1]
        M=M-1
        A=M
        M=!M
        @SP // update stack pointer
        M=M+1
      