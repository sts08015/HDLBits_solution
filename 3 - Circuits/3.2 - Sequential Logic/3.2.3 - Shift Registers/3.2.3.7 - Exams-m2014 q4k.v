module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] tmp;
    assign out = tmp[0];
    
    always @(posedge clk) begin
        if(~resetn)
            tmp <= 4'h0;
        else
            tmp <= {in,tmp[3:1]};
    end

endmodule