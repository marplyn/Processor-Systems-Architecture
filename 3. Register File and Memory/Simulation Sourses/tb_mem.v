module tb_mem;

reg     [4:0]    adr1, adr2, adr3;
wire    [31:0]   rd1, rd2;
reg     [31:0]   wd3;
reg              clk, we3;

mem32_32 dut(
                .CLK(clk),
                .WE3(we3),
                .A1(adr1),
                .A2(adr2),
                .A3(adr3),
                .WD3(wd3),
                .RD1(rd1),
                .RD2(rd2)
);

always #10 clk = ~clk;

initial begin
  clk = 0;
  we3 = 1;
  
  adr1 = 0;
  adr2 = 0;
  adr3 = 0;
  wd3 = 30;
  
  #30
  
  adr3 = 42;
  wd3 = 228;
  
  #30
 
  adr3 = 21;
  wd3 = 1337;
  
  #30
  
  adr1 = 42;
  adr2 = 21;
  
  #30
  
  adr1 = 0;
  adr2 = 0;
  adr3 = 100;
  wd3 = 1488;
  
  #30
  adr2 = 100;
  
  
  $finish;
  
end
endmodule