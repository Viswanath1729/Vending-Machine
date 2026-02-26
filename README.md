# Vending-Machine

Verilog based Vending machine implementation using Finite State Machine with test bench verification

📌**Project Overview**

This project implements a Vending Machine Controller using Finite State Machine (FSM) in Verilog HDL. The machine accepts coins of different denominations (₹1, ₹2, ₹5) and dispenses a product once the minimum cost (₹5) is reached. It also calculates and returns change (if required).

This design demonstrates RTL coding, FSM-based control logic, and testbench-driven verification of a real-world digital system.

⚙️**Features**

Supports coin denominations:

000 → No coin

001 → ₹1

010 → ₹2

101 → ₹5

Product cost is set to ₹5.

Dispenses product (out = 1) when the total inserted coins ≥ 5.

Returns change (ch) in binary-coded form:

000 → ₹0

001 → ₹1

010 → ₹2

011 → ₹3

100 → ₹4

Implements Moore FSM with 5 states:

s0 → ₹0

s1 → ₹1

s2 → ₹2

s3 → ₹3

s4 → ₹4

Fully synthesizable Verilog code, suitable for FPGA/ASIC implementation.

Modular design with reset functionality.

🏗️ **FSM Design**

The vending machine is modeled as a Finite State Machine where each state represents the accumulated balance.

Inputs:

in[2:0] → Coin input

clk → Clock signal

rst → Reset signal

Outputs:

out → Dispense signal (1 = product dispensed, 0 = no product)

ch[2:0] → Change returned

State Transition Example:

Insert ₹1 → Move from s0 → s1

Insert ₹2 → Move from s1 → s3

Insert ₹5 directly → Product dispensed at once, return change if any

🔄**Working Example**

Insert ₹2 (010) → State goes from s0 → s2, no output.

Insert ₹2 again (010) → State goes to s4, total = ₹4.

Insert ₹2 again (010) → Now total = ₹6 → Product is dispensed, and change = ₹1 (001).

🧪 Simulation & Verification

Verified using a testbench that applies different coin sequences.

Checked:

Correct product dispense when total ≥ 5.

Correct change return for extra coins.

Reset functionality brings FSM back to s0.

📖 **Learning Outcomes**

✅ FSM design in Verilog

✅ Handling multiple coin denominations

✅ Change calculation in digital systems

✅ Writing synthesizable RTL code

✅ Testbench-driven design verification

🔮 **Future Improvements**

Support for more coin denominations.

Configurable product cost via input switches.

Multiple product selection (snacks, drinks, etc.).

FPGA-based real hardware demo with coin sensors & actuators.
