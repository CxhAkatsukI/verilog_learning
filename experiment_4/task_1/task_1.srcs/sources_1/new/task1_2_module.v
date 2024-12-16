`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/12/04 23:33:40
// Design Name:
// Module Name: task2_module
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


module task2_module (
    input clk,
    input rstn,
    input input_valid,
    input output_enable,
    input [15:0] data,
    output reg [4:0] write_addr,
    output reg [4:0] read_addr,
    output reg input_enable,
    output reg output_valid,
    output reg [7:0] out
);

  integer count_w = 0;
  integer count_r = 0;
  reg [7:0] mem[31:0][1:0];

  reg [1:0] write_state;
  reg [1:0] read_state;

  always @(posedge clk) begin
    if (write_addr != 31) begin
      input_enable = 1'b1;
    end else begin
      count_w = count_w + 1;
    end
    if (write_addr != 0) begin
      output_valid = 1'b1;
    end else begin
      output_valid = 1'b0;
    end
  end

  always @(posedge clk or negedge rstn) begin
    if (rstn == 0) begin
      write_addr <= 5'b0;
      read_addr <= 5'b0;
      write_state <= 2'b00;
      read_state <= 2'b00;
      output_valid <= 1'b0;
      input_enable <= 1'b0;
    end else begin

      if (input_valid && input_enable) begin
        mem[write_addr][1] <= data[15:8];
        mem[write_addr][0] <= data[7:0];
        write_addr <= write_addr + 1;
      end

      if (output_valid && output_enable) begin
        if (read_state == 2'b00) begin
          out <= mem[read_addr][0];
          read_state <= 2'b01;
        end else if (read_state == 2'b01) begin
          out <= mem[read_addr][1];
          read_state <= 2'b00;
          read_addr <= read_addr + 1;
        end
      end
    end
  end
endmodule
