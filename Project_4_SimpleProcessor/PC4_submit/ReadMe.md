# PC4_Simple Processor

- Sienna Zheng (sz318)
- Yanbo Zhang (yz945)

## My Design

### PC (Program Counter):

- A 12-bit register implemented by a 12-bit D flip-flop with enable (`dffe_12.v`).
- PC increments by **1** each clock cycle.
  - Since memory is word-addressable and each instruction is 32 bits, this corresponds to an increment of **4 bytes**.
  - The increment is handled by `adder_plus4.v` (4: representing 4 bytes, not 4 words), which is implemented by `RCA_12bit.v` (an 12-bit Ripple Carry Adder). One operand is always set to **1**.

### Clock Divider:

- `clk_divn.v`: Divides the main clock (`clk`) by 5, used as the clock input for `processor_clock` and `regfile_clock`.
- `imem_clock` and `dmem_clock` has the same frequency as `clk`, where `imem_clock` is inverted `clk`.

### Sign Extender:

- `sign_extender.v`: Extends a 16-bit immediate to a 32-bit operand.

### Simple Processor:

- Supports R-type and I-type instructions.
- Integrates modules like PC, instruction memory (`imem`), data memory (`dmem`), ALU, and Register File (`RegFile`).

### Control Unit:

Allocate control signals based on instruction types.