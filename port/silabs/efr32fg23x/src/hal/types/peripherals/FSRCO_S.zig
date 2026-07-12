const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// FSRCO_S Registers
pub const FSRCO_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version
        IPVERSION: u32 = 0x0,
    }),
};
