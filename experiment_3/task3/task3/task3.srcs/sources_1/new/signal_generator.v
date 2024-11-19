`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/18 19:35:08
// Design Name: 
// Module Name: signal_generator
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


module signal_generator(
    input clk,
    input rstn,
    output reg out
    );

    localparam S0 = 4'b0000;
    localparam S1 = 4'b0001;
    localparam S2 = 4'b0010;
    localparam S3 = 4'b0011;
    localparam S4 = 4'b0100;
    localparam S5 = 4'b0101;
    localparam S6 = 4'b0110;
    localparam S7 = 4'b0111;
    localparam S8 = 4'b1000;
    localparam S9 = 4'b1001;
    localparam S10 = 4'b1010;
    localparam S11 = 4'b1011;

    reg [3:0] state, next_state;

    always @(posedge clk or negedge rstn) begin
      if (~rstn) begin
        state <= S0;
      end
      else begin
        state <= next_state;
      end
    end

    always @(state) begin
      case(state)
        S0: begin
          next_state = S1;
          out = 1'b0;
        end
        S1: begin
          next_state = S2;
          out = 1'b0;
        end
        S2: begin
          next_state = S3;
          out = 1'b1;
        end
        S3: begin
          next_state = S4;
          out = 1'b0;
        end
        S4: begin
          next_state = S5;
          out = 1'b1;
        end
        S5: begin
          next_state = S6;
          out = 1'b0;
        end
        S6: begin
          next_state = S7;
          out = 1'b0;
        end
        S7: begin
          next_state = S8;
          out = 1'b1;
        end
        S8: begin
          next_state = S9;
          out = 1'b1;
        end
        S9: begin
          next_state = S10;
          out = 1'b0;
        end
        S10: begin
          next_state = S11;
          out = 1'b1;
        end
        S11: begin
          next_state = S0;
          out = 1'b1;
        end
        endcase
    end
endmodule
