`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 06:13:45 PM
// Design Name: 
// Module Name: csa
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


module csa(
    input [3:0] A,
    input [3:0] B,
    input C_in,
    output [3:0] Sum,
    output C_out
    );
    wire [3:0] carry0;
    wire [3:0] carry1;
    wire [3:0] sum_mux_input1;
    wire [3:0] sum_mux_input2;
    //FOR CARRY O
    fa_csa f1 (A[0],B[0],1'b0,sum_mux_input1[0],carry0[0]);
    fa_csa f2 (A[1],B[1],carry0[0],sum_mux_input1[1],carry0[1]);
    fa_csa f3 (A[2],B[2],carry0[1],sum_mux_input1[2],carry0[2]);
    fa_csa f4 (A[3],B[3],carry0[2],sum_mux_input1[3],carry0[3]);
    //FOR CARRY 1
    fa_csa f5 (A[0],B[0],1'b1,sum_mux_input2[0],carry1[0]);
    fa_csa f6 (A[1],B[1],carry1[0],sum_mux_input2[1],carry1[1]);
    fa_csa f7 (A[2],B[2],carry1[1],sum_mux_input2[2],carry1[2]);
    fa_csa f8 (A[3],B[3],carry1[2],sum_mux_input2[3],carry1[3]);
    //MUX FOR SUM OPERATION       
    mux_csa MS0 (sum_mux_input1[0],sum_mux_input2[0],C_in,Sum[0]);
    mux_csa MS1 (sum_mux_input1[1],sum_mux_input2[1],C_in,Sum[1]);
    mux_csa MS2 (sum_mux_input1[2],sum_mux_input2[2],C_in,Sum[2]);
    mux_csa MS3 (sum_mux_input1[3],sum_mux_input2[3],C_in,Sum[3]);
    //MUX FOR CARRY OPERATION
    mux_csa C1 (carry0[3],carry1[3],C_in,C_out);
   
endmodule
