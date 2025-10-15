module cipher (
    input  logic       clk,
    input  logic       rst,
    input  logic       start,
    input  logic [7:0] key,
    input  logic [7:0] plaintext,
    output logic       done,
    output logic [7:0] ciphertext
);

    // estados da FSM
    typedef enum logic [1:0] {
        IDLE    = 2'b00,
        LOAD    = 2'b01,
        PROCESS = 2'b10,
        DONE    = 2'b11
    } state_t;

    state_t state, next_state;

    logic [7:0] key_reg;
    logic [7:0] plaintext_reg;
    logic [7:0] ciphertext_reg;
    logic [2:0] bit_counter;

    assign ciphertext = ciphertext_reg;

    // estado sequencial
  always_ff @(posedge clk, posedge rst) begin //pag 191
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // registradores SqLog
  always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            key_reg        <= 8'b0;
            plaintext_reg  <= 8'b0;
            ciphertext_reg <= 8'b0;
            bit_counter    <= 3'b0;
        end else begin
            case (state)
                LOAD: begin
                    key_reg        <= key;
                    plaintext_reg  <= plaintext;
                    ciphertext_reg <= 8'b0;
                    bit_counter    <= 3'b0;
                end
                PROCESS: begin
                    // processa 1 bit por ciclo
                    ciphertext_reg[bit_counter] <= plaintext_reg[bit_counter] ^ key_reg[bit_counter];
                    bit_counter <= bit_counter + 1;
                end
                DONE: begin
                    // mantém resultado
                end
                default: begin
                    // nada
                end
            endcase
        end
    end

    // próxima transição Comblogic
    always_comb begin
        next_state = state;
        case (state)
            IDLE: begin
                done = 0;
                if (start)
                    next_state = LOAD;
            end
            LOAD: begin
                done = 0;
                next_state = PROCESS;
            end
            PROCESS: begin
                done = 0;
                if (bit_counter == 3'd7) // vai de 0 a 7
                    next_state = DONE;
            end
            DONE: begin
                done = 1;
                if (!start)
                    next_state = IDLE;
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule
