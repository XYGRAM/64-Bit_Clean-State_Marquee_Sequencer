<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

- Synchronous Clock Propagation: The architecture operates as a synchronous sequential network driven by a master clock generator (clk1) configured at a frequency of 20 Hz.   
- Shift Register Cascade: Data propagation is executed through a 64-stage shift register chain composed of cascaded D-type flip-flops (ff1 through ff64), wherein each discrete output (Q) routes sequentially into the subsequent data input (D).   
- Combinatorial Feedback Control: Input entry and recirculation are managed via a 2-input logical OR gate (or1). Input A interfaces with a manual push-button mechanism (btn1), whereas input B receives a feedback pathway modulated by a binary configuration slide switch (sw1).   
- Periodic Optical Tapping: Discrete checkpoints located at intervals $n = 16, 32, 48,$ and $64$ (ff16, ff32, ff48, and ff64) drive a multi-color LED indicator array through protective current-limiting resistors, translating internal register states into observable sequential phases.   

## How to test

- Baseline Initialization: Verify that the system begins in a clean logical state by ensuring the slide switch (sw1) is set to its default low position (0), leveraging 10k pull-down resistors (r_loop, r_btn) to suppress floating nodes and transient start-up anomalies.
- Stimulus Injection: Initiate a test pulse by engaging the "TAP / HOLD" push-button (btn1), which introduces a VCC-referenced high-state signal into the primary terminal of the OR gate (or1:A).   
- Waveform Verification: Monitor the register chain under the 20 Hz synchronization clock (clk1) to ensure the propagation wave sequentially activates the red, green, blue, and yellow indicator LEDs at their respective structural checkpoints (ff16, ff32, ff48, and ff64).
- Recirculation Validation: Transition the slide switch (sw1) to the active high position (1) to close the feedback loop connecting the terminal output (ff64:Q) back to the OR gate input (or1:B) thereby confirming infinite bit-stream persistence and loop stability.

## External hardware

- Clock Infrastructure: One master clock generator component (clk1) operating at 20 Hz.
- User Interface Elements: One tactile push-button switch (btn1) designated for manual input triggers, alongside one binary slide switch (sw1) designated for state persistence control.
- Optoelectronic Array: Four indicator light-emitting diodes categorized by color: red (led_red), green (led_green), blue (led_blue), and yellow (led_yellow).   Passive Circuitry: Four 220-ohm protective series resistors (r_r, r_g, r_b, r_y) and two 10k-ohm terminal stabilization pull-down resistors (r_btn, r_loop).
- Power and Ground Infrastructure: A standardized DC voltage source rail (vcc1) coupled with global ground reference points (gnd_global).
