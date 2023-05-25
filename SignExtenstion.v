module SignExtension(a, result);

input [15:0] a; // 16-bit input
output reg [31:0] result; // 32-bit output
always@(a)
begin
assign result = { {16{a[15]}}, a };
end
endmodule

module tb();
reg[15:0] a ;
wire[31:0] result ; 
SignExtension B(a,result);
initial
begin
$monitor("a:%b,result:%b",a,result);
#5
a=16'b1001010001010110 ;
#5
a=16'b0101010001010110 ;
end
endmodule