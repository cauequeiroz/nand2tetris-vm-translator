
        // push constant 22
        @22
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
      // pop temp 0
      @SP
      M=M-1
      A=M
      D=M
      @5
      M=D
    
        // push constant 55
        @55
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
      
        // push temp 0
        @5 
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
      