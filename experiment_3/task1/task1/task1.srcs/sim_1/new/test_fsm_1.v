`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/18 17:04:38
// Design Name: 
// Module Name: test_fsm_1
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


module test_fsm_1(
    );
    reg clk;
    reg rstn;
    reg in;
    wire out;

    fsm_1 instance_fsm_1(
      .clk(clk),
      .rstn(rstn),
      .in(in),
      .out(out)
      );

    initial begin
      clk = 0;
      rstn = 1;
      #0.1 rstn = 0;
      #1.1 rstn = 1;
    end

    initial begin
      in = 0;
      #1 in = 0;
      #1 in = 1;
      #1 in = 1;
      #1 in = 0;
      #1 in = 1;
      #1 in = 0;
      #1 in = 0;
    end

    always begin
      #1 in = $random() % 2;
    end

    always begin
      #0.5 clk = ~clk;
    end
endmodule
