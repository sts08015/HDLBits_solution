module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    
    reg [31:0] ans;
    
    always @(*) begin
        ans = q[31:1];
        ans[31] = q[0] ^ 1'b0;
        ans[21] = q[0] ^ q[22];
        ans[1] = q[0] ^ q[2];
        ans[0] = q[0] ^ q[1];
    end
    
    always @(posedge clk) begin
        if(reset)
            q <= 32'h1;
        else
            q <= ans;
    end

endmodule