`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/19 17:45:54
// Design Name: 
// Module Name: four_bit_adder
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


module four_bit_adder (
    input [3:0] A,         // 4-bit input A
    input [3:0] B,         // 4-bit input B
    input Cin,             // Carry input
    output [3:0] Sum,      // 4-bit output Sum
    output Cout            // Carry output
);
    wire [3:0] G, P;       // Generate and Propagate signals
    wire [3:0] C;          // Internal carry signals

    // Generate and Propagate signals
    assign G = A & B;      // Generate: G[i] = A[i] & B[i]
    assign P = A ^ B;      // Propagate: P[i] = A[i] ^ B[i]

    // Carry signals
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);

    // Sum and Carry output
    assign Sum = P ^ C[3:0];
    assign Cout = G[3] | (P[3] & C[3]);
endmodule

