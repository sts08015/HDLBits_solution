module min(input [7:0] a,b, output [7:0] min);
    assign min = (a>b)?b:a;
endmodule

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    
    wire [7:0] w1,w2;
    min tmp1(.a(a),.b(b),.min(w1));
    min tmp2(.a(c),.b(d),.min(w2));
    min tmp3(.a(w1),.b(w2),.min(min));

endmodule
