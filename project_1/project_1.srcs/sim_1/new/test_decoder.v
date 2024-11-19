`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 11:28:47
// Design Name: 
// Module Name: test_decoder
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


module test_decoder();
    reg [2:0] a;
    reg signal;
    wire [7:0] b;
    decoder instance_decoder(
      .in(a), .out(b), .signal(signal)
    );
initial begin
  a = 3'b000;
end
always begin
  #2;
  signal = $random() % 2;
  a = $random() % 8;
end
endmodule
