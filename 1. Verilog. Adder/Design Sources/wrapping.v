`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2022 14:32:32
// Design Name: 
// Module Name: wrapping
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wrapping(
               input [15:0] SW,
               output [15:0] LED
    );

fulladder32 connect(
               .A(SW[3:0]),
               .B(SW[7:4]),
               .Pin(SW[15]),
               .S(LED[3:0]),
               .Pout(LED[15])
);

endmodule
