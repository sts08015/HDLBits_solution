`timescale 1 ps/1 ps
module top_module ( );
    reg clk;
    /*
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end
    */
    initial clk = 0;
    
    always begin
    	#5;
        clk = ~clk;
    end
    dut clock(clk);
endmodule
