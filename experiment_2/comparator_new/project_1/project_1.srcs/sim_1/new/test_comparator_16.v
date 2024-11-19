`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 21:14:34
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


module test_comparator_16();
    reg [15:0] A;
    reg [15:0] B;
    reg in_A_G_B;
    reg in_A_L_B;
    reg in_A_E_B;
    wire out_A_G_B;
    wire out_A_L_B;
    wire out_A_E_B;

    comparator_16 instance_comparator_16(
      .A(A),
      .B(B),
      .in_A_G_B(in_A_G_B),
      .in_A_L_B(in_A_L_B),
      .in_A_E_B(in_A_E_B),
      .out_A_G_B(out_A_G_B),
      .out_A_L_B(out_A_L_B),
      .out_A_E_B(out_A_E_B)
    );

    initial begin
      A = 16'b0000000000000000;
      B = 16'b0000000000000000;
      in_A_G_B = 1'b0;
      in_A_L_B = 1'b0;
      in_A_E_B = 1'b1;
    end

    always begin
      #2;
      A = $random() % 65536;
      B = $random() % 65536;
      case ($random() % 3)
      0: begin
        in_A_G_B = 1'b1;
        in_A_L_B = 1'b0;
        in_A_E_B = 1'b0;
      end
      1: begin
        in_A_G_B = 1'b0;
        in_A_L_B = 1'b1;
        in_A_E_B = 1'b0;
      end
      2: begin
        in_A_G_B = 1'b0;
        in_A_L_B = 1'b0;
        in_A_E_B = 1'b1;
      end
      endcase
    end
endmodule
