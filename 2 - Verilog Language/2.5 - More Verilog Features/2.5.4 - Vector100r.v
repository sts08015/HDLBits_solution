module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    always @(*) begin
        for(i=0;i<$bits(out);i++) begin
            out[i] = in[$bits(out)-i-1];
        end
    end
    
endmodule