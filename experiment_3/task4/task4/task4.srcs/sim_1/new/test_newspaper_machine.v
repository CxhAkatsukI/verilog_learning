`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/18 20:50:01
// Design Name: 
// Module Name: test_newspaper_machine
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


module test_newspaper_machine(

    );
    reg clk;
    reg rstn;
    reg [2:0] coin;
    reg [2:0] random_coin;
    wire dispense;

    newspaper_machine instance_newspaper_machine(
      .clk(clk),
      .rstn(rstn),
      .coin(coin),
      .dispense(dispense)
      );

    initial begin
      clk = 0;
      rstn = 0;
      coin = 3'b000;
      
      #10;
      rstn = 1;
//      coin = 3'b001;#10;
//      coin = 3'b001;#10;
//      coin = 3'b001;#10;
//      coin = 3'b001;#10;
//      coin = 3'b001;#10;
//      coin = 3'b000;
//      
//      rstn = 0;#10;
//      rstn = 1;
//      coin = 3'b001;#10;
//      coin = 3'b010;#10;
//      coin = 3'b010;#10;
//      coin = 3'b000;
//
//      rstn = 0;#10;
//      rstn = 1;
//      coin = 3'b101;#10;
//      coin = 3'b000;
//      
//      rstn = 0;#10;
//      rstn = 1;
//      coin = 3'b001;#10;
//      coin = 3'b010;#10;
//      coin = 3'b101;#10;
//      coin = 3'b000;
//
//      rstn = 0;#10;
//      rstn = 1;#10;
    end

    always begin
      #10 random_coin = $random() % 3;
      case (random_coin)
        0: coin = 3'b001;
        1: coin = 3'b010;
        2: coin = 3'b101;
      endcase
    end

    always begin
      #5 clk = ~clk;
    end
endmodule
