const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// LFRCO_NS Registers
pub const LFRCO_NS = extern struct {
    /// Contains the LFRCO ip version.
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP version ID
        IPVERSION: u32 = 0x0,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// Status register
    /// offset: 0x08
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Ready Status
        RDY: u1 = 0x0,
        reserved16: u15 = 0,
        /// Enabled Status
        ENS: u1 = 0x0,
        reserved31: u14 = 0,
        /// Lock Status
        LOCK: enum(u1) {
            /// Access to configuration registers not locked
            UNLOCKED = 0x0,
            /// Access to configuration registers locked
            LOCKED = 0x1,
        } = .UNLOCKED,
    }),
    /// Calibration register
    /// offset: 0x0c
    CAL: mmio.Mmio(packed struct(u32) {
        /// Frequency Trim
        FREQTRIM: u8 = 0xA5,
        padding: u24 = 0,
    }),
    /// offset: 0x10
    reserved16: [4]u8,
    /// Interrupt flag register
    /// offset: 0x14
    IF: mmio.Mmio(packed struct(u32) {
        /// Ready Interrupt Flag
        RDY: u1 = 0x0,
        /// Rising Edge Interrupt Flag
        POSEDGE: u1 = 0x0,
        /// Falling Edge Interrupt Flag
        NEGEDGE: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// Interrupt enable register.
    /// offset: 0x18
    IEN: mmio.Mmio(packed struct(u32) {
        /// Ready Interrupt Enable
        RDY: u1 = 0x0,
        /// Rising Edge Interrupt Enable
        POSEDGE: u1 = 0x0,
        /// Falling Edge Interrupt Enable
        NEGEDGE: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// Synchronization busy register
    /// offset: 0x1c
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// CAL Busy
        CAL: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// Configuration lock register. Locks/unlocks access to cofiguration registers.
    /// offset: 0x20
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Lock Key
        LOCKKEY: enum(u16) {
            /// Lock Configuration Registers
            LOCK = 0x0,
            /// Unlock Configuaration Registers
            UNLOCK = 0x2603,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
};
