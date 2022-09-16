module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset)
            q <= 4'd0;
        else if(slowena)
            q<=(q+1)%10;
    end

endmodule
