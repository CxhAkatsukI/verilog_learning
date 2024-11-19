`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 16:23:07
// Design Name: 
// Module Name: add_32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module adder_component_clu(
  input [3:0] g,
  input [3:0] p,
  input ci,
  output [3:0] c
);
	assign c[0]=g[0]|ci&p[0];
	assign c[1]=g[1]|g[0]&p[1]|ci&p[1]&p[0];
	assign c[2]=g[2]|g[1]&p[2]|g[0]&p[2]&p[1]|ci&p[2]&p[1]&p[0];
	assign c[3]=g[3]|g[2]&p[3]|g[1]&p[3]&p[2]|g[0]&p[3]&p[2]&p[1]|ci&p[3]&p[2]&p[1]&p[0];

endmodule

module adder_component_tu(
  input [3:0] g,
  input [3:0] p,
  output [3:0] t
);
  assign t = ~g & p;

endmodule

module adder_component_pg_generator(
  input a,
  input b,
  
  output g,
  output p
);
  assign g = a & b;
  assign p = a | b;

endmodule

module adder_4m1(
    input cin,
    input [3:0] num_1,
    input [3:0] num_2,
    output [3:0] result,
    output [3:0] c
    //output pm,
    //output gm
    );

    wire [3:0] p_cla;
    wire [3:0] g_cla;
    wire [3:0] t_cla;
    wire [3:0] co_clu;

    adder_component_pg_generator PG0 (
    .a(num_1[0]),
    .b(num_2[0]),
    .g(g_cla[0]),
    .p(p_cla[0])
    );

    adder_component_pg_generator PG1 (
      .a(num_1[1]),
      .b(num_2[1]),
      .g(g_cla[1]),
      .p(p_cla[1])
    );

    adder_component_pg_generator PG2 (
      .a(num_1[2]),
      .b(num_2[2]),
      .g(g_cla[2]),
      .p(p_cla[2])
    );

    adder_component_pg_generator PG3 (
      .a(num_1[3]),
      .b(num_2[3]),
      .g(g_cla[3]),
      .p(p_cla[3])
    );

    adder_component_tu TU(
      .g(g_cla),
      .p(p_cla),
      .t(t_cla)
    );

    adder_component_clu CLU(
      .p(p_cla),
      .g(g_cla),
      .ci(cin),
      .c(co_clu)
    );

    assign result[0] = t_cla[0] ^ cin;
    assign result[1] = t_cla[1] ^ co_clu[0];
    assign result[2] = t_cla[2] ^ co_clu[1];
    assign result[3] = t_cla[3] ^ co_clu[2];
    assign c = {co_clu[2], co_clu[1], co_clu[0], cin};
   // assign pm = g_cla[3] | (p_cla[3] & g_cla[2]) | (p_cla[3] & p_cla[2] & g_cla[1]) | (p_cla[3] & p_cla[2] & p_cla[1] & g_cla[0]);
   // assign gm = p_cla[3] & p_cla[2] & p_cla[1] & p_cla[0];
endmodule

module pggenerator(
    input cin,
    input [3:0] p,
    input [3:0] g,
    output pm,
    output gm,
    output [3:0] c
    );

    wire [3:0] co_clu;

    adder_component_clu CLU(
      .p(p),
      .g(g),
      .ci(cin),
      .c(co_clu)
    );

    assign c[0] = cin;
    assign c[1] = co_clu[0];
    assign c[2] = co_clu[1];
    assign c[3] = co_clu[2];
    assign pm = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
    assign gm = p[3] & p[2] & p[1] & p[0];
endmodule

module cla_component_pgm_generator(
  input [3:0] num_1,
  input [3:0] num_2,

  output pm,
  output gm
);

    wire [3:0] g;
    wire [3:0] p;

      adder_component_pg_generator PG0 (
    .a(num_1[0]),
    .b(num_2[0]),
    .g(g[0]),
    .p(p[0])
    );

    adder_component_pg_generator PG1 (
      .a(num_1[1]),
      .b(num_2[1]),
      .g(g[1]),
      .p(p[1])
    );

    adder_component_pg_generator PG2 (
      .a(num_1[2]),
      .b(num_2[2]),
      .g(g[2]),
      .p(p[2])
    );

    adder_component_pg_generator PG3 (
      .a(num_1[3]),
      .b(num_2[3]),
      .g(g[3]),
      .p(p[3])
    );

  assign gm=g[3]|g[2]&p[3]|g[1]&p[3]&p[2]|g[0]&p[3]&p[2]&p[1];
	assign pm=p[3]&p[2]&p[1]&p[0];

endmodule

module cla_generate_from_pg (
  input [3:0] g,
	input [3:0] p,
	
	output gm,
	output pm
);
	
	assign gm=g[3]|g[2]&p[3]|g[1]&p[3]&p[2]|g[0]&p[3]&p[2]&p[1];
	assign pm=p[3]&p[2]&p[1]&p[0];
	
endmodule

module add_32(
      input [31:0] num_1,
      input [31:0] num_2,
      input cin,
      output cout,
      output [31:0] result
    );
      wire [31:0] c;
      wire [15:0] p_and_g;
      wire [3:0] p_and_g_11;
      wire [3:0] carry_9;
      wire [3:0] carry_10;
      wire [3:0] carry_11;

    adder_4m1 adder_4m_1(
      .cin(cin),
      .num_1(num_1[3:0]),
      .num_2(num_2[3:0]),
      .result(result[3:0]),
      //.pm(p_and_g[1]),
      //.gm(p_and_g[0]),
      .c(c[3:0])
    );

    cla_component_pgm_generator PG1 (
      .num_1(num_1[3:0]),
      .num_2(num_2[3:0]),
      .pm(p_and_g[1]),
      .gm(p_and_g[0])
    );


    adder_4m1 adder_4m_2(
      .cin(carry_9[1]),
      .num_1(num_1[7:4]),
      .num_2(num_2[7:4]),
      .result(result[7:4]),
//      .pm(p_and_g[3]),
//      .gm(p_and_g[2]),
      .c(c[7:4])
    );

    cla_component_pgm_generator PG2 (
      .num_1(num_1[7:4]),
      .num_2(num_2[7:4]),
      .pm(p_and_g[3]),
      .gm(p_and_g[2])
    );

    adder_4m1 adder_4m_3(
      .cin(carry_9[2]),
      .num_1(num_1[11:8]),
      .num_2(num_2[11:8]),
      .result(result[11:8]),
      //.pm(p_and_g[5]),
      //.gm(p_and_g[4]),
      .c(c[11:8])
    );

    cla_component_pgm_generator PG3 (
      .num_1(num_1[11:8]),
      .num_2(num_2[11:8]),
      .pm(p_and_g[5]),
      .gm(p_and_g[4])
    );
    
    adder_4m1 adder_4m_4(
      .cin(carry_9[3]),
      .num_1(num_1[15:12]),
      .num_2(num_2[15:12]),
      .result(result[15:12]),
      //.pm(p_and_g[7]),
      //.gm(p_and_g[6]),
      .c(c[15:12])
    );

    cla_component_pgm_generator PG4 (
      .num_1(num_1[15:12]),
      .num_2(num_2[15:12]),
      .pm(p_and_g[7]),
      .gm(p_and_g[6])
    );

    adder_4m1 adder_4m_5(
      .cin(carry_11[1]),
      .num_1(num_1[19:16]),
      .num_2(num_2[19:16]),
      .result(result[19:16]),
      //.pm(p_and_g[9]),
      //.gm(p_and_g[8]),
      .c(c[19:16])
    );

   cla_component_pgm_generator PG5 (
      .num_1(num_1[19:16]),
      .num_2(num_2[19:16]),
      .pm(p_and_g[9]),
      .gm(p_and_g[8])
    );

    adder_4m1 adder_4m_6(
      .cin(carry_10[1]),
      .num_1(num_1[23:20]),
      .num_2(num_2[23:20]),
      .result(result[23:20]),
      //.pm(p_and_g[11]),
      //.gm(p_and_g[10]),
      .c(c[23:20])
    );

    cla_component_pgm_generator PG6 (
      .num_1(num_1[23:20]),
      .num_2(num_2[23:20]),
      .pm(p_and_g[11]),
      .gm(p_and_g[10])
    );

    adder_4m1 adder_4m_7(
      .cin(carry_10[2]),
      .num_1(num_1[27:24]),
      .num_2(num_2[27:24]),
      .result(result[27:24]),
      //.pm(p_and_g[13]),
      //.gm(p_and_g[12]),
      .c(c[27:24])
    );

    cla_component_pgm_generator PG7 (
      .num_1(num_1[27:24]),
      .num_2(num_2[27:24]),
      .pm(p_and_g[13]),
      .gm(p_and_g[12])
    );

    adder_4m1 adder_4m_8(
      .cin(carry_10[3]),
      .num_1(num_1[31:28]),
      .num_2(num_2[31:28]),
      .result(result[31:28]),
      //.pm(p_and_g[15]),
      //.gm(p_and_g[14]),
      .c(c[31:28])
    );

    cla_component_pgm_generator PG8 (
      .num_1(num_1[31:28]),
      .num_2(num_2[31:28]),
      .pm(p_and_g[15]),
      .gm(p_and_g[14])
    );

    cla_generate_from_pg PG9 (
      .p({p_and_g[7], p_and_g[5], p_and_g[3], p_and_g[1]}),
      .g({p_and_g[6], p_and_g[4], p_and_g[2], p_and_g[0]}),
      .pm(p_and_g_11[1]),
      .gm(p_and_g_11[0])
    );

    pggenerator pggenerator_9(
      .p({p_and_g[7], p_and_g[5], p_and_g[3], p_and_g[1]}),
      .g({p_and_g[6], p_and_g[4], p_and_g[2], p_and_g[0]}),
      //.pm(p_and_g_11[1]),
      //.gm(p_and_g_11[0]),
      .cin(cin),
      .c(carry_9)
    );

    pggenerator pggenerator_10(
      .p({p_and_g[15], p_and_g[13], p_and_g[11], p_and_g[9]}),
      .g({p_and_g[14], p_and_g[12], p_and_g[10], p_and_g[8]}),
      .pm(p_and_g_11[3]),
      .gm(p_and_g_11[2]),
      .cin(carry_11[1]),
      .c(carry_10)
    );

    pggenerator pggenerator_11(
      .p({1'b0, 1'b0, 1'b0, p_and_g_11[1]}),
      .g({1'b0, 1'b0, 1'b0, p_and_g_11[0]}),
      .pm(),
      .gm(),
      .cin(cin),
      .c(carry_11)
    );

    assign cout = c[31];

endmodule
