`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 19:10:11
// Design Name: 
// Module Name: test_comparator_4
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


module test_comparator_4(

    );
    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] prev;
    wire [2:0] result;

    comparator_4 instance_comparator_4 (
      .A(a),
      .B(b),
      .in_A_G_B(prev[2]),
      .in_A_L_B(prev[1]),
      .in_A_E_B(prev[0]),
    );

    initial begin
      a = 4'b0000;
      b = 4'b0000;
      prev = 3'b001;
    end

    always begin
      #2;
      a = $random() % 16;
      b = $random() % 16;
      case ($random() % 3)
        0: prev = 3'b001;
        1: prev = 3'b100;
        2: prev = 3'b010;
      endcase
    end
endmodule
