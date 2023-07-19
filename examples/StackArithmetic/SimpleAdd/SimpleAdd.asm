
        // push constant 7
        @7
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
      