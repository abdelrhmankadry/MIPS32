module alu(data1,data2,OP,dataOut,shamt,Zero);
input[31:0] data1,data2;
input[3:0] OP;
input[4:0] shamt;
output reg [31:0] dataOut;
output  Zero;
always @(*)
begin
case(OP)
//and
4'b0000:
dataOut=data1&data2;
//sub&branch
4'b0110:
dataOut=data1-data2;
//or&ori
4'b0001:
dataOut=data1|data2;
//add & addi & lw & sw
4'b0010:
dataOut=data1+data2;
//sll
4'b0101:dataOut = data2 << shamt; 
//slt
4'b0111: dataOut = $signed(data1) < $signed(data2) ? 1 : 0;
default:dataOut=data1+data2;
endcase

end

assign Zero=(dataOut==0);
endmodule
