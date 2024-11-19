`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 17:34:49
// Design Name: 
// Module Name: test_add_32
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


module test_add_32(

    );
    reg [31:0] A;
    reg [31:0] B;
    reg cin;
    wire [31:0] S;
    wire cout;

    add_32 instance_add_32 (
      .num_1(A),
      .num_2(B),
      .cin(cin),
      .result(S),
      .cout(cout)
    );

    initial begin
      A = 32'b00000000000000000000000000000000;
      B = 32'b00000000000000000000000000000000;
      cin = 1'b0;
    end

    always begin
      #2;
      cin = $random() % 2;
      A = $urandom() % 4294967295;
      B = $urandom() % 4294967295;
    end

endmodule
