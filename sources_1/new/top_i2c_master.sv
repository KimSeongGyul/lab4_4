`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/17 09:55:33
// Design Name: 
// Module Name: top_i2c_master
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


module top_i2c_master(
    sysclk,
    rst_n,
    scl,
    sda
    );

input sysclk;
input rst_n;

output scl;
inout sda;

logic [9:0] count;
logic clk;

always_ff @(posedge sysclk or negedge rst_n) begin : proc_
    if(~rst_n) begin
        count <= 0;
        clk <=0;
    end else begin
        if(count == 312) begin 
            count <= 0;
            clk <= clk + 1;
        end else begin
        count <= count + 1;
        end
    end
end

i2c_master U1(
   .clk(clk),
   .rst_n(rst_n),
   .scl(scl),
   .sda(sda)
);

ila T1(
    .clk(clk),
   .probe0(rst_n),
   .probe1(scl),
   .probe2(sda)
);    

endmodule
