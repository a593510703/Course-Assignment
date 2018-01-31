`timescale 1ns / 1ps

module anti_jitter( //������������
	input clock,
   input [WIDTH - 1:0] in,
   output reg [WIDTH - 1:0] out
   );

	parameter WIDTH = 1; //����֮ǰ���ݵĲ������иı�
	parameter HOLD = 100000;//��ʱ��32��ʱ�䵥λ

	reg [31:0] counter = 0;
	reg [WIDTH - 1:0] last_seen = 0;

	always @(posedge clock) begin
		if (last_seen != in) begin
			counter <= 0;//�������ı������¼�ʱ
		end else if (counter < HOLD) begin
			counter <= counter + 1;
		end else begin //����һ������������32��ʱ�䵥λ�ڲ��ı䣬����Ч
			out <= last_seen;
		end
		last_seen <= in;//��ÿһʱ�̵������¼
	end

endmodule
