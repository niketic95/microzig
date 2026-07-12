const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// SYSRTC0_NS Registers
pub const SYSRTC0_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP VERSION
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// SYSRTC Enable
        EN: u1 = 0x0,
        /// Disablement busy status
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x08
    SWRST: mmio.Mmio(packed struct(u32) {
        /// Software reset command
        SWRST: u1 = 0x0,
        /// Software reset busy status
        RESETTING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    CFG: mmio.Mmio(packed struct(u32) {
        /// Debug Mode Run Enable
        DEBUGRUN: enum(u1) {
            /// SYSRTC is frozen in debug mode
            DISABLE = 0x0,
            /// SYSRTC is running in debug mode
            ENABLE = 0x1,
        } = .DISABLE,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x10
    CMD: mmio.Mmio(packed struct(u32) {
        /// Start SYSRTC
        START: u1 = 0x0,
        /// Stop SYSRTC
        STOP: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x14
    STATUS: mmio.Mmio(packed struct(u32) {
        /// SYSRTC running status
        RUNNING: u1 = 0x0,
        /// Lock Status
        LOCKSTATUS: enum(u1) {
            /// SYSRTC registers are unlocked
            UNLOCKED = 0x0,
            /// SYSRTC registers are locked
            LOCKED = 0x1,
        } = .UNLOCKED,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x18
    CNT: mmio.Mmio(packed struct(u32) {
        /// Counter Value
        CNT: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x1c
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Sync busy for START bitfield
        START: u1 = 0x0,
        /// Sync busy for STOP bitfield
        STOP: u1 = 0x0,
        /// Sync busy for CNT bitfield
        CNT: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x20
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock Key
        LOCKKEY: enum(u16) {
            /// Write to unlock SYSRTC lockable registers
            UNLOCK = 0x4776,
            _,
        } = @enumFromInt(0x0),
        padding: u16 = 0,
    }),
    /// offset: 0x24
    reserved36: [28]u8,
    /// No Description
    /// offset: 0x40
    GRP0_IF: mmio.Mmio(packed struct(u32) {
        /// Overflow Interrupt Flag
        OVF: u1 = 0x0,
        /// Compare 0 Interrupt Flag
        CMP0: u1 = 0x0,
        /// Compare 1 Interrupt Flag
        CMP1: u1 = 0x0,
        /// Capture 0 Interrupt Flag
        CAP0: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// No Description
    /// offset: 0x44
    GRP0_IEN: mmio.Mmio(packed struct(u32) {
        /// Overflow Interrupt Enable
        OVF: u1 = 0x0,
        /// Compare 0 Interrupt Enable
        CMP0: u1 = 0x0,
        /// Compare 1 Interrupt Enable
        CMP1: u1 = 0x0,
        /// Capture 0 Interrupt Enable
        CAP0: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// No Description
    /// offset: 0x48
    GRP0_CTRL: mmio.Mmio(packed struct(u32) {
        /// Compare 0 Enable
        CMP0EN: u1 = 0x0,
        /// Compare 1 Enable
        CMP1EN: u1 = 0x0,
        /// Capture 0 Enable
        CAP0EN: u1 = 0x0,
        /// Compare 0 Compare Match Output Action
        CMP0CMOA: enum(u3) {
            /// Cleared on the next cycle
            CLEAR = 0x0,
            /// Set on the next cycle
            SET = 0x1,
            /// Set on the next cycle, cleared on the cycle after
            PULSE = 0x2,
            /// Inverted on the next cycle
            TOGGLE = 0x3,
            /// Export this channel's CMP IF
            CMPIF = 0x4,
            _,
        } = .CLEAR,
        /// Compare 1 Compare Match Output Action
        CMP1CMOA: enum(u3) {
            /// Cleared on the next cycle
            CLEAR = 0x0,
            /// Set on the next cycle
            SET = 0x1,
            /// Set on the next cycle, cleared on the cycle after
            PULSE = 0x2,
            /// Inverted on the next cycle
            TOGGLE = 0x3,
            /// Export this channel's CMP IF
            CMPIF = 0x4,
            _,
        } = .CLEAR,
        /// Capture 0 Edge Select
        CAP0EDGE: enum(u2) {
            /// Rising edges detected
            RISING = 0x0,
            /// Falling edges detected
            FALLING = 0x1,
            /// Both edges detected
            BOTH = 0x2,
            _,
        } = .RISING,
        padding: u21 = 0,
    }),
    /// No Description
    /// offset: 0x4c
    GRP0_CMP0VALUE: mmio.Mmio(packed struct(u32) {
        /// Compare 0 Value
        CMP0VALUE: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x50
    GRP0_CMP1VALUE: mmio.Mmio(packed struct(u32) {
        /// Compare 1 Value
        CMP1VALUE: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x54
    GRP0_CAP0VALUE: mmio.Mmio(packed struct(u32) {
        /// Capture 0 Value
        CAP0VALUE: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x58
    GRP0_SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Sync busy for CTRL register
        CTRL: u1 = 0x0,
        /// Sync busy for CMP0VALUE register
        CMP0VALUE: u1 = 0x0,
        /// Sync busy for CMP1VALUE register
        CMP1VALUE: u1 = 0x0,
        padding: u29 = 0,
    }),
};
