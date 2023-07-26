
        // push constant 0
        @0
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
      
        // label LOOP_START      
        (LOOP_START)
      
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
      
        // if-goto LOOP_START      
        @SP // Get [stack-1]
        M=M-1
        A=M
        D=M
        @LOOP_START
        D;JNE
      
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
      