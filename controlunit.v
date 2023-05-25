module controlunit(RegDst,Jump,Branch,MemRead,MemtoReg,AluOp,MemWrite,AluSrc,RegWrite,OpCode);
output reg  Jump,Branch,MemRead,MemWrite,AluSrc,RegWrite ;
output reg [1:0] AluOp ,RegDst,MemtoReg;
input [5:0] OpCode ; 
always@(OpCode)
begin
case (OpCode)

//Rtype
0: begin
 AluOp = 2'b10 ;
RegDst=2'b01;
Jump=0;
Branch= 0;
MemRead=0;
MemtoReg=2'b00;
MemWrite=0;
AluSrc=0;
RegWrite = 1;
end
//lw
35:
begin
AluOp = 2'b00 ;
RegDst=2'b00 ;
Jump=0;
Branch= 0;
MemRead=1;
MemtoReg=2'b01;
MemWrite=0;
AluSrc=1;
RegWrite =1 ;
end
//sw
43: 
begin
AluOp = 2'b00 ;
RegDst= 2'bxx;
Jump=0;
Branch=0 ;
MemRead=0;
MemtoReg=2'bxx;
MemWrite=1;
AluSrc=1;
RegWrite =0 ;
end
//beq
4: begin
AluOp = 2'b01;
RegDst= 2'bxx;
Jump=0;
Branch= 1;
MemRead=0;
MemtoReg=2'bxx;
MemWrite=0;
AluSrc=0;
RegWrite =0 ;
end
//j
2:begin
AluOp = 2'bxx ;
RegDst= 2'b00;
Jump=1;
Branch= 0;
MemRead=0;
MemtoReg=2'b00;
MemWrite=0;
AluSrc=0;
RegWrite =0 ;
end
//jal
3:begin
AluOp = 2'bxx ;
RegDst= 2'b10;
Jump=0;
Branch= 0;
MemRead=0;
MemtoReg=2'b10;
MemWrite=0;
AluSrc=0;
RegWrite =1 ;
end
//addi
8:begin
AluOp = 2'b00 ;
RegDst=2'b00 ;
Jump=0;
Branch= 0;
MemRead=0;
MemtoReg=2'b00;
MemWrite=0;
AluSrc=1;
RegWrite =1 ;
end
//ori
13:begin
AluOp = 2'b11 ;
RegDst= 2'b00;
Jump=0;
Branch= 0;
MemRead=0;
MemtoReg=2'b00;
MemWrite=0;
AluSrc=1;
RegWrite =1 ;
end
default : begin
 AluOp = 2'b00 ;
RegDst= 2'b01;
Jump=0;
Branch= 0;
MemRead=0;
MemtoReg=2'b00;
MemWrite=0;
AluSrc=0;
RegWrite =1 ;

end

endcase
end
endmodule



module tb_ctrlunit();
reg [5:0]Op  ;
wire [1:0] AluOp ,RegDst,MemtoReg ;
wire  Jump,Branch,MemRead,MemWrite,AluSrc,RegWrite ;
controlunit tb(RegDst,Jump,Branch,MemRead,MemtoReg,AluOp,MemWrite,AluSrc,RegWrite,Op);
initial
begin
$monitor("Op:%b,RegDst:%b,Jump:%b,Branch:%b,MemRead:%b,MemtoReg:%b,AluOp:%b,MemWrite:%b,AluSrc:%b,RegWrite:%b",Op,RegDst,Jump,Branch,MemRead,MemtoReg,AluOp,MemWrite,AluSrc,RegWrite) ;
Op=0 ;
#5
Op=35 ;
#5
Op=43 ;
#5
Op=4 ;
#5
Op=2 ;
#5
Op=3 ;
#5
Op=8 ;
#5
Op=13 ;
#5
//default 
Op=20;

end
endmodule