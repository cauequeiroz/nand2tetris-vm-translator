
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
    
      // function Class1.set 0      
      (Class1.set)      
    
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
      
      // pop static 0
      @SP
      M=M-1
      A=M
      D=M
      @Class1.0 
      M=D
    
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
      
      // pop static 1
      @SP
      M=M-1
      A=M
      D=M
      @Class1.1 
      M=D
    
        // push constant 0
        @0
        D=A
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
    
      // function Class1.get 0      
      (Class1.get)      
    
        // push static 0
        @Class1.0 
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push static 1
        @Class1.1 
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
    
      // function Class2.set 0      
      (Class2.set)      
    
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
      
      // pop static 0
      @SP
      M=M-1
      A=M
      D=M
      @Class2.0 
      M=D
    
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
      
      // pop static 1
      @SP
      M=M-1
      A=M
      D=M
      @Class2.1 
      M=D
    
        // push constant 0
        @0
        D=A
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
    
      // function Class2.get 0      
      (Class2.get)      
    
        // push static 0
        @Class2.0 
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push static 1
        @Class2.1 
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
    
      // function Sys.init 0      
      (Sys.init)      
    
        // push constant 6
        @6
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 8
        @8
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
      // call Class1.set 2
        // push returnLabel
        @Sys.init$ret.1
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
        @7
        D=D-A
        @ARG
        M=D
        // LCL = SP
        @SP
        D=M
        @LCL
        M=D
        // Jump to function
        @Class1.set
        0;JMP
      (Sys.init$ret.1)      
    
      // pop temp 0
      @SP
      M=M-1
      A=M
      D=M
      @5
      M=D
    
        // push constant 23
        @23
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 15
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
      // call Class2.set 2
        // push returnLabel
        @Sys.init$ret.2
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
        @7
        D=D-A
        @ARG
        M=D
        // LCL = SP
        @SP
        D=M
        @LCL
        M=D
        // Jump to function
        @Class2.set
        0;JMP
      (Sys.init$ret.2)      
    
      // pop temp 0
      @SP
      M=M-1
      A=M
      D=M
      @5
      M=D
    
      // call Class1.get 0
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
        @Class1.get
        0;JMP
      (Sys.init$ret.3)      
    
      // call Class2.get 0
        // push returnLabel
        @Sys.init$ret.4
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
        @Class2.get
        0;JMP
      (Sys.init$ret.4)      
    
        // label WHILE      
        (Sys.init$WHILE)
      
        // goto WHILE      
        @Sys.init$WHILE
        0;JMP
      