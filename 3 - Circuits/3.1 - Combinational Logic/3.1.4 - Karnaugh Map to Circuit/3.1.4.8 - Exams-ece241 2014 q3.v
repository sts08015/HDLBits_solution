module M_AND(input a,b,output c);	//AND gate made with MUX
    assign c = a?b:1'b0;
endmodule

module M_OR(input a,b, output c);	//OR gate made with MUX
    assign c = a?1'b1:b;
endmodule
        

module top_module (
    input c,
    input d,
    output [3:0] mux_in
);
    
    wire nwd;
    assign nwd = d?1'b0:1'b1;	//NOT d
    
    M_OR i(c,d,mux_in[0]);
    assign mux_in[1] = 1'b0;  
    assign mux_in[2] = nwd;
    M_AND j(c,d,mux_in[3]);
endmodule
