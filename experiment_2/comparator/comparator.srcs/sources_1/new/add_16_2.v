`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 11:16:56
// Design Name: 
// Module Name: add_16_2
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


module add_16_2(
    input [15:0] num_1,
    input [15:0] num_2,
    input cin,
    output cout,
    output [15:0] result
    );

    wire [15:0] p;
    wire [15:0] g;
    wire [16:0] c;
    assign p = num_1 ^ num_2;
    assign g = num_1 & num_2;

    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign c[4] = g[3] | (p[3] & c[3]);
    assign c[5] = g[4] | (p[4] & c[4]);
    assign c[6] = g[5] | (p[5] & c[5]);
    assign c[7] = g[6] | (p[6] & c[6]);
    assign c[8] = g[7] | (p[7] & c[7]);
    assign c[9] = g[8] | (p[8] & c[8]);
    assign c[10] = g[9] | (p[9] & c[9]);
    assign c[11] = g[10] | (p[10] & c[10]);
    assign c[12] = g[11] | (p[11] & c[11]);
    assign c[13] = g[12] | (p[12] & c[12]);
    assign c[14] = g[13] | (p[13] & c[13]);
    assign c[15] = g[14] | (p[14] & c[14]);
    assign c[16] = g[15] | (p[15] & c[15]);


    assign cout = c[16];
    assign result = p ^ c[15:0];
endmodule
