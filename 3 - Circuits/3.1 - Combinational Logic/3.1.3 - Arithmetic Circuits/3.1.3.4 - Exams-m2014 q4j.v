module FA( 
    input a, b, cin,
    output cout, sum );
    
    wire w;
    assign w = a^b;
    assign sum = w^cin;
    assign cout = (a&b) | cin&w;

endmodule

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire w1,w2,w3;
    
    FA tmp1(x[0],y[0],1'b0,w1,sum[0]);
    FA tmp2(x[1],y[1],w1,w2,sum[1]);
    FA tmp3(x[2],y[2],w2,w3,sum[2]);
    FA tmp4(x[3],y[3],w3,sum[4],sum[3]);

endmodule