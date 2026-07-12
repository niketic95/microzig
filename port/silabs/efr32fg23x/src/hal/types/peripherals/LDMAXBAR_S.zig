const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// LDMAXBAR_S Registers
pub const LDMAXBAR_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version ID
        IPVERSION: u32 = 0x2,
    }),
    /// No Description
    /// offset: 0x04
    CH0_REQSEL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: u4 = 0x0,
        reserved16: u12 = 0,
        /// Source Select
        SOURCESEL: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CH1_REQSEL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: u4 = 0x0,
        reserved16: u12 = 0,
        /// Source Select
        SOURCESEL: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    CH2_REQSEL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: u4 = 0x0,
        reserved16: u12 = 0,
        /// Source Select
        SOURCESEL: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x10
    CH3_REQSEL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: u4 = 0x0,
        reserved16: u12 = 0,
        /// Source Select
        SOURCESEL: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x14
    CH4_REQSEL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: u4 = 0x0,
        reserved16: u12 = 0,
        /// Source Select
        SOURCESEL: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x18
    CH5_REQSEL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: u4 = 0x0,
        reserved16: u12 = 0,
        /// Source Select
        SOURCESEL: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    CH6_REQSEL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: u4 = 0x0,
        reserved16: u12 = 0,
        /// Source Select
        SOURCESEL: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x20
    CH7_REQSEL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: u4 = 0x0,
        reserved16: u12 = 0,
        /// Source Select
        SOURCESEL: u6 = 0x0,
        padding: u10 = 0,
    }),
};
