
`timescale 1ns/1ps

module top_spi_tb;

    reg clk = 0;
    reg trigger = 0;
    reg [31:0] din = 32'hA5A5A5A5;

    wire [31:0] dout;
    wire trigger_out;

    top_spi_tb uut ( .clk(clk), .trigger(trigger), .din(din), .dout(dout), .trigger_out(trigger_out)  );

    always #5 clk = ~clk;  

    initial 
        begin

        #20;
        trigger = 1;
        
        #10;
        trigger = 0;

        #4000; 
            
        $display("Received Data: %h", dout);
        $finish;
    end

endmodule
