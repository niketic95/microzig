const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// BURTC_S Registers
pub const BURTC_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version ID
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// BURTC Enable
        EN: u1 = 0x0,
        /// Disablement busy status
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CFG: mmio.Mmio(packed struct(u32) {
        /// Debug Mode Run Enable
        DEBUGRUN: enum(u1) {
            /// BURTC is frozen in debug mode
            X0 = 0x0,
            /// BURTC is running in debug mode
            X1 = 0x1,
        } = .X0,
        /// Compare Channel is Top Value
        COMPTOP: enum(u1) {
            /// The top value of the BURTC is 4294967295 (0xFFFFFFFF)
            DISABLE = 0x0,
            /// The top value of the BURTC is given by COMP
            ENABLE = 0x1,
        } = .DISABLE,
        reserved4: u2 = 0,
        /// Counter prescaler value.
        CNTPRESC: enum(u4) {
            /// CLK_CNT = (BURTC LF CLK)/1
            DIV1 = 0x0,
            /// CLK_CNT = (BURTC LF CLK)/2
            DIV2 = 0x1,
            /// CLK_CNT = (BURTC LF CLK)/4
            DIV4 = 0x2,
            /// CLK_CNT = (BURTC LF CLK)/8
            DIV8 = 0x3,
            /// CLK_CNT = (BURTC LF CLK)/16
            DIV16 = 0x4,
            /// CLK_CNT = (BURTC LF CLK)/32
            DIV32 = 0x5,
            /// CLK_CNT = (BURTC LF CLK)/64
            DIV64 = 0x6,
            /// CLK_CNT = (BURTC LF CLK)/128
            DIV128 = 0x7,
            /// CLK_CNT = (BURTC LF CLK)/256
            DIV256 = 0x8,
            /// CLK_CNT = (BURTC LF CLK)/512
            DIV512 = 0x9,
            /// CLK_CNT = (BURTC LF CLK)/1024
            DIV1024 = 0xa,
            /// CLK_CNT = (BURTC LF CLK)/2048
            DIV2048 = 0xb,
            /// CLK_CNT = (BURTC LF CLK)/4096
            DIV4096 = 0xc,
            /// CLK_CNT = (BURTC LF CLK)/8192
            DIV8192 = 0xd,
            /// CLK_CNT = (BURTC LF CLK)/16384
            DIV16384 = 0xe,
            /// CLK_CNT = (BURTC LF CLK)/32768
            DIV32768 = 0xf,
        } = .DIV1,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    CMD: mmio.Mmio(packed struct(u32) {
        /// Start BURTC counter
        START: u1 = 0x0,
        /// Stop BURTC counter
        STOP: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x10
    STATUS: mmio.Mmio(packed struct(u32) {
        /// BURTC running status
        RUNNING: u1 = 0x0,
        /// Configuration Lock Status
        LOCK: enum(u1) {
            /// All BURTC lockable registers are unlocked.
            UNLOCKED = 0x0,
            /// All BURTC lockable registers are locked.
            LOCKED = 0x1,
        } = .UNLOCKED,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x14
    IF: mmio.Mmio(packed struct(u32) {
        /// Overflow Interrupt Flag
        OF: u1 = 0x0,
        /// Compare Match Interrupt Flag
        COMP: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x18
    IEN: mmio.Mmio(packed struct(u32) {
        /// Overflow Interrupt Flag
        OF: u1 = 0x0,
        /// Compare Match Interrupt Flag
        COMP: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    PRECNT: mmio.Mmio(packed struct(u32) {
        /// Pre-Counter Value
        PRECNT: u15 = 0x0,
        padding: u17 = 0,
    }),
    /// No Description
    /// offset: 0x20
    CNT: mmio.Mmio(packed struct(u32) {
        /// Counter Value
        CNT: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x24
    EM4WUEN: mmio.Mmio(packed struct(u32) {
        /// Overflow EM4 Wakeup Enable
        OFEM4WUEN: u1 = 0x0,
        /// Compare Match EM4 Wakeup Enable
        COMPEM4WUEN: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x28
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Sync busy for START
        START: u1 = 0x0,
        /// Sync busy for STOP
        STOP: u1 = 0x0,
        /// Sync busy for PRECNT
        PRECNT: u1 = 0x0,
        /// Sync busy for CNT
        CNT: u1 = 0x0,
        /// Sync busy for COMP
        COMP: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x2c
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock Key
        LOCKKEY: enum(u16) {
            /// Write to unlock all BURTC lockable registers
            UNLOCK = 0xaee8,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x30
    COMP: mmio.Mmio(packed struct(u32) {
        /// Compare Value
        COMP: u32 = 0x0,
    }),
};
