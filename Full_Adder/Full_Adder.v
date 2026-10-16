module Full_Adder(
    input A, B, Cin,
    output Y, Cout
);

    assign Y = A^B^Cin;
    assign Cout = (A&B)|(A&Cin)|(B&Cin);
endmodule