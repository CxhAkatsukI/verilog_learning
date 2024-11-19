`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/18 16:41:04
// Design Name: 
// Module Name: fsm_1
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


module fsm_1(
    input clk,
    input rstn,
    input in,
    output reg out
    );
    
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;

    reg [2:0] state, next_state;

    always @(posedge clk or negedge rstn) begin
      if (~rstn) begin
          state <= S0;
      end
      else begin
          state <= next_state;
      end
    end

    always @(state or in) begin
      case(state)
        S0: begin
          if(in) begin
            next_state = S0;
          end
          else begin
            next_state = S1;
          end
        end
        S1: begin
          if(in) begin
            next_state = S2;
          end
          else begin
            next_state = S1;
          end
        end
        S2: begin
          if(in) begin
            next_state = S3;
          end
          else begin
            next_state = S1;
          end
        end
        S3: begin
          if(in) begin
            next_state = S0;
          end
          else begin
            next_state = S4;
          end
        end
        S4: begin
          if(in) begin
            next_state = S2;
          end
          else begin
            next_state = S1;
          end
        end
        default: next_state = S0;
      endcase
    end

    always @(state) begin
      case(state)
        S0:out = 1'b0;
        S1:out = 1'b0;
        S2:out = 1'b0;
        S3:out = 1'b0;
        S4:out = 1'b1;
        default: out = 1'b0;
      endcase
    end
endmodule
