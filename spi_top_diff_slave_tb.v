
`timescale 1ns/1ps

module spi_top_diff_slave_tb;

    reg clk = 0;
    reg trigger = 0;
    reg [31:0] din = 32'hA5A5A5A5;

    wire [31:0] dout;
    wire trigger_out;

    spi_top_diff_slave uut ( .clk(clk), .trigger(trigger), .din(din), .dout(dout), .trigger_out(trigger_out)  );

    always #5 clk = ~clk;  

    initial begin
        $dumpfile("spi_top_diff_slave_tb.vcd");
        $dumpvars(0, spi_top_diff_slave_tb);

        #20;
        trigger = 1;
        
        #10;
        trigger = 0;

        #4000;  // wait enough time for full transfer
        $display("Received Data: %h", dout);
        $finish;
    end

endmodule
