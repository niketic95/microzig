const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// ULFRCO_NS Registers
pub const ULFRCO_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// ULFRCO IP version
        IPVERSION: u32 = 0x1,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// No Description
    /// offset: 0x08
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Ready Status
        RDY: u1 = 0x0,
        reserved16: u15 = 0,
        /// Enable Status
        ENS: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// offset: 0x0c
    reserved12: [8]u8,
    /// No Description
    /// offset: 0x14
    IF: mmio.Mmio(packed struct(u32) {
        /// Ready Interrupt Flag
        RDY: u1 = 0x0,
        /// Positive Edge Interrupt Flag
        POSEDGE: u1 = 0x0,
        /// Negative Edge Interrupt Flag
        NEGEDGE: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x18
    IEN: mmio.Mmio(packed struct(u32) {
        /// Enable Ready Interrupt
        RDY: u1 = 0x0,
        /// Enable Positive Edge Interrupt
        POSEDGE: u1 = 0x0,
        /// Enable Negative Edge Interrupt
        NEGEDGE: u1 = 0x0,
        padding: u29 = 0,
    }),
};
