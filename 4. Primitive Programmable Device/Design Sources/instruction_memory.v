module rom32_8 (       
  input   [7:0]   A,     
  output  [31:0]   RD     
);

    reg [7:0] RAM [0:31];   

    initial $readmemh("mem.txt", RAM);  


    assign RD = RAM[A];


endmodule      