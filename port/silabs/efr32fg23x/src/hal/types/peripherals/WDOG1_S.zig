const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// WDOG1_S Registers
pub const WDOG1_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// Module Enable
        EN: u1 = 0x0,
        /// Disabling busy status
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CFG: mmio.Mmio(packed struct(u32) {
        /// WDOG Clear Source
        CLRSRC: enum(u1) {
            /// A write to the clear bit will clear the WDOG counter
            SW = 0x0,
            /// A rising edge on the PRS Source 0 will clear the WDOG counter
            PRSSRC0 = 0x1,
        } = .SW,
        /// EM1 Run
        EM1RUN: enum(u1) {
            /// WDOG timer is frozen in EM1.
            DISABLE = 0x0,
            /// WDOG timer is running in EM1.
            ENABLE = 0x1,
        } = .DISABLE,
        /// EM2 Run
        EM2RUN: enum(u1) {
            /// WDOG timer is frozen in EM2.
            DISABLE = 0x0,
            /// WDOG timer is running in EM2.
            ENABLE = 0x1,
        } = .DISABLE,
        /// EM3 Run
        EM3RUN: enum(u1) {
            /// WDOG timer is frozen in EM3.
            DISABLE = 0x0,
            /// WDOG timer is running in EM3.
            ENABLE = 0x1,
        } = .DISABLE,
        /// EM4 Block
        EM4BLOCK: enum(u1) {
            /// EM4 can be entered by software. See EMU for detailed description.
            DISABLE = 0x0,
            /// EM4 cannot be entered by software.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Debug Mode Run
        DEBUGRUN: enum(u1) {
            /// WDOG timer is frozen in debug mode
            DISABLE = 0x0,
            /// WDOG timer is running in debug mode
            ENABLE = 0x1,
        } = .DISABLE,
        reserved8: u2 = 0,
        /// WDOG Reset Disable
        WDOGRSTDIS: enum(u1) {
            /// A timeout will cause a WDOG reset
            EN = 0x0,
            /// A timeout will not cause a WDOG reset
            DIS = 0x1,
        } = .EN,
        /// PRS Src0 Missing Event WDOG Reset
        PRS0MISSRSTEN: u1 = 0x0,
        /// PRS Src1 Missing Event WDOG Reset
        PRS1MISSRSTEN: u1 = 0x0,
        reserved16: u5 = 0,
        /// WDOG Timeout Period Select
        PERSEL: enum(u4) {
            /// Timeout period of 9 wdog cycles
            SEL0 = 0x0,
            /// Timeout period of 17 wdog cycles
            SEL1 = 0x1,
            /// Timeout period of 33 wdog cycles
            SEL2 = 0x2,
            /// Timeout period of 65 wdog cycles
            SEL3 = 0x3,
            /// Timeout period of 129 wdog cycles
            SEL4 = 0x4,
            /// Timeout period of 257 wdog cycles
            SEL5 = 0x5,
            /// Timeout period of 513 wdog cycles
            SEL6 = 0x6,
            /// Timeout period of 1k wdog cycles
            SEL7 = 0x7,
            /// Timeout period of 2k wdog cycles
            SEL8 = 0x8,
            /// Timeout period of 4k wdog cycles
            SEL9 = 0x9,
            /// Timeout period of 8k wdog cycles
            SEL10 = 0xa,
            /// Timeout period of 16k wdog cycles
            SEL11 = 0xb,
            /// Timeout period of 32k wdog cycles
            SEL12 = 0xc,
            /// Timeout period of 64k wdog cycles
            SEL13 = 0xd,
            /// Timeout period of 128k wdog cycles
            SEL14 = 0xe,
            /// Timeout period of 256k wdog cycles
            SEL15 = 0xf,
        } = .SEL15,
        reserved24: u4 = 0,
        /// WDOG Warning Period Select
        WARNSEL: enum(u2) {
            /// Disable
            DIS = 0x0,
            /// Warning timeout is 25% of the Timeout.
            SEL1 = 0x1,
            /// Warning timeout is 50% of the Timeout.
            SEL2 = 0x2,
            /// Warning timeout is 75% of the Timeout.
            SEL3 = 0x3,
        } = .DIS,
        reserved28: u2 = 0,
        /// WDOG Illegal Window Select
        WINSEL: enum(u3) {
            /// Disabled.
            DIS = 0x0,
            /// Window timeout is 12.5% of the Timeout.
            SEL1 = 0x1,
            /// Window timeout is 25% of the Timeout.
            SEL2 = 0x2,
            /// Window timeout is 37.5% of the Timeout.
            SEL3 = 0x3,
            /// Window timeout is 50% of the Timeout.
            SEL4 = 0x4,
            /// Window timeout is 62.5% of the Timeout.
            SEL5 = 0x5,
            /// Window timeout is 75.5% of the Timeout.
            SEL6 = 0x6,
            /// Window timeout is 87.5% of the Timeout.
            SEL7 = 0x7,
        } = .DIS,
        padding: u1 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    CMD: mmio.Mmio(packed struct(u32) {
        /// WDOG Timer Clear
        CLEAR: enum(u1) {
            /// WDOG timer is unchanged.
            UNCHANGED = 0x0,
            /// WDOG timer is cleared to 0.
            CLEARED = 0x1,
        } = .UNCHANGED,
        padding: u31 = 0,
    }),
    /// offset: 0x10
    reserved16: [4]u8,
    /// No Description
    /// offset: 0x14
    STATUS: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// WDOG Configuration Lock Status
        LOCK: enum(u1) {
            /// All WDOG lockable registers are unlocked.
            UNLOCKED = 0x0,
            /// All WDOG lockable registers are locked.
            LOCKED = 0x1,
        } = .UNLOCKED,
    }),
    /// No Description
    /// offset: 0x18
    IF: mmio.Mmio(packed struct(u32) {
        /// WDOG Timeout Interrupt Flag
        TOUT: u1 = 0x0,
        /// WDOG Warning Timeout Interrupt Flag
        WARN: u1 = 0x0,
        /// WDOG Window Interrupt Flag
        WIN: u1 = 0x0,
        /// PRS Src0 Event Missing Interrupt Flag
        PEM0: u1 = 0x0,
        /// PRS Src1 Event Missing Interrupt Flag
        PEM1: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    IEN: mmio.Mmio(packed struct(u32) {
        /// WDOG Timeout Interrupt Enable
        TOUT: u1 = 0x0,
        /// WDOG Warning Timeout Interrupt Enable
        WARN: u1 = 0x0,
        /// WDOG Window Interrupt Enable
        WIN: u1 = 0x0,
        /// PRS Src0 Event Missing Interrupt Enable
        PEM0: u1 = 0x0,
        /// PRS Src1 Event Missing Interrupt Enable
        PEM1: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x20
    LOCK: mmio.Mmio(packed struct(u32) {
        /// WDOG Configuration Lock
        LOCKKEY: enum(u16) {
            /// Lock WDOG lockable registers
            LOCK = 0x0,
            /// Unlock WDOG lockable registers
            UNLOCK = 0xabe8,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x24
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Sync Busy for Cmd Register
        CMD: u1 = 0x0,
        padding: u31 = 0,
    }),
};
