//模6计数器的Verilog HDL设计
module counter6(clk, rst_n, en, dout, co);
 
input clk, rst_n, en;
output[3:0] dout;
reg [3:0] dout;
output co;
 
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		dout <= 4'b0000;        //系统复位，计数器清零
	else if(en)
		if(dout == 4'b0101)     //计数值达到5时，计数器清零
			dout <= 4'b0000;
		else
			dout <= dout + 1'b1; //否则，计数器加1
	else
		dout <= dout;
 
end
 
assign co = dout[0]&dout[2];  //当计数达到5(4'b0101)时，进位为1，计数值为其他，都没有进位
 
endmodule