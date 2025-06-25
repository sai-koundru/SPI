

module spi_top_diff_slave(

    input clk,
    input trigger,
    input [31:0] din,

    output wire [31:0] dout,
    output wire trigger_out
);

    wire sclk, mosi, cs;

    spi_master master_inst (.clk(clk), .trigger(trigger), .din(din), .sclk(sclk), .mosi(mosi), .cs(cs) );

    trial_slave slave_inst (.sclk(sclk), .mosi(mosi), .cs(cs), .trigger_out(trigger_out), .dout(dout)  );
    
    
endmodule
