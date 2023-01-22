module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    input en,
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset) q<=4'b0;
        else if(en) q<=(q+1)%10;
    end
    
endmodule


module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
	
    parameter N = 3'd4;	//number of digits
    
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[7:0] == {2{4'd9}});
    assign ena[3] = (q[11:0] == {3{4'd9}});
    
    genvar i;
    generate
        for(i=0;i<N;i++) begin : counter
            decade_counter tmp(clk,reset,i?ena[i]:1'b1,q[i*4 +: 4]);
        end
    endgenerate
    
endmodule