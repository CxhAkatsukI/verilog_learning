`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 22:45:21
// Design Name: 
// Module Name: test_add_4
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


module test_add_4(

    );
    reg cin;
    reg [3:0] A;
    reg [3:0] B;
    wire [3:0] S;
    wire cout;

    adder_4 instance_adder_4 (
      .cin(cin),
      .num_1(A),
      .num_2(B),
      .result(S),
      .cout(cout)
    );

    initial begin
      cin = 1'b0;
      A = 4'b0000;
      B = 4'b0000;
    end

    always begin
      #2;
      cin = $random() % 2;
      A = $random() % 16;
      B = $random() % 16;
    end
endmodule
