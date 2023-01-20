module top_module ();
    reg clk;
    reg reset;
    reg t;
    wire q;
    
    initial begin
        clk = 0;
        reset = 0;
        t = 0;
        #5;
        reset = 1;
        #5;
        reset = 0;
    end
    
    always begin
        #5;
        clk = ~clk;
    end
    
    always@(posedge clk) begin
        if(reset) begin
            t <= 1'b0;
        end else begin
            t <= 1'b1;
        end
    end
    
    tff test(clk,reset,t,q);
endmodule