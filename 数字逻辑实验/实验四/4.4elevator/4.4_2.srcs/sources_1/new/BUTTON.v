`timescale 1ns / 1ps
module button(
	input clr,clk,
	input signal0,
	input signalfb,
	output reg signal
	);
reg [1:0]y;
always @(posedge clk or negedge clr) begin
	if(!clr)begin
		if(!signal0)y=0;//��ʼʱ�̰���Ϊ0
		else y=2;//��ʼʱ�̰���Ϊ1
	end
	else begin
		case(y)
			0:if(signal0&&!signalfb)y=1;//��ʼʱ�̰���Ϊ0
			1:if(signalfb) y=2;//����¥��󷵻ظߵ�ƽ��ʹ�õ�Ϩ��
			2:if(!signal0&&!signalfb)y=3;//��ʼʱ�̰���Ϊ1
			3:if(signalfb)y=0;
		endcase
	end
end
always@(posedge clk or negedge clr) begin
    if(!clr)
        signal=0;
    else begin
        if(y==0||y==2)signal=0;
        else signal=1;
    end
end
endmodule
