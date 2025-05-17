`timescale 1ns / 1ps

module alu(
    input a_in_0,
    input a_in_1,
    input a_in_2,
    input a_in_3,
    input b_in_0,
    input b_in_1,
    input b_in_2,
    input b_in_3,
    input alu_op_0,
    input alu_op_1,
    input alu_op_2,
    output alu_result_0,
    output alu_result_1,
    output alu_result_2,
    output alu_result_3,
    output zero_flag,
    output carry_flag
    );
    
    //assign a_in_0 = alu_result_0;
    //assign a_in_1 = alu_result_1;
    //assign a_in_2 = alu_result_2;
    //assign a_in_3 = alu_result_3;
    
    logic m_zero;
    assign m_zero = 1'b0;
    logic m_one;
    assign m_one = 1'b1;

       
    //------------------------- AND (000) -------------------------
    logic and_out_0;
    logic and_out_1;
    logic and_out_2;
    logic and_out_3;

    and_gate and_gate0(
        .a(a_in_0),
        .b(b_in_0),
        .y(and_out_0)
    );
     and_gate and_gate1(
        .a(a_in_1),
        .b(b_in_1),
        .y(and_out_1)
    );
    
    and_gate and_gate2(
        .a(a_in_2),
        .b(b_in_2),
        .y(and_out_2)
    );
    
    and_gate and_gate3(
        .a(a_in_3),
        .b(b_in_3),
        .y(and_out_3)
    );
    
    // salida and_out_0, and_out_1, and_out_2, and_out_3
    
    //------------------------- OR  (001) -------------------------
    logic or_out_0;
    logic or_out_1;
    logic or_out_2;
    logic or_out_3;

    or_gate or_gate0(
        .a(a_in_0),
        .b(b_in_0),
        .y(or_out_0)
    );
     or_gate or_gate1(
        .a(a_in_1),
        .b(b_in_1),
        .y(or_out_1)
    );
    
    or_gate or_gate2(
        .a(a_in_2),
        .b(b_in_2),
        .y(or_out_2)
    );
    
    or_gate or_gate3(
        .a(a_in_3),
        .b(b_in_3),
        .y(or_out_3)
    );
    
    // salida or_out_0, or_out_1, or_out_2, or_out_3
    
    //------------------------- ADD (010) -------------------------
    logic sum_0;
    logic cout_1;
    logic sum_1;
    logic cout_2;
    logic sum_2;
    logic cout_3;
    logic sum_3;
    logic sum_cout;
    
    adder_1bit adder1(
        .a(a_in_0),
        .b(b_in_0),
        .carry_in(m_zero),
        .add(sum_0),
        .carry_out(cout_1)
   );
    
    adder_1bit adder2(
        .a(a_in_1),
        .b(b_in_1),
        .carry_in(cout_1),
        .add(sum_1),
        .carry_out(cout_2)
    );    
    
    adder_1bit adder3(
        .a(a_in_2),
        .b(b_in_2),
        .carry_in(cout_2),
        .add(sum_2),
        .carry_out(cout_3)
    );
    
    adder_1bit adder4(
        .a(a_in_3),
        .b(b_in_3),
        .carry_in(cout_3),
        .add(sum_3),
        .carry_out(sum_cout)
    );
    
    // salidas: sum_1, sum_2, sum_3, sum_4, sum_cout. 
    
    //------------------------- SUB (110) -------------------------
    
    logic not_b0;
    logic not_b1;
    logic not_b2;
    logic not_b3;
    
    logic aux_s0;
    logic aux_s1;
    logic aux_s2;
    logic aux_s3;
    
    logic aux_c0;
    logic aux_c1;
    logic aux_c2;
    logic aux_c3;
    
    not_gate not_b_0 (
                .a(b_in_0),
                .y(not_b0)
    );
    
    not_gate not_b_1 (
                .a(b_in_1),
                .y(not_b1)
    );
    
    not_gate not_b_2 (
                .a(b_in_2),
                .y(not_b2)
    );
    
    not_gate not_b_3 (
                .a(b_in_3),
                .y(not_b3)
    );  
    
    adder_1bit add_one0(
        .a(not_b0),
        .b(m_one),
        .carry_in(m_zero),
        .add(aux_s0),
        .carry_out(aux_c0)
   );
    
    adder_1bit add_one1(
        .a(not_b1),
        .b(m_zero),
        .carry_in(aux_c0),
        .add(aux_s1),
        .carry_out(aux_c1)
    );    
    
    adder_1bit add_one2(
        .a(not_b2),
        .b(m_zero),
        .carry_in(aux_c1),
        .add(aux_s2),
        .carry_out(aux_c2)
    );
    
    adder_1bit add_one3(
        .a(not_b3),
        .b(m_zero),
        .carry_in(aux_c2),
        .add(aux_s3),
        .carry_out(aux_c3)
    );
    
    logic r_sum_0;
    logic r_cout_1;
    logic r_sum_1;
    logic r_cout_2;
    logic r_sum_2;
    logic r_cout_3;
    logic r_sum_3;
    logic r_sum_cout;
    
    adder_1bit r_adder1(
        .a(a_in_0),
        .b(aux_s0),
        .carry_in(m_zero),
        .add(r_sum_0),
        .carry_out(r_cout_1)
   );
    
    adder_1bit r_adder2(
        .a(a_in_1),
        .b(aux_s1),
        .carry_in(r_cout_1),
        .add(r_sum_1),
        .carry_out(r_cout_2)
    );    
    
    adder_1bit r_adder3(
        .a(a_in_2),
        .b(aux_s2),
        .carry_in(r_cout_2),
        .add(r_sum_2),
        .carry_out(r_cout_3)
    );
    
    adder_1bit r_adder4(
        .a(a_in_3),
        .b(aux_s3),
        .carry_in(r_cout_3),
        .add(r_sum_3),
        .carry_out(r_sum_cout)
    );
    
    //------------------------- PIB (111) -------------------------
    
    //---------------------------- MUX ----------------------------
    mux8_1 mux_out_0 (
        .d0(and_out_0),  
        .d1(or_out_0),  
        .d2(sum_0),  
        .d3(m_zero), 
        .d4(m_zero),  
        .d5(m_zero),  
        .d6(r_sum_0),  
        .d7(b_in_0),  
        .sel_0(alu_op_0),
        .sel_1(alu_op_1),
        .sel_2(alu_op_2),
        .y(alu_result_0)                //salida alu_result_0
    );

    mux8_1 mux_out_1 (
        .d0(and_out_1),  
        .d1(or_out_1), 
        .d2(sum_1),  
        .d3(m_zero), 
        .d4(m_zero),  
        .d5(m_zero),  
        .d6(r_sum_1),  
        .d7(b_in_1),  
        .sel_0(alu_op_0),
        .sel_1(alu_op_1),
        .sel_2(alu_op_2),
        .y(alu_result_1)                //salida alu_result_1
    );

    mux8_1 mux_out_2 (
        .d0(and_out_2),  
        .d1(or_out_2),  
        .d2(sum_2),  
        .d3(m_zero),  
        .d4(m_zero),  
        .d5(m_zero),  
        .d6(r_sum_2),  
        .d7(b_in_2),  
        .sel_0(alu_op_0),
        .sel_1(alu_op_1),
        .sel_2(alu_op_2),
        .y(alu_result_2)                //salida alu_result_2
    );

    mux8_1 mux_out_3 (
        .d0(and_out_3),  
        .d1(or_out_3),  
        .d2(sum_3),  
        .d3(m_zero),  
        .d4(m_zero),  
        .d5(m_zero),  
        .d6(r_sum_3),  
        .d7(b_in_3),  
        .sel_0(alu_op_0),
        .sel_1(alu_op_1),
        .sel_2(alu_op_2),
        .y(alu_result_3)                //salida alu_result_3
    );
    
    //--------------------------- FLAGS ---------------------------
    mux8_1 mux_out_carry (
        .d0(m_zero),  
        .d1(m_zero),  
        .d2(sum_cout),  
        .d3(m_zero),  
        .d4(m_zero),  
        .d5(m_zero),  
        .d6(r_sum_cout),
        .d7(m_zero),  
        .sel_0(alu_op_0),
        .sel_1(alu_op_1),
        .sel_2(alu_op_2),
        .y(carry_flag)                  //salida carry_flag
    );    
    
    logic and_fzero_out1;
    logic and_fzero_out2;
    logic and_fzero_out;
    
    and_gate and_gate_fzero_1(
        .a(alu_result_0),
        .b(alu_result_1),
        .y(and_fzero_out1)
    );
    
    and_gate and_gate_fzero_2(
        .a(alu_result_2),
        .b(alu_result_3),
        .y(and_fzero_out2)
    );
    
    and_gate and_gate_fzero(
        .a(and_fzero_out1),
        .b(and_fzero_out2),
        .y(and_fzero_out)
    );
    
    not_gate not_zflag(
        .a(and_fzero_out),
        .y(zero_flag)                   //salida zero_flag
    );
    
endmodule
