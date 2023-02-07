module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
);
 	
    reg [511:0] right;
    reg [511:0] left;
    
    assign left = {1'b0,q[511:1]};
    assign right = {q[510:0],1'b0};
    
    always @(posedge clk) begin
        if(load) q <= data;
        else q <= ( q | right ) & ( ~q | ~right | ~left );
    end
endmodule