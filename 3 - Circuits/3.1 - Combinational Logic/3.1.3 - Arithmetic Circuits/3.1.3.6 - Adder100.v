module FA( 
    input a, b, cin,
    output cout, sum );
    
    wire w;
    assign w = a^b;
    assign sum = w^cin;
    assign cout = (a&b) | cin&w;

endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    wire [99:0] tmp;
    
    generate
        genvar i;
        for(i=0;i<100;i++) begin : ADDER
            if(i==0)
                FA tmp1(a[i],b[i],cin,tmp[i],sum[i]);
            else
                FA tmp2(a[i],b[i],tmp[i-1],tmp[i],sum[i]);
        end
    endgenerate
    
    assign cout = tmp[99];

endmodule

/*
//simple solution
module top_module (
	input [99:0] a,
	input [99:0] b,
	input cin,
	output cout,
	output [99:0] sum
);

	// The concatenation {cout, sum} is a 101-bit vector.
	assign {cout, sum} = a+b+cin;

endmodule
*/