`include "half_adder.sv"
`timescale 1ps/1ps
module half_adder_tb();

logic a, b;
wire sum, carry;

half_adder DUT_half_adder(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
);

initial begin
    $dumpfile("half_adder_tb.vcd");
    $dumpvars(0, half_adder_tb);
    $display("a b sum carry");
    $monitor("%b %b  %b  %b", a, b, sum, carry);

    a = 0; 
    b = 0;
    if (sum || carry) $error("Test 1 failed");
    #1 a = 1;
    #1 if (~sum || carry) $error("Test 2 failed");
    #1 b = 1;
    #1 if (sum || ~carry) $error("Test 3 failed");
    #1 a = 0;
    #1 if (~sum || carry) $error("Test 4 failed");
end

endmodule