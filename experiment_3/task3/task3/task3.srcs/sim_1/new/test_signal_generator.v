`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/18 19:48:09
// Design Name: 
// Module Name: test_signal_generator
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


module test_signal_generator(

    );
    reg clk;
    reg rstn;
    wire out;

    signal_generator instance_signal_generator(
      .clk(clk),
      .rstn(rstn),
      .out(out)
      );

    initial begin
      clk = 0;
      rstn = 1;
      #0.1 rstn = 0;
      #0.1 rstn = 1;
    end

    always begin
      #0.5 clk = ~clk;
    end
endmodule
