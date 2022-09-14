module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    wire [7:0] tmp;
    
    always @(posedge clk) begin
        tmp<=in;
        anyedge <= tmp^in;
    end

endmodule
