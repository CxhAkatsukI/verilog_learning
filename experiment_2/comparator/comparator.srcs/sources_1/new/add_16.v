`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 23:00:00
// Design Name: 
// Module Name: add_16
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
module adder_4m(
    input cin,
    input [3:0] num_1,
    input [3:0] num_2,
    output [3:0] result,
    output pm,
    output gm
    );

    wire [3:0] p;
    wire [3:0] g;
    wire [4:0] c;

    assign p = num_1 ^ num_2;
    assign g = num_1 & num_2;
    assign pm = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
    assign gm = p[3] & p[2] & p[1] & p[0];

    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & (g[0] | (p[0] & c[0])));
    assign c[3] = g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & c[0])))));
    assign c[4] = g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & c[0])))))));
    assign result =  p ^ c[3:0];

endmodule

module add_16(
    input [15:0] num_1,
    input [15:0] num_2,
    input cin,
    output cout,
    output [15:0] result
    );
    

    wire [3:0] p;
    wire [3:0] g;
    wire [4:0] c;


    adder_4m adder_4_1(
    .cin(cin),
    .num_1(num_1[3:0]),
    .num_2(num_2[3:0]),
    .result(result[3:0]),
    .pm(p[0]),
    .gm(g[0])
    );

    adder_4m adder_4_2(
    .cin(c[1]),
    .num_1(num_1[7:4]),
    .num_2(num_2[7:4]),
    .result(result[7:4]),
    .pm(p[1]),
    .gm(g[1])
    );

    adder_4m adder_4_3(
    .cin(c[2]),
    .num_1(num_1[11:8]),
    .num_2(num_2[11:8]),
    .result(result[11:8]),
    .pm(p[2]),
    .gm(g[2])
    );

    adder_4m adder_4_4(
    .cin(c[3]),
    .num_1(num_1[15:12]),
    .num_2(num_2[15:12]),
    .result(result[15:12]),
    .pm(p[3]),
    .gm(g[3])
    );


    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & (g[0] | (p[0] & c[0])));
    assign c[3] = g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & c[0])))));
    assign c[4] = g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & c[0])))))));
    assign cout = c[4];

    
endmodule
