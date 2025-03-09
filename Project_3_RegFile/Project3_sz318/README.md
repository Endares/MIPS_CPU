# Project3_RegisterFile

Name: Sienna Zheng

NetID: sz318

## Design Idea:

The Register File structure is divided into 4 parts:

1. A register set of 32 32-bit registers: `Reg_sets`
2. A write port: `Write_port`
3. Two individual read ports: `Read_portA` and `Read_portB`
   - A register file typically needs two read ports because it is commonly used in processors to support **simultaneous reading of two source operands** in instructions that involve arithmetic or logic operations, such as addition, subtraction, multiplication, or comparisons.

### Reg_sets

`Reg_sets` is A register sets of 32 32-bit registers: 

- they share the same clear signal `clr` and clock signal `clk`
- each 32-bit register has its own enabling signal `en[i]`  and its own 32-bit output `Q[32*i +: 32]`
  - verilog doesn’t support 2-dimensional input, so 1024-bit output is used as the expansion of 32 * 32-bit ouput `Q`.
- Register 0 is always `32'b0` regardless of the writing data. Register 1~31 shared the writing data as their `D` input.

### w_port

The write port contains a 5to32 decoder which takes the write address (which is the address of the register to write to) as the input and enables 1 out of 32 32-bit registers  (which is the specific register to write to). The write_enable is implemented as the enabling signal of the decoder.

### r_port

The read port takes all 32 32-bit registers’ output as the input, and select one as output according to read address (which is the address of the register to read from).

Here, 32 32-bit tristate-buffer is connected to each 32bit input wire, and by using the decoder to ensure that only one tristate buffer is enabled at a time, allowing the selected register's output to drive the shared output bus, while all other buffers remain in a high-impedance state (`z`). This reduces the hardware complexity and improves performance compared to using a large multiplexer.