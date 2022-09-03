module FA( 
    input a, b, cin,
    output cout, sum );
    
    assign sum = a^b^cin;
    assign cout = (a&b) | cin&(a^b);

endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    generate
        genvar i;
        for(i=0;i<100;i=i+1) begin: Extending_Adder
            if(i==0)
                FA tmp1(a[i],b[i],cin,cout[i],sum[i]);
            else
                FA tmp2(a[i],b[i],cout[i-1],cout[i],sum[i]);
        end
    endgenerate

endmodule
