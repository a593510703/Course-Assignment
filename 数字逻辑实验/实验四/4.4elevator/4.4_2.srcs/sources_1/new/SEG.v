`timescale 1ns / 1ps
module seg(
    input clk,
    input [2:0]floor,//1-4��
    input [1:0]updown,//0ֹͣ2����1�½�
    input open,//1��0��
    input [2:0]y,//״̬1-6��״̬
    output reg[3:0]pos,
    output reg[7:0]seg
    );
    reg[1:0] posC;
    reg[3:0] dataP;
    always@(posedge clk)
    begin 
        case(posC)
        //¥����ʾ�ڵ�һ���������
            0:begin
                pos<=4'b0001;
                dataP<={1'b0,floor};
              end
            //����״̬��ʾ�ڵڶ����������
            1:begin
                pos<=4'b0010;
                dataP<={2'b00,updown};
              end
            //�����ſ�����ʾ�ڵ������������
            2:begin
                pos<=4'b0100;
                dataP<={3'b000,open};
              end
            //y״̬��ʾ�ڵ��ĸ��������
            3:begin
                pos<=4'b1000;
                dataP<={1'b0,y};
              end
        endcase
        posC=posC+1;
    end
    //������������������ܵ�ÿһ�Σ�����ȡ��0-9ʮ�������������������ʾ��
    always@(dataP)
        case(dataP)
            0:seg=8'b0011_1111;
            1:seg=8'b0000_0110;
            2:seg=8'b0101_1011;
            3:seg=8'b0100_1111;
            4:seg=8'b0110_0110;
            5:seg=8'b0110_1101;
            6:seg=8'b0111_1101;
            7:seg=8'b0000_0111;
            8:seg=8'b0111_1111;
            9:seg=8'b0110_1111;
            10:seg=8'b0100_0000;
            11:seg=8'b0000_0000;
            default:seg=8'b0000_1000;
        endcase
endmodule