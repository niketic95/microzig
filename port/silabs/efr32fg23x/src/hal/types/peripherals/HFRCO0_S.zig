const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// HFRCO0_S Registers
pub const HFRCO0_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version
        IPVERSION: u32 = 0x2,
    }),
    /// No Description
    /// offset: 0x04
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Force Enable
        FORCEEN: u1 = 0x0,
        /// Disable On-demand
        DISONDEMAND: u1 = 0x0,
        /// EM23 On-demand
        EM23ONDEMAND: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CAL: mmio.Mmio(packed struct(u32) {
        /// Tuning Value
        TUNING: u7 = 0x7F,
        reserved8: u1 = 0,
        /// Fine Tuning Value
        FINETUNING: u6 = 0x1F,
        reserved15: u1 = 0,
        /// LDO High Power Mode
        LDOHP: u1 = 0x1,
        /// Frequency Range
        FREQRANGE: u5 = 0x8,
        /// Comparator Bias Current
        CMPBIAS: u3 = 0x3,
        /// Locally Divide HFRCO Clock Output
        CLKDIV: enum(u2) {
            /// Divide by 1.
            DIV1 = 0x0,
            /// Divide by 2.
            DIV2 = 0x1,
            /// Divide by 4.
            DIV4 = 0x2,
            _,
        } = .DIV1,
        /// Comparator Load Select
        CMPSEL: u2 = 0x2,
        /// Tempco Trim on Comparator Current
        IREFTC: u4 = 0xA,
    }),
    /// No Description
    /// offset: 0x0c
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Ready
        RDY: u1 = 0x0,
        /// Frequency Updating Busy
        FREQBSY: u1 = 0x0,
        /// Synchronization Busy
        SYNCBUSY: u1 = 0x0,
        reserved16: u13 = 0,
        /// Enable Status
        ENS: u1 = 0x0,
        reserved31: u14 = 0,
        /// Lock Status
        LOCK: enum(u1) {
            /// HFRCO is unlocked
            UNLOCKED = 0x0,
            /// HFRCO is locked
            LOCKED = 0x1,
        } = .UNLOCKED,
    }),
    /// No Description
    /// offset: 0x10
    IF: mmio.Mmio(packed struct(u32) {
        /// Ready Interrupt Flag
        RDY: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x14
    IEN: mmio.Mmio(packed struct(u32) {
        /// RDY Interrupt Enable
        RDY: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// offset: 0x18
    reserved24: [4]u8,
    /// No Description
    /// offset: 0x1c
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Lock Key
        LOCKKEY: enum(u16) {
            /// Unlock code
            UNLOCK = 0x8195,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
};
