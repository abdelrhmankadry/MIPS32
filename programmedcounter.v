
module ProgramCounter(PCNext, PCResult, Clk);

	input       [31:0]  PCNext;
	input               Clk;

	output reg  [31:0]  PCResult;

   

	initial begin
	
		PCResult <= 32'h00000000;
	end

    always @(posedge Clk)
    begin
 
PCResult <= PCNext;

//$display("PC=%h",PCResult);
    end

endmodule