// TinyTapeout top-level module.
// The Wokwi-generated build expects this exact module name for the project ID
// in info.yaml.
module tt_um_wokwi_475558298046068737 (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    // Keep bidirectional pins in input mode until they are assigned a function.
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Expose the eight user inputs on the eight user outputs.  This is a
    // synthesizable default implementation and gives every output a defined
    // value for both RTL and gate-level builds.
    assign uo_out = ena ? ui_in : 8'b0;

    // Explicitly consume otherwise-unused interface signals without adding
    // simulation-only constructs or latches.
    wire _unused = clk ^ rst_n ^ uio_in[0];

endmodule
