module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
);
    wire w1,w2;
    assign w1 = mode&too_cold;
    assign w2 = ~mode&too_hot;
    assign heater = w1;
    assign aircon = w2;
    assign fan = fan_on | w1 | w2;

endmodule