`timescale 1ns/1ps

module testbench;

    reg test_A;
    reg test_B;
    reg test_Cin;
    wire test_Y;
    wire test_Cout;

    Full_Adder uut(
        .A(test_A),
        .B(test_B),
        .Cin(test_Cin),
        .Y(test_Y),
        .Cout(test_Cout)
    );
    initial begin
    $dumpfile("waveform.vcd"); // Name of the output file
    $dumpvars(0, testbench); // 0 means dump all signals in this module and below
end

    initial begin
        $monitor("Time = %0d|A = %b|B = %b|Cin = %b|Y = %b|Cout = %b", $time, test_A, test_B, test_Cin, test_Y, test_Cout);

        test_A = 0; test_B = 0; test_Cin = 0;#10;
        test_A = 0; test_B = 0; test_Cin = 1;#10;
        test_A = 0; test_B = 1; test_Cin = 0;#10;
        test_A = 0; test_B = 1; test_Cin = 1;#10;
        test_A = 1; test_B = 0; test_Cin = 0;#10;
        test_A = 1; test_B = 0; test_Cin = 1;#10;
        test_A = 1; test_B = 1; test_Cin = 0;#10;
        test_A = 1; test_B = 1; test_Cin = 1;#10;
        $finish;
    end
endmodule