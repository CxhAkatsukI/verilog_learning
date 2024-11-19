`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 10:50:30
// Design Name: 
// Module Name: test_add_1
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


module test_add_1();
    reg a;
    reg b;
    reg in_carry;
    wire out_carry;
    wire result;

    add_1 instance_add1(
      .in_a(a),
      .in_b(b),
      .cin(in_carry),
      .cout(out_carry),
      .sum(result)
    );
    initial begin
      a = 1'b1;
      b = 1'b0;
      in_carry = 1'b0;
    end
    always begin
      #2;
      a = $random() % 2;
      b = $random() % 2;
      in_carry = $random() % 2;
    end
endmodule
