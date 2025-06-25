module spi_master
(
    input clk,
    input trigger,
    input [31:0] din,

    output reg sclk = 0,
    output reg mosi = 0,
    output reg cs = 1
);

    reg [31:0] din_shift_reg = 0;
    reg [3:0] clk_count = 0;
    reg [5:0] shift_reg_counter = 0;
    reg transmitting = 0;

    always @(posedge clk) 
    begin
    clk_count <= clk_count + 1;
    if (clk_count == 4) 
    begin
    clk_count <= 0;
    sclk <= ~sclk;
    end
    end

    always @(posedge clk) 
    begin
    if (trigger && !transmitting) 
    begin
    din_shift_reg <= din;
    shift_reg_counter <= 0;
    cs <= 0;
    transmitting <= 1;
    mosi <= din[31]; // appending seperatly 
    end
    end

    always @(negedge sclk) 
    begin
    if (transmitting) 
    begin
    din_shift_reg <= din_shift_reg << 1;
    shift_reg_counter <= shift_reg_counter + 1;

    if (shift_reg_counter < 31) 
    begin
    mosi <= din_shift_reg[30];  
    end 
    else
    begin
    cs <= 1;
    transmitting <= 0;
    mosi <= 0;
    end
    end
    end

endmodule
