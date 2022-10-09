`timescale 1ns / 1ps

module testbench();

    reg     [31:0]  A, B;
    reg             P_in;
    wire    [31:0]  S;
    wire            P_out;
    
    
    fulladder32 DUT(
                    .A(A),
                    .B(B),
                    .Pin(P_in),
                    .S(S),
                    .Pout(P_out)
    );
    
    initial begin
    
        A = 0; B = 0; P_in = 0;
        #5;
        
        A = 1; B = 0; P_in = 0;
		#5;                 
	
		A = 50; B = 20; P_in = 0;
		#5;
		
		A = 0; B = 100; P_in = 0;
		#5;
		
		A = 1995; B = 1996; P_in = 1;  
		#5;
		
		A = 10; B = 100; P_in = 0;  
		#5;
		
		A = 40067; B = 73469; P_in = 1;  
		#5;
		
		A = 43678; B = 1331; P_in = 0;  
		#5;
		
	end
    

endmodule
