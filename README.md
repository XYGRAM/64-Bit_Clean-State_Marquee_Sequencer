![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/wokwi_test/badge.svg) ![](../../workflows/fpga/badge.svg)

# 64-Bit Clean-State Marquee Sequencer

- [Read the documentation for project](docs/info.md)

**Abstract:** 
This design is made to take in input (Button Pressed) from the user and throw back the output (Lighting LED) desired by the user, it can be any pattern which is limited by the number of Flip-Flops for this instance.

**Function:** 
The 64-Bit Clean-State Marquee Sequencer is a sequential digital logic circuit designed to record, shift, and endlessly loop custom light and rhythm patterns. Driven by a continuous clock generator, the circuit propagates input signals through a long chain of Flip-Flops and taps into specific checkpoints to illuminate a panel of indicator LEDs (Red, Green, Blue, and Yellow) at precise intervals. It features interactive controls to dynamically inject inputs and a configuration switch to either clear the sequence or save and loop it infinitely.

**Logic:**
* **64-Bit Shift Register Architecture** - Built using 64 D-type flip-flops chained sequentially across four rows (ff1 to ff64), scaling up pattern memory length to accommodate extended multi-stage animations and complex rhythms.
* **Interval Light On/Off** - Dynamically tapped outputs at every 16th interval (ff16 for Red, ff32 for Green, ff48 for Blue, and ff64 for Yellow) create a smooth 4-phase color wave propagating across the circuit.
* **Clean-State Switch & Pull-Down Resistors** - Preventing random floating logic states or lock-ups upon boot-up, the circuit implements a default low-state slide switch (value: "0") paired with pull-down resistors (r_loop).
* **OR-Gate Feedback Loop** - Combines a tactile push-button (TAP / HOLD) with the slide-switch loop line via a 2-input OR gate (or1), allowing users to inject custom pulses or lock the final bit (ff64) back into the input for endless recirculation.

