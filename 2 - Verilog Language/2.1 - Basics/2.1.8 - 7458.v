module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire w1 = p1a&p1c&p1b;
    wire w2 = p1f&p1e&p1d;
    assign p1y = w1|w2;
    
    wire w3 = p2a&p2b;
    wire w4 = p2c&p2d;
    assign p2y = w3|w4;
endmodule