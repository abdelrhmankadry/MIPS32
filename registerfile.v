
module register_file (clock, readReg1, readReg2, writeReg, writeData, regWrite, readData1, readData2);
	// Inputs and Outputs Declaration
	input [4:0] readReg1, readReg2, writeReg;
	input [31:0] writeData;
	input regWrite, clock;
	output reg [31:0] readData1, readData2;

	// Declaring the registers
	reg [31:0] Regs [0:31];
	integer r=0;

initial begin

  for (r = 0; r < 32; r= r + 1) 

begin

    Regs[r] <= r;
  end
end
	// Taking actions at the positive edge of the clock
	always @(posedge clock or readReg1 or readReg2)
		begin
			
readData1 <= Regs[readReg1];
readData2 <= Regs[readReg2];
			if (regWrite) 
			begin
				Regs[writeReg] <= writeData;
			end	
		end 

always@(readReg1 or readReg2)
begin
if(readReg1===5'bx)
#2
$display("req=%p",Regs);
end
endmodule
