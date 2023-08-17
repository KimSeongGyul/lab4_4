`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/07 21:43:24
// Design Name: 
// Module Name: tb_i2c_test
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


module tb_i2c_test(

    );


logic    clk;
logic    rst_n;
logic    scl;
wire    sda;


pullup(sda);


i2c_master dut(
   .clk(clk),
   .rst_n(rst_n),
   .scl(scl),
   .sda(sda)
);


initial begin
   clk = 0;
   rst_n = 1;

   #30 rst_n = 0;
   #30 rst_n = 1;
end

always begin
   #1250
   clk = ~clk;
end



endmodule