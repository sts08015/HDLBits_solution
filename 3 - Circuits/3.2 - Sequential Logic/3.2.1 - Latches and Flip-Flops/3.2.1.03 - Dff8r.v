module FF(input clk,reset,d,output q);
    always @(posedge clk) begin
        if(reset)
            q<=1'b0;
        else
            q<=d;
    end
endmodule

module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    generate
        genvar i;
        for(i=0;i<8;i++) begin: eightFF
            FF tmp(clk,reset,d[i],q[i]);
        end
    endgenerate

endmodule
