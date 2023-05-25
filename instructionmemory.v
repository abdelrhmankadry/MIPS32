module instructionmemory(clk,Pc,instruction);
input clk ;
input [31:0]Pc;
output [31:0]instruction;
reg[31:0]instructionmemory[0:8191];
initial
begin
$readmemb("C:\/myfile.txt",instructionmemory) ;
end
 assign instruction=instructionmemory[Pc>>2];
endmodule
