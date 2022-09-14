module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    wire [7:0] tmp;
    wire [7:0] tmp2;
    
    always @(posedge clk) begin
        tmp <= in;
    end
    
    always @(*) begin
        for(int i=0;i<8;i++) begin
            if(tmp[i] == 1'b0 && in[i] == 1'b1) tmp2[i] = 1'b1;
            else tmp2[i] = 1'b0;
        end
    end
    
    always @(posedge clk) begin
        pedge <= tmp2;
    end
endmodule


/*
module top_module(
	input clk,
	input [7:0] in,
	output reg [7:0] pedge);
	
	reg [7:0] d_last;	
			
	always @(posedge clk) begin
		d_last <= in;			// Remember the state of the previous cycle
		pedge <= in & ~d_last;	// A positive edge occurred if input was 0 and is now 1.
	end
	
endmodule
*/

