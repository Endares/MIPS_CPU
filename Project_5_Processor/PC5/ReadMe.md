# PC5

- Sienna Zheng (sz318)
- Yanbo Zhang (yz945)

### Design Idea:

This design continues to use a 12-bit PC (corresponding to a 2^12 word addressable space), so all immediate values related to the PC are truncated to 12 bits.

This work involves extending the instructions based on PC4. The design approach is to classify the instructions by their functionality and expand the existing PC accordingly.

#### Instructions Updating the PC:

- **PC = PC + 1**
- PC = PC + 1 + N
  - Includes `bne` (`bne & isNotEqual`) and `blt` (==`blt & isNotEqual & (~isLessThan)`==).
  - Implemented using a branch adder rather than reusing the ALU.
- PC = T
  - Includes `j`, `jal`, and `bex`.
- PC = $rd
  - Includes `jr`.

These PC value selections are implemented using multi-level multiplexers.

#### Storing Values into the RegFile:

- **jal**
- **setx**

#### Instructions Requiring RegFile Values for ALU Operations:

- **bne** (`$rd != $rs`)
  - `$rd` is passed through an existing multiplexer (designed for `sw` in PC4) to `ctrl_dataReadB`.
  - `$rs` is directly passed to `ctrl_dataReadA`.
  - The ALU's `isNotEqual` output is used as the result.
- ==**blt**== (`$rd < $rs`)
  - `$rd` is passed through the existing multiplexer to `ctrl_dataReadB`.
  - `$rs` is directly passed to `ctrl_dataReadA`.
  - The ALU’s `isLessThan` is used to compute `$rs < $rd`, and its negation (`~isLessThan`) determines `$rd >= $rs`.
  - Combined with the ALU's `isNotEqual` output to get the final result.
- **bex** (`$30` compared with `$0` for inequality)
  - Extend the inputs to `ctrl_dataReadA` and `ctrl_dataReadB` using multiplexers.
  - Use the ALU's `isNotEqual` output as the result.

#### Adding New Control Signals:

Each new instruction type requires a corresponding control signal, such as `jar`, `bex`, etc.

#### Updating Control Signals:

- **Rwe:**
  - In PC4, `Rwe = 0` only for `sw`.
  - In PC5, also `Rwe = 0` for `j`, `bne`, `blt`, `jr`, and `bex`.
- **Rtarget:**
  - In PC4, for `sw`, `rt <= rd`.
  - In PC5, also for `bne`, `blt`, and `jr`, `rt <= rd`.
- **ALU_in_B:**
  - In PC4, for R-type instructions, the ALU's operand B comes from the register; otherwise, it comes from the immediate value.
  - In PC5, this also applies to `bne`, `blt`, and `bex`.