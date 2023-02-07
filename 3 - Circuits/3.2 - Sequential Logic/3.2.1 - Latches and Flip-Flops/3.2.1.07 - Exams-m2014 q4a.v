module top_module (
    input d, 
    input ena,
    output q);

    always @(ena) begin
        if(ena) q <= d;
    end
endmodule
