
      // function Sys.init 0      
      (Sys.init)      
    
        // push constant 4000
        @4000
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
    
        // push constant 5000
        @5000
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
    
      // call Sys.main 0
        // push returnLabel
        @Sys.init$ret.0
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
        @Sys.main
        0;JMP
      (Sys.init$ret.0)      
    
      // pop temp 1
      @SP
      M=M-1
      A=M
      D=M
      @6
      M=D
    
        // label LOOP      
        (Sys.init$LOOP)
      
        // goto LOOP      
        @Sys.init$LOOP
        0;JMP
      
      // function Sys.main 5      
      (Sys.main)      
    
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
      
        // push constant 0
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push constant 4001
        @4001
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
    
        // push constant 5001
        @5001
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
    
        // push constant 200
        @200
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop local 1
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @LCL
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
      
        // push constant 40
        @40
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop local 2
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @LCL
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
      
        // push constant 6
        @6
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // pop local 3
        @SP
        M=M-1
        A=M
        D=M

        @R14
        M=D

        @LCL
        D=M
        @3 
        D=D+A
        @R15
        M=D

        @R14
        D=M
        @R15
        A=M
        M=D
      
        // push constant 123
        @123
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
      // call Sys.add12 1
        // push returnLabel
        @Sys.main$ret.1
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
        @Sys.add12
        0;JMP
      (Sys.main$ret.1)      
    
      // pop temp 0
      @SP
      M=M-1
      A=M
      D=M
      @5
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
      
        // push local 2
        @LCL
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
      
        // push local 3
        @LCL
        D=M
        @3 
        D=D+A
        A=D
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push local 4
        @LCL
        D=M
        @4 
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
    
      // function Sys.add12 0      
      (Sys.add12)      
    
        // push constant 4002
        @4002
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
    
        // push constant 5002
        @5002
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
      
        // push constant 12
        @12
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
    