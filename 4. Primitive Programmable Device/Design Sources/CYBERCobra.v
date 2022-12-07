module CYBERcobra (
  input           CLK,
  input           rst,
  input   [31:0]  IN,
  output  [31:0]  OUT
);

reg [7:0] pc;  // создание регистра счетчика команд

wire [31:0] Instr;

wire WE3;  // вход регистрового файла
assign WE3 = Instr[29] | Instr [28];

wire    [31:0]  RD1;  // выход регистрового файла 1
wire    [31:0]  RD2;  // выход регистрового файла 2
reg     [31:0]  WD3;  // вход регистрового файла

wire    [31:0]  ALU_Result; // результат алу
wire            ALU_flag; // флаг алу

assign OUT = ALU_Result[31:0];  // ?????

wire            pc_flag = (Instr[30] & ALU_flag) | Instr[31];

reg     [7:0]   pc_Result;

// program counter
always @ (*) begin
    case(pc_flag)
        0: pc_Result = 8'b00000001;
        1: pc_Result = Instr[12:5];
    endcase    
end


// инкремент program counter
always @ (posedge CLK or posedge rst) begin
    if (rst)
        pc <= 0;
    else
        pc <= pc + pc_Result;
end

rom32_8 InstructionMemory(
                            .A(pc),
                            .RD(Instr)
                         );

mem32_32 RegisterFile(
                        .CLK(CLK),
                        .WE3(WE3),
                        .A1(Instr[22:18]),
                        .A2(Instr[17:13]),
                        .A3(Instr[4:0]),
                        .rst(rst),
                        .WD3(WD3),
                        .RD1(RD1),
                        .RD2(RD2)
                     );

alu_riscv ALU(
                .A(RD1),
                .B(RD2),
                .ALUOp(Instr[27:23]),
                .Flag(ALU_flag),
                .Result(ALU_Result)
             );



// Work with write data
wire    [1:0]   WD_mux_op   = Instr[29:28];
wire    [31:0]  WD_mux_2    = {{9{Instr[27]}}, Instr[27:5]};  // SE 

// Multiplexor for write register file
always @ (*)
    case(WD_mux_op)
        2'd1: WD3 = IN;
        2'd2: WD3 = WD_mux_2;
        2'd3: WD3 = ALU_Result;
    endcase


endmodule