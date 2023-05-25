module memory(clk,writeEn, readEn, address, dataIn, dataOut);
output reg [31:0] dataOut ;
input clk ;
input  writeEn,readEn;
input [31:0] dataIn,address ;
integer i ;
reg [31:0] dataMem [0:8191];
integer c=0;
initial begin

  for (c= 0; c < 8192; c= c + 1) 

begin

    dataMem[c] <= c;
  end
end
always @(posedge clk or  address ) begin
  if (writeEn == 1'b1) begin
    dataMem[address>>2] <= dataIn;
  end
 
  if (readEn == 1'b1) begin
   dataOut <=  dataMem[address>>2];
  end
end
always@(address)
begin
if(address===(32'hxxxxxxxx) )
#5
$display("mem=%p",dataMem);
end
endmodule





module tb_memory();
reg[31:0] dataIn, address;
wire[31:0] dataOut ;
reg writeEn,readEn;
memory test(writeEn,readEn,address, dataIn, dataOut) ;
initial
begin
$monitor("writeEn:%d,readEn:%d,address:%d, dataIn:%d, dataOut:%d",writeEn,readEn,address, dataIn, dataOut) ;

writeEn=1;
readEn=0;
address=10;
dataIn=20;
#5

writeEn=0;
readEn=1;
address=30;
dataIn=40;
#5

writeEn=0;
readEn=1;
address=50;
dataIn=60;
#5

writeEn=1;
readEn=0;
address=60;
dataIn=70;
#5
writeEn=0;
readEn=1;
address=60;
dataIn=90;
#5
writeEn=0;
readEn=1;
address=10;
dataIn=90;

end
endmodule

