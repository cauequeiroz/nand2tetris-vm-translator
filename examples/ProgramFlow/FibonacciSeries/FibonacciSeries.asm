
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
      
      // pop pointer 1
      @SP
      M=M-1
      A=M
      D=M
      @THAT
      M=D
    
        // push constant 0
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop that 0
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @THAT
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
      
        // push constant 1
        @1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop that 1
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @THAT
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
      
        // push argument 0
        @ARG
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
      
        // push constant 2
        @2
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
      
        // pop argument 0
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @ARG
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
      
        // label MAIN_LOOP_START      
        (MAIN_LOOP_START)
      
        // push argument 0
        @ARG
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
      
        // if-goto COMPUTE_ELEMENT      
        @SP // Get [stack-1]
        M=M-1
        A=M
        D=M
        @COMPUTE_ELEMENT
        D;JNE
      
        // goto END_PROGRAM      
        @END_PROGRAM
        0;JMP
      
        // label COMPUTE_ELEMENT      
        (COMPUTE_ELEMENT)
      
        // push that 0
        @THAT
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
      
        // push that 1
        @THAT
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
      
        // push pointer 1
        @THAT 
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 1
        @1
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
      
      // pop pointer 1
      @SP
      M=M-1
      A=M
      D=M
      @THAT
      M=D
    
        // push argument 0
        @ARG
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
      
        // push constant 1
        @1
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
      
        // pop argument 0
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @ARG
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
      
        // goto MAIN_LOOP_START      
        @MAIN_LOOP_START
        0;JMP
      
        // label END_PROGRAM      
        (END_PROGRAM)
      