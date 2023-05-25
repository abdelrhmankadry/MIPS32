`include "alucontrol.v"
`include "clockk.v"
`include "registerfile.v"
`include "memory.v"
`include "controlunit.v"
`include "SignExtenstion.v"
`include "aluunit.v"
`include "mux4to1.v"
`include "mux2to1.v"
`include "jumpregister.v"
`include "instructionmemory.v"
`include "mux45bit.v"
`include "programmedcounter.v"
module mips(clk);
input clk ;
Clk Clock(clk);
 
wire Jump,Branch,Memread,Memwrite,Alusrc,Regwrite,Zero, andbranch,Jr,Regwritejr;
wire [1:0] Regdst , Memtoreg,Aluop ;
wire [4:0]writereqister ;
wire [31:0]pc,Instruction,writedata,ReadData1, ReadData2 ,Aluin2 ,Aluout,signex,memout,pcnext
  ,mux4out,pcjr,signexshiftleft,jumpaddress32,pcplus4, addpcwithshift;
wire [3:0] Aluopout ;
wire [27:0] jumpaddress28;


ProgramCounter program(pcnext, pc, clk);

instructionmemory Instructionmemory (clk,pc,Instruction);

assign pcplus4=pc+32'h0000004 ;
assign jumpaddress28=Instruction[25:0]<<2 ;
assign jumpaddress32 ={pcplus4[31:28],jumpaddress28} ;
assign signexshiftleft=signex<<2 ;
assign addpcwithshift=pcplus4+32'd4 ;

controlunit control (Regdst,Jump,Branch,Memread,Memtoreg,Aluop,Memwrite,Alusrc,Regwrite,Instruction[31:26]);
Mux45bit mux1(Regdst,Instruction[20:16],Instruction[15:11],Instruction[31],5'b1,writereqister) ;
jumpregister JumpRegister(Instruction[5:0],Jr) ;
and first(Regwritejr,Regwrite,~Jr) ;
register_file register (clk, Instruction[25:21], Instruction[20:16],writereqister, writedata, Regwritejr, ReadData1, ReadData2);
alucontrol Alucontrol(Instruction[5:0],Aluop, Aluopout);
alu aluunit(ReadData1,Aluin2,Aluopout,Aluout,Instruction[10:6],Zero);
SignExtension signextension(Instruction[15:0], signex);
Mux2to1 mux2(Alusrc,ReadData2,signex,Aluin2)  ;
memory mem(Memwrite, Memread, Aluout, ReadData2, memout);
Mux4to1 mux3 (Memtoreg,Aluout,memout,pcplus4,1,writedata) ;
and second(andbranch,Branch,Zero);
Mux2to1 mux4(andbranch,pcplus4,addpcwithshift,mux4out);
Mux2to1 mux5(Jump,mux4out,pcplus4,pcjr);
Mux2to1 mux6(Jr,pcjr,ReadData1,pcnext) ;



endmodule

