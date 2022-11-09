`define ADD 5'b00000
`define SUB 5'b01000
`define SLL 5'b00001
`define SLT 5'b00010
`define SLTU 5'b00011
`define XOR 5'b00100
`define SRL 5'b00101
`define SRA 5'b01101
`define OR 5'b00110
`define AND 5'b00111
`define BEQ 5'b11000
`define BNE 5'b11001
`define BLT 5'b11100
`define BGE 5'b11101
`define BLTU 5'b11110
`define BGEU 5'b11111

module testbench();

    reg  [31:0]  A;
    reg  [31:0]  B;
    reg  [4:0]   ALUOp;
    wire         Flag; 
    wire [31:0]  Result;  
    
    alu_riscv dut(A, B, ALUOp, Flag, Result);
    
    initial begin
       test_add();
       test_sub();
       test_sll();
       test_slt();
       test_sltu();
       test_xor();
       test_srl();
       test_sra();
       test_or();
       test_and();
       test_beq();
       test_bne();
       test_blt();
       test_bge();
       test_bltu();
       test_bgeu();
       
              
       $stop;
    
    end
    
    task test_add;
        begin
           ALUOp = `ADD;
           A = 10; B = 20; 
           #10;
           if (Result == (A + B))
                $display("correct: %d + %d = %d", A, B, Result);
           else
                $display("incorrect: %d + %d = %d", A, B, Result);
           #10;
        end
    endtask
    
    task test_sub;
        begin
           ALUOp = `SUB;
           A = 20; B = 10; 
           #10;
           if (Result == (A - B))
                $display("correct: %d - %d = %d", A, B, Result);
           else
                $display("incorrect: %d - %d = %d", A, B, Result);
           #10;
        end
    endtask
    
    task test_sll;
        begin
           ALUOp = `SLL;
           A = 7; B = 1; 
           #10;
           if (Result == (A << B))
                $display("correct: %b << %b = %b", A, B, Result);
           else
                $display("incorrect: %b << %b = %b", A, B, Result);
           #10;
        end
    endtask
    
    task test_slt;
        begin
           ALUOp = `SLT;
           A = 7; B = 1; 
           #10;
           if (Result == ($signed(A < B)))
                $display("correct: %d < %d = %d", A, B, Result);
           else
                $display("incorrect: %d < %d = %d", A, B, Result);
           #10;
        end
    endtask
    
    task test_sltu;
        begin
           ALUOp = `SLTU;
           A = 7; B = 1; 
           #10;
           if (Result == (A < B))
                $display("correct: %d < %d = %d", A, B, Result);
           else
                $display("incorrect: %d < %d = %d", A, B, Result);
           #10;
        end
    endtask
    
    task test_xor;
        begin
           ALUOp = `XOR;
           A = 7; B = 1; 
           #10;
           if (Result == (A ^ B))
                $display("correct: %d ^ %d = %d", A, B, Result);
           else
                $display("incorrect: %d ^ %d = %d", A, B, Result);
           #10;
        end
    endtask
    
    task test_srl;
        begin
           ALUOp = `SRL;
           A = 7; B = 1; 
           #10;
           if (Result == (A >> B))
                $display("correct: %b >> %b = %b", A, B, Result);
           else
                $display("incorrect: %b >> %b = %b", A, B, Result);
           #10;
        end
    endtask
    
    task test_sra;
        begin
           ALUOp = `SRA;
           A = 7; B = 1; 
           #10;
           if (Result == ($signed(A) >> B))
                $display("correct: %b >> %b = %b", A, B, Result);
           else
                $display("incorrect: %b >> %b = %b", A, B, Result);
           #10;
        end
    endtask
    
    task test_or;
        begin
           ALUOp = `OR;
           A = 7; B = 1; 
           #10;
           if (Result == (A | B))
                $display("correct: %d | %d = %d", A, B, Result);
           else
                $display("incorrect: %d | %d = %d", A, B, Result);
           #10;
        end
    endtask
    
    task test_and;
        begin
           ALUOp = `AND;
           A = 7; B = 1; 
           #10;
           if (Result == (A & B))
                $display("correct: %d & %d = %d", A, B, Result);
           else
                $display("incorrect: %d & %d = %d", A, B, Result);
           #10;
        end
    endtask
    
    task test_beq;
        begin
           ALUOp = `BEQ;
           A = 7; B = 1; 
           #10;
           if (Flag == (A == B))
                $display("correct: %d == %d = %d", A, B, Flag);
           else
                $display("incorrect: %d == %d = %d", A, B, Flag);
           #10;
        end
    endtask
    
    task test_bne;
        begin
           ALUOp = `BNE;
           A = 7; B = 1; 
           #10;
           if (Flag == (A != B))
                $display("correct: %d != %d = %d", A, B, Flag);
           else
                $display("incorrect: %d != %d = %d", A, B, Flag);
           #10;
        end
    endtask
    
    task test_blt;
        begin
           ALUOp = `BLT;
           A = 7; B = 1; 
           #10;
           if (Flag == $signed((A < B)))
                $display("correct: %d < %d = %d", A, B, Flag);
           else
                $display("incorrect: %d < %d = %d", A, B, Flag);
           #10;
        end
    endtask
    
    task test_bge;
        begin
           ALUOp = `BGE;
           A = 7; B = 1; 
           #10;
           if (Flag == $signed((A >= B)))
                $display("correct: %d >= %d = %d", A, B, Flag);
           else
                $display("incorrect: %d >= %d = %d", A, B, Flag);
           #10;
        end
    endtask
    
    task test_bltu;
        begin
           ALUOp = `BLTU;
           A = 7; B = 1; 
           #10;
           if (Flag == (A < B))
                $display("correct: %d < %d = %d", A, B, Flag);
           else
                $display("incorrect: %d < %d = %d", A, B, Flag);
           #10;
        end
    endtask
    
    task test_bgeu;
        begin
           ALUOp = `BGEU;
           A = 7; B = 1; 
           #10;
           if (Flag == (A >= B))
                $display("correct: %d >= %d = %d", A, B, Flag);
           else
                $display("incorrect: %d >= %d = %d", A, B, Flag);
           #10;
        end
    endtask
    
 endmodule