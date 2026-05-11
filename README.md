# Verilog-Digital-Design-Portfolio
RTL Design and Verification projects including ALUs, Multipliers, and FSMs

1. Half Adder (Design-1):
   I designed Hald Adder circuit in Verilog with Gate-level modeling and verified with testbench written to test all four test cases and analysed outcomes with GTK Waves.
   ![Half Adder Waveform](images/Half Adder Waveform.png)
   Verification of the fundamental building block: the Half Adder. The simulation shows the XOR logic for the sum and AND logic for the carry, ensuring zero-delay functional accuracy.


2.Full Adder (Design-2):
  I designed Full Adder circuit in Verilog with Gate-level modeling and veriied with testbench written to test all eight test cases and analysed outcomes with GTK Waves.
  ![Full Adder Waveform](images/Full Adder Waveform.png)
  Timing analysis of a Full Adder implemented using a gate-level modeling style. The waveform confirms that the sum and carry outputs correctly follow the truth table logic for all 8 input combinations (a, b, c).  


3. Arithmetic and Logic Unit(4-bit) (Design-3):
    I designed Arithmetic and Logic Unit(4-bit) circuit in Verilog with behavioral modeling and veriied with testbench running over 2,048+  test cases and analysed outcomes with GTK Waves. The Arithmetic and Logic Unit(4-bit) does 8 operations including arithmetic addition, arithmetic subtraction, multiplication, division, logical AND, logical OR, logical XOR and logical XNOR .
   ![Arithmetic and Logic Unit(4-bit) Waveform](images/ALU_4 Waveform.png)
   This waveform demonstrates the functional verification of the 4-bit ALU supporting 8 operations. The inputs (a, b) and output (out) are displayed in Hexadecimal for clarity. Note the transitions between operation selection (sel); the brief 'xx' states represent uninitialized logic during the very first simulation step before the first clock/delay edge stabilizes the result.
   
