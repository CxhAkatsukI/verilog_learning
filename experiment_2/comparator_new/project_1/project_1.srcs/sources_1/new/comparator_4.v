`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 17:23:51
// Design Name: 
// Module Name: comparator_4
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


module comparator_4(
    input [3:0] A,
    input [3:0] B,
    output reg out_A_G_B,
    output reg out_A_E_B,
    output reg out_A_L_B,
    input in_A_G_B,
    input in_A_E_B,
    input in_A_L_B
  );

    wire [2:0] control;
    assign control = {in_A_G_B, in_A_L_B, in_A_E_B};

    always @(*) begin
      if (control == 3'b001) begin
        if (A > B) begin
          out_A_G_B = 1'b1;
          out_A_L_B = 1'b0;
          out_A_E_B = 1'b0;
        end
        else if (A < B) begin
          out_A_G_B = 1'b0;
          out_A_L_B = 1'b1;
          out_A_E_B = 1'b0;
        end
        else if (A == B) begin
          out_A_G_B = 1'b0;
          out_A_L_B = 1'b0;
          out_A_E_B = 1'b1;
        end
      end
      else if (control == 3'b100) begin
        out_A_G_B = in_A_G_B;
        out_A_L_B = in_A_L_B;
        out_A_E_B = in_A_E_B;
      end
      else if (control == 3'b010) begin 
        out_A_G_B = in_A_G_B;
        out_A_L_B = in_A_L_B;
        out_A_E_B = in_A_E_B;
      end
    end
endmodule
