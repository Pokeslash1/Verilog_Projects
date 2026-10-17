`timescale 1ns/1ps

module testbench;

    reg test_E;
    reg test_S;
    reg test_D0;
    reg test_D1;
    wire test_Y;

    MUX uut(
        .E(test_E),
        .S(test_S),
        .D0(test_D0),
        .D1(test_D1),
        .Y(test_Y)
    );

    initial begin
        $monitor("Time = %0d|E = %b|S = %b|D0 = %b|D1 = %b|Y = %b", $time, test_E, test_S, test_D0, test_D1, test_Y);
        test_E = 0; test_S = 0; test_D0 = 0; test_D1 = 0; #10;
        test_E = 0; test_S = 0; test_D0 = 0; test_D1 = 1; #10;
        test_E = 0; test_S = 0; test_D0 = 1; test_D1 = 0; #10;
        test_E = 0; test_S = 0; test_D0 = 1; test_D1 = 1; #10;
        test_E = 0; test_S = 1; test_D0 = 0; test_D1 = 0; #10;
        test_E = 0; test_S = 1; test_D0 = 0; test_D1 = 1; #10;
        test_E = 0; test_S = 1; test_D0 = 1; test_D1 = 0; #10;
        test_E = 0; test_S = 1; test_D0 = 1; test_D1 = 1; #10;
        test_E = 1; test_S = 0; test_D0 = 0; test_D1 = 0; #10;
        test_E = 1; test_S = 0; test_D0 = 0; test_D1 = 1; #10;
        test_E = 1; test_S = 0; test_D0 = 1; test_D1 = 0; #10;
        test_E = 1; test_S = 0; test_D0 = 1; test_D1 = 1; #10;
        test_E = 1; test_S = 1; test_D0 = 0; test_D1 = 0; #10;
        test_E = 1; test_S = 1; test_D0 = 0; test_D1 = 1; #10;
        test_E = 1; test_S = 1; test_D0 = 1; test_D1 = 0; #10;
        test_E = 1; test_S = 1; test_D0 = 1; test_D1 = 1; #10;
        $finish;
    end
endmodule
