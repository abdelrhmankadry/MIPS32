module alucontrol(fun, opcode, aluoput);
input [5:0] fun;
input [1:0] opcode;
output reg[3:0] aluoput;

always @(opcode , fun)
begin

if(opcode == 2'b10)
begin
case(fun)
//add
32:aluoput<=4'b0010;
//sub
34:aluoput<=4'b0110;
//and
36:aluoput<=4'b0000;
//or
37:aluoput<=4'b0001;
//sll
0:aluoput<=4'b0101;
//slt
42:aluoput<=4'b0111;

default:aluoput<=4'bxxxx;
endcase
end
//sw & lw &addi
else if (opcode == 2'b00)
aluoput<=4'b0010;
//branch
else if (opcode == 2'b01)
aluoput<=4'b0110;
//ori
else if (opcode == 2'b11)
aluoput<=4'b0001;
else
aluoput<=4'bxxxx;
end
endmodule 
