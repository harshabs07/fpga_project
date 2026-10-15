module crc32_top (
    input  [15:0] SW,
    output [15:0] LED
);
    reg [31:0] crc;
    integer i;
    always @(*) begin
        crc = 32'hFFFFFFFF;
        for (i = 15; i >= 0; i = i - 1) begin
            if (crc[31] ^ SW[i])
                crc = {crc[30:0], 1'b0} ^ 32'h04C11DB7;
            else
                crc = {crc[30:0], 1'b0};
        end
    end
    assign LED = crc[15:0];
endmodule
