`timescale 1ns/1ps

module cipher_tb;

    logic clk;
    logic rst;
    logic start;
    logic [7:0] key;
    logic [7:0] plaintext;
    logic done;
    logic [7:0] ciphertext;

  // instância do DUT (device under text pag 214)
    cipher dut (
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
        $dumpfile("cipher_tb.vcd");
        $dumpvars(0, cipher_tb);

        // inicialização
        clk = 0;
        rst = 1;
        start = 0;
        key = 8'b0;
        plaintext = 8'b0;

        // reset
        #10;
        rst = 0;

        // primeiro teste
        key = 8'b10101010;
        plaintext = 8'b11001100;

        #10 start = 1;   // envia start
        #10 start = 0;

        // espera fim do processo
        wait(done);
        #10;
        $display("TESTE 1: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);

        // segundo teste
        key = 8'b11110000;
        plaintext = 8'b00111100;

        #10 start = 1;
        #10 start = 0;

        wait(done);
        #10;
        $display("TESTE 2: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);
      
     	// terceiro teste
        key = 8'b11111111;
        plaintext = 8'b00000000;

        #10 start = 1;
        #10 start = 0;

        wait(done);
        #10;
        $display("TESTE 3: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);
      
        // quarto teste
        key = 8'b11111111;
        plaintext = 8'b11111111;

        #10 start = 1;
        #10 start = 0;

        wait(done);
        #10;
        $display("TESTE 4: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);

        // quinto teste
        key = 8'b00110011;
        plaintext = 8'b01010101;

        #10 start = 1;
        #10 start = 0;

        wait(done);
        #10;
        $display("TESTE 5: plaintext=%b key=%b ciphertext=%b", plaintext, key, ciphertext);

        // fim
        #20;
        $finish;
    end

endmodule
