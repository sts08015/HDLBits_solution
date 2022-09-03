module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] w1,w2,w3;
    
    my_dff8(clk,d,w1);
    my_dff8(clk,w1,w2);
    my_dff8(clk,w2,w3);
    
    always @(*) begin
        case(sel)
            2'd0: q = d;
            2'd1: q = w1;
            2'd2: q = w2;
            2'd3: q = w3;
        endcase
    end

endmodule
