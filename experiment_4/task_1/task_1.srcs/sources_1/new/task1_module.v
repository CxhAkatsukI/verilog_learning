`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/12/04 16:10:23
// Design Name:
// Module Name: task1_module
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


module task1_module (
    input clk,
    input rstn,
    input input_valid,
    input output_enable,
    input [7:0] data,
    output reg [4:0] write_addr,
    output reg [4:0] read_addr,
    output reg input_enable,
    output reg output_valid,
    output reg [15:0] out
);

  reg fifo_empty;
  reg fifo_full;
  reg input_enable_next = 1'b1;

  reg [7:0] mem[31:0][1:0];

  reg [1:0] write_state;
  reg [1:0] read_state;

  always @(posedge clk) begin
    if (read_addr == 31) begin
      fifo_empty   = 1'b1;
      input_enable = 1'b1;
      output_valid = 1'b0;
    end else begin
      fifo_empty   = 1'b0;
      input_enable = 1'b0;
      output_valid = 1'b1;
    end
    if (write_addr == 31 && write_state == 2'b01) begin
      fifo_full = 1'b1;
      input_enable_next <= 1'b0;
      output_valid <= 1'b1;
    end else begin
      fifo_full = 1'b0;
      input_enable = 1'b1;
      output_valid = 1'b0;
    end
  end

  always begin
    #8;
    input_enable <= input_enable_next;
  end

  always @(posedge clk or negedge rstn) begin
    if (rstn == 0) begin
      write_addr <= 5'b0;
      read_addr <= 5'b0;
      write_state <= 2'b00;
      read_state <= 2'b00;
      fifo_empty <= 1'b1;
      fifo_full <= 1'b0;
      output_valid <= 1'b0;
      input_enable <= 1'b0;
    end else begin

      if (input_valid && input_enable) begin
        if (write_state == 2'b00) begin
          mem[write_addr][0] <= data;
          write_state <= 2'b01;
        end
        if (write_state == 2'b01) begin
          mem[write_addr][1] <= data;
          write_state <= 2'b00;
          write_addr <= write_addr + 1;
        end
      end

      if (output_valid && output_enable) begin
        out <= {mem[read_addr][1], mem[read_addr][0]};
        read_addr <= read_addr + 1;
      end
    end
  end
endmodule
