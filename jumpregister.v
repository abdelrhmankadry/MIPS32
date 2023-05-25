module jumpregister(func,jr) ;
input [5:0] func ;
output reg jr ;
always@(func)
begin
case(func)
8:jr<=1'b1 ;
default:jr<=1'b0 ;
endcase 
end
endmodule
