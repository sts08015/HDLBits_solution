module top_module ( input clk, input d, output q );
    wire w1,w2,w3;
    my_dff tmp1(clk,d,w1);
    my_dff tmp2(clk,w1,w2);
    my_dff tmp3(clk,w2,w3);
    assign q = w3;
endmodule