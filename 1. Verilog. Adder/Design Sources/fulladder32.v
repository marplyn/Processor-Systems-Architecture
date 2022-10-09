`timescale 1ns / 1ps


module fulladder32(
        input   [31:0]    A,
        input   [31:0]    B,
        input             Pin,
        output  [31:0]    S,
        output            Pout
    );
    
    wire [30:0] P;
    
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin: newgen
            begin
                if (i == 0)
                    fulladder new(
                                .a(A[i]),
                                .b(B[i]),
                                .Pin(Pin),
                                .S(S[i]),
                                .Pout(P[i])
                            );
                 else if (i == 31)
                    fulladder new(
                                .a(A[i]),
                                .b(B[i]),
                                .Pin(P[i - 1]),
                                .S(S[i]),
                                .Pout(Pout)
                            );
                 else
                    fulladder new(
                                .a(A[i]),
                                .b(B[i]),
                                .Pin(P[i - 1]),
                                .S(S[i]),
                                .Pout(P[i])
                            );
                 end
         end
     endgenerate
    
endmodule
