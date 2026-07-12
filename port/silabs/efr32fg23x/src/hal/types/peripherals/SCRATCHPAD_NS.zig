const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// SCRATCHPAD_NS Registers
pub const SCRATCHPAD_NS = extern struct {
    /// Used for SIMCTRL Pointer in Verification Environment
    /// offset: 0x00
    SREG0: mmio.Mmio(packed struct(u32) {
        /// Scratch Pad Register
        SCRATCH: u32 = 0x0,
    }),
    /// Used for SIMCTRL Data Access in Verification Environment
    /// offset: 0x04
    SREG1: mmio.Mmio(packed struct(u32) {
        /// Scratch Register
        SCRATCH: u32 = 0x0,
    }),
};
