module mem32_32 (       
  input           CLK,    
  input   [4:0]   A1,      
  input   [4:0]   A2,      
  input   [4:0]   A3,      
  input   [31:0]  WD3,     
  input           WE3,
  input           rst,    
  output  [31:0]  RD1,      
  output  [31:0]  RD2      
);

  reg [31:0] RAM [0:31]; 

  assign RD1 = (A1 == 0) ? 0 : RAM[A1];
  assign RD2 = (A2 == 0) ? 0 : RAM[A2]; 
  
  integer i;  
  
  always @ (posedge CLK)  
    if (rst)
        for (i=0; i<31; i=i+1)
            RAM[i] <= 32'd0;  
    else if (WE3)     
        RAM[A3] <= WD3; 

endmodule                 