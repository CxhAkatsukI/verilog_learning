`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 10:45:07
// Design Name: 
// Module Name: add_1
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


module add_1(
    input in_a,
    input in_b,
    input cin,
    output cout,
    output sum
    );
    assign sum = in_a ^ in_b ^ cin;
    assign cout = (in_a & in_b) | ((in_a ^ in_b) & cin);
endmodule
