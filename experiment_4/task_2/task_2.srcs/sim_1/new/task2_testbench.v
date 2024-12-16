`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/12/05 00:18:13
// Design Name:
// Module Name: task2_testbench
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


module task2_testbench ();

  reg clk, rstn;
  reg [15:0] data;
  reg input_valid, output_enable;
  wire [7:0] out;
  reg read, write;
  wire [4:0] write_addr, read_addr;
  wire input_enable, output_valid;

  task2_module task2_module_inst (
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

  integer counter = 0;
  initial begin
    clk = 1'b0;
    rstn = 1'b1;
    write = 1'b0;
    read = 1'b0;
    input_valid = 1'b0;
    output_enable = 1'b0;
    #1 rstn = 1'b0;
    #2 rstn = 1'b1;
    #5;
  end

  always begin
    input_valid = ~input_valid;
    #4;
  end

  always begin
    output_enable = ~output_enable;
    #6;
  end

  always begin
    #4;
    data[7:0]  = $random() % 9'b100000000;
    data[15:8] = $random() % 9'b100000000;
  end

  always begin
    #5;
    write = 1'b1;
    #6;
    write = 1'b0;
    read  = 1'b1;
    #6;
    write = 1'b1;
    read  = 1'b0;
    #600;
    $finish;
  end
endmodule
