
      // function SimpleFunction.test 2      
      (SimpleFunction.test)      
    
        // push constant 0
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 0
        @0
        D=A
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
      
        // push local 1
        @LCL
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
      
        // not      
        @SP // Go to [stack-1]
        M=M-1
        A=M
        M=!M
        @SP // update stack pointer
        M=M+1
      
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
    