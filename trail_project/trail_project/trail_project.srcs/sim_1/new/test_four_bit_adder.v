`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/19 17:47:34
// Design Name: 
// Module Name: test_four_bit_adder
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


module tb_four_bit_adder;
    // 输入信号定义
    reg [3:0] A;        // 4-bit input A
    reg [3:0] B;        // 4-bit input B
    reg Cin;            // Carry input

    // 输出信号定义
    wire [3:0] Sum;     // 4-bit output Sum
    wire Cout;          // Carry output

    // 实例化待测模块（DUT: Device Under Test）
    four_bit_adder DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // 初始化信号并进行测试
    initial begin
        // 显示波形标题
        $display("Time\tA\tB\tCin\t| Sum\tCout");
        $display("--------------------------------------");
        
        // 测试 1: A=4'b0000, B=4'b0000, Cin=0
        A = 4'b0000; B = 4'b0000; Cin = 0;
        #10;  // 等待 10ns
        $display("%4d\t%b\t%b\t%b\t| %b\t%b", $time, A, B, Cin, Sum, Cout);

        // 测试 2: A=4'b1010, B=4'b0101, Cin=0
        A = 4'b1010; B = 4'b0101; Cin = 0;
        #10;
        $display("%4d\t%b\t%b\t%b\t| %b\t%b", $time, A, B, Cin, Sum, Cout);

        // 测试 3: A=4'b1111, B=4'b1111, Cin=1
        A = 4'b1111; B = 4'b1111; Cin = 1;
        #10;
        $display("%4d\t%b\t%b\t%b\t| %b\t%b", $time, A, B, Cin, Sum, Cout);

        // 测试 4: A=4'b1001, B=4'b0110, Cin=1
        A = 4'b1001; B = 4'b0110; Cin = 1;
        #10;
        $display("%4d\t%b\t%b\t%b\t| %b\t%b", $time, A, B, Cin, Sum, Cout);

        // 测试结束
        $finish;
    end
endmodule

