`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 22:04:28
// Design Name: 
// Module Name: adder_4
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


module adder_4(
    input cin,
    input [3:0] num_1,
    input [3:0] num_2,
    output [3:0] result,
    output cout
    );

    wire [3:0] p;
    wire [3:0] g;
    wire [4:0] c;

    assign p = num_1 | num_2;
    assign g = num_1 & num_2;
    assign c[0] = cin; 
    assign c[1] = g[0] | (p[0] & c[0]); 
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign c[4] = g[3] | (p[3] & c[3]);
    
    assign result = ~ g & p ^ c[3:0];
    assign cout = c[4];

endmodule
