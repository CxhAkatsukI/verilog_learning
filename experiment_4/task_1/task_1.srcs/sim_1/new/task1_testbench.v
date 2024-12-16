`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/12/04 16:40:56
// Design Name:
// Module Name: task1_testbench
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


module task1_testbench ();

  reg clk, rstn;
  reg [7:0] data;
  reg input_valid, output_enable;
  wire [15:0] out;
  wire [4:0] write_addr, read_addr;
  wire input_enable, output_valid;

  task1_module task1_module_inst (
      .clk(clk),
      .rstn(rstn),
      .input_valid(input_valid),
      .output_enable(output_enable),
      .data(data),
      .out(out),
      .write_addr(write_addr),
      .read_addr(read_addr),
      .input_enable(input_enable),
      .output_valid(output_valid)
  );


  always #2 begin
    clk = ~clk;
  end

  initial begin
    clk  = 1'b0;
    rstn = 1'b1;
    #0.1 rstn = 1'b0;
    #0.2 rstn = 1'b1;
    input_valid = 1'b1;
  end

  always begin
    data = $random() % 9'b1_0000_0000;
    input_valid = 1'b1;
    output_enable = 1'b1;
    #4;
  end

  always begin
    #5;
    #6;
    #6;
    #360;
    rstn = 0;
    #4;
    rstn = 0;
    #370;
    $finish;
  end
endmodule
