
        // push constant 3030
        @3030
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
      // pop pointer 0
      @SP
      M=M-1
      A=M
      D=M
      @THIS
      M=D
    
        // push constant 3040
        @3040
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
      // pop pointer 1
      @SP
      M=M-1
      A=M
      D=M
      @THAT
      M=D
    
        // push constant 32
        @32
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop this 2
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @THIS
        D=M
        @2 
        D=D+A
        @R15
        M=D

        @R14
        D=M
        @R15
        A=M
        M=D
      
        // push constant 46
        @46
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop that 6
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @THAT
        D=M
        @6 
        D=D+A
        @R15
        M=D

        @R14
        D=M
        @R15
        A=M
        M=D
      
        // push pointer 0
        @THIS 
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push pointer 1
        @THAT 
        D=M
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
      
        // push this 2
        @THIS
        D=M
        @2 
        D=D+A
        A=D
        D=M
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
      
        // push that 6
        @THAT
        D=M
        @6 
        D=D+A
        A=D
        D=M
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
      