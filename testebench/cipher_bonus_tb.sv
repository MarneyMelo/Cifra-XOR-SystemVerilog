`timescale 1ns/1ps

module cipher_bonus_tb;

    parameter N = 16;

    logic clk;
    logic rst;
    logic start;
    logic [7:0] key;
    logic [N-1:0] plaintext;
    logic done;
    logic [N-1:0] ciphertext;

  // instância do DUT (device under test pag 214)
    cipher_bonus #(.N(N)) dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .key(key),
        .plaintext(plaintext),
        .done(done),
        .ciphertext(ciphertext)
    );

    // clock 10ns
    always #5 clk = ~clk;

    initial begin
        $dumpfile("cipher_bonus_tb.vcd");
        $dumpvars(0, cipher_bonus_tb);

        // inicialização
        clk = 0;
        rst = 1;
        start = 0;
        key = 8'b0;
        plaintext = {N{1'b0}};

        // reset
        #10;
        rst = 0;

        // primeiro teste
        key = 8'b10101010;
        plaintext = 16'b1100110011110000;

        #10 start = 1;   // envia start
        #10 start = 0;

        // espera fim do processo
        wait(done);
        #10;
        $display("TESTE 1: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);

        // segundo teste
        key = 8'b11110000;
        plaintext = 16'b0011110000111100;

        #10 start = 1;
        #10 start = 0;

        wait(done);
        #10;
        $display("TESTE 2: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);

        /*
        // teste 3 e 4 podem ser testados alterando N para 24
        // terceiro teste
        key = 8'b11001100;
        plaintext = 24'b101010101111000011110000;

        #10 start = 1;
        #10 start = 0;

        wait(done);
        #10;
        $display("TESTE 3: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);

        // quarto teste
        key = 8'b11111111;
        plaintext = 24'b111100001111000011110000;

        #10 start = 1;
        #10 start = 0;

        wait(done);
        #10;
        $display("TESTE 4: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);
        */

        // quinto teste
        key = 8'b00110011;
        plaintext = 16'b0101010101010101;

        #10 start = 1;
        #10 start = 0;

        wait(done);
        #10;
        $display("TESTE 5: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);

        // fim da simulação
        #20;
        $finish;
    end

endmodule
