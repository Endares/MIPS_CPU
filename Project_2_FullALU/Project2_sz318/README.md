# Project2_FullALU

Name: Sienna Zheng

NetID: sz318

## My Design

### ALU:

Design Idea:

- Each operating module performs its own operation in parallel.
- `ctrl_ALUopcode` is used as the select signal of the mux, outputting the result from the only one selected module. 
- For preciseness and clear structure, each operating module is well encapsulated.

### ADD:

The `ADD` module is a simple encapsulation of the `CSA_32bit`.

### SUB:

The `ADD` module is also an encapsulation of the `CSA_32bit`.

- subtraction is implemented by the formula $-B = !B + 1$, where 1 comes from the last bit of subtraction’s opcode.

  - Here, generate for loop is used to calculate !B.

- `overflow` detection is the same as the `ADD` module and `CSA_32bit` module.

- `isNotEqual` is implemented by “OR”ing each bit of the result `s`. If `s == 0` then a equals b.

- `isLessThan` is the most tricky par as we should take overflow into consideration.

  - As overflow in subtraction happens only when the two operands have different sign bits, and two operands with different sign bits can be easily compared according to their sign bits, we can lead to the following formula:

  - ```cpp
    if (different_sign) {isLessThan = (a[31] == 1);}	// different sign bits, might overflow. neg number < pos number.
    else {isLessThan = s[31];}	// no overflow, just look at the sign bit of the result.
    ```

### alu_AND:

Generate for block is used in this module for preciseness.

### alu_OR:

Generate for block is used in this module for preciseness.

### SLL:

> SLL: fill the bits on the right side with 0.

A 5-level mux structure is used to implement the SLL.

- Each level represents whether to shift $2^{n-1}$ bits or not.

### SRA:

> SRA: fill the bits on the left side with sign bit.

A 5-level mux structure is used to implement the SRA.

- Each level represents whether to shift $2^{n-1}$ bits or not.