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
    reg [15:0] num_1;
    reg [15:0] num_2;
    reg [2:0] control;
    wire [2:0] out;


    comparator_16 instance_comparator_16(
      .A(num_1),
      .B(num_2),
      .control(control),
      .out(out)
    );

    initial begin
      num_1 = 16'b0000000000000000;
      num_2 = 16'b0000000000000000;
      control = 3'b001;
    end

    always begin
      #2;
      num_1 = $random() % 65536;
      num_2 = $random() % 65536;
      case ($random() % 3)
      0: control = 3'b001;
      1: control = 3'b100;
      2: control = 3'b010;
      endcase
    end
endmodule
