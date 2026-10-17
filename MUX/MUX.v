module MUX(
    input E, S, D1, D0,
    output Y
);
    assign Y = (~E)&S&D1 | (~E)&(~S)&D0;

endmodule