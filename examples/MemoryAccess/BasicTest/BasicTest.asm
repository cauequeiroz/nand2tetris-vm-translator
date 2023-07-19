
        // push constant 10
        @10
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop local 0
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @LCL
        D=M
        @0 
        D=D+A
        @R15
        M=D

        @R14
        D=M
        @R15
        A=M
        M=D
      
        // push constant 21
        @21
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 22
        @22
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop argument 2
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @ARG
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
      
        // pop argument 1
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @ARG
        D=M
        @1 
        D=D+A
        @R15
        M=D

        @R14
        D=M
        @R15
        A=M
        M=D
      
        // push constant 36
        @36
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop this 6
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @THIS
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
      
        // push constant 42
        @42
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 45
        @45
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop that 5
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @THAT
        D=M
        @5 
        D=D+A
        @R15
        M=D

        @R14
        D=M
        @R15
        A=M
        M=D
      
        // pop that 2
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @THAT
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
      
        // push constant 510
        @510
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
      // pop temp 6
      @SP
      M=M-1
      A=M
      D=M
      @11
      M=D
    
        // push local 0
        @LCL
        D=M
        @0 
        D=D+A
        A=D
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push that 5
        @THAT
        D=M
        @5 
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
      
        // push argument 1
        @ARG
        D=M
        @1 
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
      
        // push this 6
        @THIS
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
      
        // push this 6
        @THIS
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
      
        // push temp 6
        @11 
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
      