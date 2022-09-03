module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] w;
    
    generate
        genvar i;
        for(i=0;i<100;i++) begin : BCDadd
            if(i==0)
                bcd_fadd tmp1(a[i+:4],b[i+:4],cin,w[i],sum[i+:4]);
            else
                bcd_fadd tmp2(a[4*i+:4],b[4*i+:4],w[i-1],w[i],sum[4*i+:4]);
        end
    endgenerate
    
    assign cout = w[99];
   
endmodule
