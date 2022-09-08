module top_module (
    input clk,
    input j,
    input k,
    output Q);
    
    wire w1 = j^k;
    
    always @(posedge clk) begin
        if(~w1) Q<=j?~Q:Q;
        else Q<=j?1'b1:1'b0;
    end
    

endmodule
