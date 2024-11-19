`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 00:03:16
// Design Name: 
// Module Name: test_add_16
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


module test_add_16(

    );

    reg cin;
    reg [15:0] num_1;
    reg [15:0] num_2;
    wire [15:0] result;
    wire cout;

    add_16 instance_add_16 (
      .cin(cin),
      .num_1(num_1),
      .num_2(num_2),
      .result(result),
      .cout(cout)
    );

    initial begin
      num_1 = 16'b0000000000000000;
      num_2 = 16'b0000000000000000;
      cin = 1'b0;
    end

    always begin
      #2;
      cin = $random() % 2;
      num_1 = $random() % 65535;
      num_2 = $random() % 65535;
    end

endmodule
