`timescale 1ns / 1ps
module tb_crc32_top;
    reg  [15:0] SW;
    wire [15:0] LED;
    crc32_top dut (
        .SW(SW),
        .LED(LED)
    );
    initial begin
        $display("Starting CRC-32 testbench");
        SW = 16'h1234;
        #10;
        $display("Input = %h, CRC lower 16 bits = %h",
                 SW, LED);
        SW = 16'h5678;
        #10;
        $display("Input = %h, CRC lower 16 bits = %h",
                 SW, LED);
        SW = 16'hABCD;
        #10;
        $display("Input = %h, CRC lower 16 bits = %h",
                 SW, LED);
        $finish;
    end
endmodule
