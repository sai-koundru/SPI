# SPI

Sup people...!!!
I have designed a SPI design using Verilog, with the main focus on understanding the basic concepts of SPI in their simplest terms.

I have 3 (design sources) + 1 (testbench) in which:

**DESIGN SOURCE**

1. **SPI_MASTER**
   This design block's basic functionality is to perform things like sending 8-bit parallel data in a single clock cycle to the SPI_MASTER module, the SPI_ will then perform its logic as written in code.
   
3. **SPI_SLAVE**
   This design block's basic functionality is to receive the data sent from the SPI_MASTER.

4. **SPI_TOP**
   This design block is basically used to tie together the 2 different design modules into a single one so that the testbench is written for the top module only, which instantiates both the SPI_MASTER and SPI_SLAVE.


   **TESTBENCH**

1. **SPI_TB**
   This testbench is to test the full functionality of the spi module.
