module Mux2to1(input sel , input [31:0] x , input [31:0] y , output reg [31:0]z);
always @(x or y or sel)
begin
if(sel==0)
begin
z=x;
end
else if (sel==1)
begin
z=y;
end
else
begin
z=1'b x;
end
end
endmodule
