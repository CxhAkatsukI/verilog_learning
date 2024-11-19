`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/18 20:15:26
// Design Name: 
// Module Name: newspaper_machine
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


module newspaper_machine(
    input clk,
    input rstn,
    input [2:0] coin,
    output reg dispense
    );

    reg [2:0] state, next_state;
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;
    localparam S5 = 3'b101;

    always @(posedge clk or negedge rstn) begin
      if (~rstn) begin
        state <= S0;
      end else begin
        state <= next_state;
      end
    end

    always @(coin or state) begin
      case (state)
      S0: begin
        if (coin == 3'b001) begin
          next_state = S1;
        end 
        else if (coin == 3'b010) begin
          next_state = S2;
        end 
        else if (coin == 3'b101) begin
          next_state = S5;
        end
        else begin
          next_state = S0;
        end
      end
      S1: begin
        if (coin == 3'b001) begin
          next_state = S2;
        end
        else if (coin == 3'b010) begin
          next_state = S3;
        end
        else if (coin == 3'b101) begin
          next_state = S5;
        end
        else begin
          next_state = S1;
        end
      end
      S2: begin
        if (coin == 3'b001) begin
          next_state = S3;
        end 
        else if (coin == 3'b010) begin
          next_state = S4;
        end 
        else if (coin == 3'b101) begin
          next_state = S5;
        end
        else begin
          next_state = S2;
        end
      end
      S3: begin
        if (coin == 3'b001) begin
          next_state = S4;
        end 
        else if (coin == 3'b010) begin
          next_state = S5;
        end
        else if (coin == 3'b101) begin
          next_state = S5;
        end
        else begin
          next_state = S3;
        end
      end
      S4: begin
        if (coin == 3'b001) begin
          next_state = S5;
        end 
        else if (coin == 3'b010) begin
          next_state = S5;
        end
        else if (coin == 3'b101) begin
          next_state = S5;
        end
        else begin
          next_state = S4;
        end
      end
      S5: begin
        next_state = S0;
      end
      endcase
    end
    always @(state) begin
      case(state)
        S0: dispense = 1'b0;
        S1: dispense = 1'b0;
        S2: dispense = 1'b0;
        S3: dispense = 1'b0;
        S4: dispense = 1'b0;
        S5: dispense = 1'b1;
      endcase
    end
endmodule
