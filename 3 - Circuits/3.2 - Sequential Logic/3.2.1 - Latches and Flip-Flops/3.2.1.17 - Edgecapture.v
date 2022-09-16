module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    
    wire [31:0] tmp;
    always @(posedge clk) begin
        tmp<=in;
        for(int i=0;i<32;i++) begin
            if(reset == 1'b1)
                out[i] <= 1'b0;
            else if(in[i] == 1'b0 && tmp[i] == 1'b1)
                out[i] <= 1'b1;
        end
    end

endmodule
