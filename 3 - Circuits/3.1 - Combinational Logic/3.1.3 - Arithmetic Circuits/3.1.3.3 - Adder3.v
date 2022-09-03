module FA( 
    input a, b, cin,
    output cout, sum );
    
    wire w;
    assign w = a^b;
    assign sum = w^cin;
    assign cout = (a&b) | cin&w;

endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    FA tmp1(a[0],b[0],cin,cout[0],sum[0]);
    FA tmp2(a[1],b[1],cout[0],cout[1],sum[1]);
    FA tmp3(a[2],b[2],cout[1],cout[2],sum[2]);

endmodule