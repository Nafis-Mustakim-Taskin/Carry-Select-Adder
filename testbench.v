`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nafis
// 
// Create Date: 05/09/2021 11:20:35 PM
// Design Name: 
// Module Name: tb_csa
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


module tb_csa;
reg [3:0] A;
reg [3:0] B;
reg C_in;
wire [3:0] Sum;
wire C_out;
//reg [7:0] i= 8'b0;
integer i;
csa checkCSA (.A(A), .B(B),.C_in(C_in), .Sum(Sum), .C_out(C_out));
initial begin
A = 4'b0000; B = 4'b0000; C_in = 1'b0; #0.5; //This delay is important as it is the setup time from where the simulation will start
for (i=0; i<511;i=i+1)
begin
{A,B,C_in} = {A,B,C_in}+ 1'b1;   // The bit of each input is changed following the truthtable format. 1 bit increment 
#0.5;
end
$finish; // finish the simulation
end
endmodule
