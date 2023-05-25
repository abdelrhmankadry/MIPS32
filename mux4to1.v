module Mux4to1(input [1:0]sel , input [31:0]x , input [31:0]y , input [31:0]v , input [31:0]b , output reg[31:0] z);
always @(x or y or v or b or sel)
begin
if(sel==00)
begin
z=x;
end
else if (sel==01)
begin
z=y;
end
else if (sel==10)
begin
z=v;
end
else if (sel==11)
begin
z=b;
end
else
begin
z=1'b x;
end
end
endmodule
