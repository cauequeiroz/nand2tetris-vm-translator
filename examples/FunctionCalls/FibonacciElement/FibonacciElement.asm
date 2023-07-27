
      // Bootstrap code: Initialize SP  
      @256
      D=A
      @SP
      M=D
    
      // Bootstrap code: call Sys.init
        // push returnLabel
        @undefined$ret.0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current LCL
        @LCL
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current ARG
        @ARG
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THIS
        @THIS
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THAT
        @THAT
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // ARG = SP - (5 + numberOfArgs)
        @SP
        D=M
        @5
        D=D-A
        @ARG
        M=D
        // LCL = SP
        @SP
        D=M
        @LCL
        M=D
        // Jump to function
        @Sys.init
        0;JMP
      (undefined$ret.0)      
    
      // function Main.fibonacci 0      
      (Main.fibonacci)      
    
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
          @IS_TRUE_3
          D;JLT
          D=0
          @END_3
          0;JMP
        (IS_TRUE_3)
          D=-1
        (END_3)
              
        @SP // push D Register to stack
        A=M
        M=D
        @SP
        M=M+1
      
        // if-goto IF_TRUE      
        @SP // Get [stack-1]
        M=M-1
        A=M
        D=M
        @Main.fibonacci$IF_TRUE
        D;JNE
      
        // goto IF_FALSE      
        @Main.fibonacci$IF_FALSE
        0;JMP
      
        // label IF_TRUE      
        (Main.fibonacci$IF_TRUE)
      
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
    
        // label IF_FALSE      
        (Main.fibonacci$IF_FALSE)
      
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
      
      // call Main.fibonacci 1
        // push returnLabel
        @Main.fibonacci$ret.1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current LCL
        @LCL
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current ARG
        @ARG
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THIS
        @THIS
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THAT
        @THAT
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // ARG = SP - (5 + numberOfArgs)
        @SP
        D=M
        @6
        D=D-A
        @ARG
        M=D
        // LCL = SP
        @SP
        D=M
        @LCL
        M=D
        // Jump to function
        @Main.fibonacci
        0;JMP
      (Main.fibonacci$ret.1)      
    
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
      
      // call Main.fibonacci 1
        // push returnLabel
        @Main.fibonacci$ret.2
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current LCL
        @LCL
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current ARG
        @ARG
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THIS
        @THIS
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THAT
        @THAT
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // ARG = SP - (5 + numberOfArgs)
        @SP
        D=M
        @6
        D=D-A
        @ARG
        M=D
        // LCL = SP
        @SP
        D=M
        @LCL
        M=D
        // Jump to function
        @Main.fibonacci
        0;JMP
      (Main.fibonacci$ret.2)      
    
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
    
      // function Sys.init 0      
      (Sys.init)      
    
        // push constant 4
        @4
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
      // call Main.fibonacci 1
        // push returnLabel
        @Sys.init$ret.3
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current LCL
        @LCL
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current ARG
        @ARG
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THIS
        @THIS
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push current THAT
        @THAT
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // ARG = SP - (5 + numberOfArgs)
        @SP
        D=M
        @6
        D=D-A
        @ARG
        M=D
        // LCL = SP
        @SP
        D=M
        @LCL
        M=D
        // Jump to function
        @Main.fibonacci
        0;JMP
      (Sys.init$ret.3)      
    
        // label WHILE      
        (Sys.init$WHILE)
      
        // goto WHILE      
        @Sys.init$WHILE
        0;JMP
      