`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   );

    wire tmp1 = a&b;
    wire tmp2 = c&d;
    wire tmp3 = tmp1 | tmp2;
    
    assign out = tmp3;
    assign out_n = ~tmp3;
endmodule
