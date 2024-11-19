`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 21:09:41
// Design Name: 
// Module Name: comparator_16
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



module comparator_16(
    input [15:0] A,
    input [15:0] B,
    input in_A_G_B,
    input in_A_L_B,
    input in_A_E_B,
    output out_A_G_B,
    output out_A_L_B,
    output out_A_E_B
    );

    wire [2:0] result4;
    wire [2:0] result3;
    wire [2:0] result2;

    comparator_4 comparator_4_4(
    .A(A[15:12]),
    .B(B[15:12]),
    .in_A_G_B(in_A_G_B),
    .in_A_L_B(in_A_L_B),
    .in_A_E_B(in_A_E_B),
    .out_A_G_B(result4[2]),
    .out_A_L_B(result4[1]),
    .out_A_E_B(result4[0])
    );

    comparator_4 comparator_4_3(
    .A(A[11:8]),
    .B(B[11:8]),
    .in_A_G_B(result4[2]),
    .in_A_L_B(result4[1]),
    .in_A_E_B(result4[0]),
    .out_A_G_B(result3[2]),
    .out_A_L_B(result3[1]),
    .out_A_E_B(result3[0])
    );

    comparator_4 comparator_4_2(
    .A(A[7:4]),
    .B(B[7:4]),
    .in_A_G_B(result3[2]),
    .in_A_L_B(result3[1]),
    .in_A_E_B(result3[0]),
    .out_A_G_B(result2[2]),
    .out_A_L_B(result2[1]),
    .out_A_E_B(result2[0])
    );

    comparator_4 comparator_4_1(
    .A(A[3:0]),
    .B(B[3:0]),
    .in_A_G_B(result2[2]),
    .in_A_L_B(result2[1]),
    .in_A_E_B(result2[0]),
    .out_A_G_B(out_A_G_B),
    .out_A_L_B(out_A_L_B),
    .out_A_E_B(out_A_E_B)
    );
endmodule
