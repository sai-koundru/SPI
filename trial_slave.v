module spi_slave
(
    input sclk,
    input mosi,
    input cs,

    output reg trigger_out = 0,
    output reg [31:0] dout = 0
);

    reg [31:0] shift_reg = 0;
    reg [5:0] bit_count = 0;


    always @(posedge sclk) 
    begin
    if (cs == 0) 
    begin
    shift_reg <= {shift_reg[30:0], mosi};
    bit_count <= bit_count + 1;

    if (bit_count == 31) 
    begin
    dout <= {shift_reg[30:0], mosi};
    trigger_out <= 1;
    end 
    
    else 
    begin
    trigger_out <= 0;
    end
    end 
    
    else 
    begin
    shift_reg <= 0;
    bit_count <= 0;
    trigger_out <= 0;
    end
    end
    
    
    
endmodule
