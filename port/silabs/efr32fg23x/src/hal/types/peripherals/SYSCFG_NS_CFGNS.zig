const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// SYSCFG_NS_CFGNS Registers
pub const SYSCFG_NS_CFGNS = extern struct {
    /// offset: 0x00
    reserved0: [28]u8,
    /// Configure to define the system tick for the M33.
    /// offset: 0x1c
    CFGNSTCALIB: mmio.Mmio(packed struct(u32) {
        /// Ten Milliseconds
        TENMS: u24 = 0x4A37,
        /// Skew
        SKEW: u1 = 0x1,
        /// No Reference
        NOREF: enum(u1) {
            /// Reference clock is implemented
            REF = 0x0,
            /// Reference clock is not implemented
            NOREF = 0x1,
        } = .REF,
        padding: u6 = 0,
    }),
    /// offset: 0x20
    reserved32: [1504]u8,
    /// Generic data space for user to pass to root, e.g., address of struct in mem
    /// offset: 0x600
    ROOTNSDATA0: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// Generic data space for user to pass to root, e.g., address of struct in mem
    /// offset: 0x604
    ROOTNSDATA1: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
};
