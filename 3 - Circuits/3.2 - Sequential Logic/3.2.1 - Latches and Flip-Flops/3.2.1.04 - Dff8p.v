module FF(input clk,reset,d, input [3:0] i,output q);
    always @(negedge clk) begin
        if(reset) begin
            case(i)
                4'd0: q<=1'b0;
                4'd1: q<=1'b0;
                4'd2: q<=1'b1;
                4'd3: q<=1'b0;
                4'd4: q<=1'b1;
                4'd5: q<=1'b1;
                4'd6: q<=1'b0;
                4'd7: q<=1'b0;
            endcase
        end
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
            FF tmp(clk,reset,d[i],i,q[i]);
        end
    endgenerate

endmodule

