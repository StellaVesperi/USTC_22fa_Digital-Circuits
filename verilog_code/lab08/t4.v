module statemachine(input clk,
            input sw,
            input btn,
            output reg [2:0] hexplay_an,
            output reg [3:0] hexplay_data);
    reg [2:0] curr_state;
    reg [2:0] next_state;
    
    // ȡ��ť����
    reg button_r1,button_r2;
    always@(posedge clk) button_r1 <= btn;
    always@(posedge clk) button_r2 <= button_r1;
    assign btn_pulse = button_r1 & (~button_r2);
    
    // ȡ״̬���أ���Ϊ�� Moore �ͣ���Ҫȡ������ͳ�Ƽ�����
    reg state_r1,state_r2;
    always@(posedge clk) state_r1 <= curr_state[2];
    always@(posedge clk) state_r2 <= state_r1;
    assign state_pulse = state_r1 & (~state_r2);
    
    // ״̬ת��
    always@(*) begin
        if (sw)
            case (curr_state)
                3'b000: next_state  = 3'b001;
                3'b001: next_state  = 3'b010;
                3'b010: next_state  = 3'b010;
                3'b011: next_state  = 3'b001;
                3'b100: next_state  = 3'b001;
                default: next_state = 3'b000;
            endcase
        else
            case (curr_state)
                3'b010: next_state  = 3'b011;
                3'b011: next_state  = 3'b100;
                default: next_state = 3'b000;
            endcase
    end
    
    // ʱ���߼�����ⰴť��
    reg [3:0] recent_num;
    always@(posedge clk) begin
        if (btn_pulse) begin
            curr_state    <= next_state;
            recent_num    <= recent_num << 1;
            recent_num[0] <= sw;
        end
        else begin
            curr_state <= curr_state;
            recent_num <= recent_num;
        end
    end
    
    // ������֣���Ҫ��� 6 ������, ��ʱ�������
    reg [3:0] success_count;
    always@(posedge clk) begin
        if (state_pulse) success_count <= success_count + 1;
        else success_count             <= success_count;
    end
    reg [4:0] time_count;
    always @(posedge clk) begin
        if (time_count == 5'b10111)
            time_count <= 5'b00000;
        else
            time_count <= time_count + 1;
    end
    
    always@(posedge clk) begin
        hexplay_an <= time_count[4:2];
        case (time_count[4:2])
            3'b000 : hexplay_data <= {1'b0, curr_state};
            3'b001 : hexplay_data <= success_count;
            3'b010 : hexplay_data <= {3'b000, recent_num[0]};
            3'b011 : hexplay_data <= {3'b000, recent_num[1]};
            3'b100 : hexplay_data <= {3'b000, recent_num[2]};
            3'b101 : hexplay_data <= {3'b000, recent_num[3]};
            default: hexplay_data <= 4'b0000;
        endcase
    end
endmodule