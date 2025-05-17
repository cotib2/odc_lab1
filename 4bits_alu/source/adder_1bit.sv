`timescale 1ns / 1ps

module adder_1bit(
    input a,
    input b,
    input carry_in,
    output add,
    output carry_out
    );

logic xor_ab;
logic and_ab;
logic and_cin_xor;

//Pimer Half Adder
xor_gate xor1 (
    .a(a),
    .b(b),
    .y(xor_ab)
);

and_gate and1 (
    .a(a),
    .b(b),
    .y(and_ab)
);

//Segundo Half Adder

xor_gate xor2 (
    .a(xor_ab),
    .b(carry_in),
    .y(add)
);

and_gate and2 (
    .a(xor_ab),
    .b(carry_in),
    .y(and_cin_xor)            
);

// OR final para el carry_out

or_gate or1(
    .a(and_cin_xor),
    .b(and_ab),
    .y(carry_out)
);

endmodule
