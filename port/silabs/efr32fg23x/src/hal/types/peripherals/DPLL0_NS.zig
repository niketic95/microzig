const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// DPLL0_NS Registers
pub const DPLL0_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version ID
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// Module Enable
        EN: u1 = 0x0,
        /// Disablement Busy Status
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CFG: mmio.Mmio(packed struct(u32) {
        /// Operating Mode Control
        MODE: enum(u1) {
            /// Frequency Lock Mode
            FLL = 0x0,
            /// Phase Lock Mode
            PLL = 0x1,
        } = .FLL,
        /// Reference Edge Select
        EDGESEL: u1 = 0x0,
        /// Automatic Recovery Control
        AUTORECOVER: u1 = 0x0,
        reserved6: u3 = 0,
        /// Dither Enable Control
        DITHEN: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    CFG1: mmio.Mmio(packed struct(u32) {
        /// Factor M
        M: u12 = 0x0,
        reserved16: u4 = 0,
        /// Factor N
        N: u12 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x10
    IF: mmio.Mmio(packed struct(u32) {
        /// Lock Interrupt Flag
        LOCK: u1 = 0x0,
        /// Lock Failure Low Interrupt Flag
        LOCKFAILLOW: u1 = 0x0,
        /// Lock Failure High Interrupt Flag
        LOCKFAILHIGH: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x14
    IEN: mmio.Mmio(packed struct(u32) {
        /// LOCK interrupt Enable
        LOCK: u1 = 0x0,
        /// LOCKFAILLOW Interrupe Enable
        LOCKFAILLOW: u1 = 0x0,
        /// LOCKFAILHIGH Interrupt Enable
        LOCKFAILHIGH: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x18
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Ready Status
        RDY: u1 = 0x0,
        /// Enable Status
        ENS: u1 = 0x0,
        reserved31: u29 = 0,
        /// Lock Status
        LOCK: enum(u1) {
            /// DPLL is unlocked
            UNLOCKED = 0x0,
            /// DPLL is locked
            LOCKED = 0x1,
        } = .UNLOCKED,
    }),
    /// offset: 0x1c
    reserved28: [8]u8,
    /// No Description
    /// offset: 0x24
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Lock Key
        LOCKKEY: enum(u16) {
            /// Unlock code
            UNLOCK = 0x7102,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
};
