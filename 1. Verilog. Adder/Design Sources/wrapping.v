`timescale 1ns / 1ps

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
