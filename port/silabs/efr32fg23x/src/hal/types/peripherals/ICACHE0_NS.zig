const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// ICACHE0_NS Registers
pub const ICACHE0_NS = extern struct {
    /// The read only IPVERSION field gives the version for this module. There may be minor software changes required for modules with different values of IPVERSION.
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP version ID
        IPVERSION: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x04
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Cache Disable
        CACHEDIS: u1 = 0x0,
        /// Use MPU
        USEMPU: u1 = 0x0,
        /// Automatic Flushing Disable
        AUTOFLUSHDIS: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x08
    PCHITS: mmio.Mmio(packed struct(u32) {
        /// Performance Counter Hits
        PCHITS: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x0c
    PCMISSES: mmio.Mmio(packed struct(u32) {
        /// Performance Counter Misses
        PCMISSES: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x10
    PCAHITS: mmio.Mmio(packed struct(u32) {
        /// Performance Counter Advanced Hits
        PCAHITS: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x14
    STATUS: mmio.Mmio(packed struct(u32) {
        /// PC Running
        PCRUNNING: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x18
    CMD: mmio.Mmio(packed struct(u32) {
        /// Flush
        FLUSH: u1 = 0x0,
        /// Start Performance Counters
        STARTPC: u1 = 0x0,
        /// Stop Performance Counters
        STOPPC: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    LPMODE: mmio.Mmio(packed struct(u32) {
        /// Low Power Level
        LPLEVEL: enum(u2) {
            /// Base instruction cache functionality
            BASIC = 0x0,
            /// Advanced buffering mode, where the cache uses the fetch pattern to predict highly accessed data and store it in low-energy memory
            ADVANCED = 0x1,
            /// Minimum activity mode, which allows the cache to minimize activity in logic that it predicts has a low probability being used. This mode can introduce wait-states into the instruction fetch stream when the cache exits one of its low-activity states. The number of wait-states introduced is small, but users running with 0-wait-state memory and wishing to reduce the variability that the cache might introduce with additional wait-states may wish to lower the cache low-power level. Note, this mode includes the advanced buffering mode functionality.
            MINACTIVITY = 0x3,
            _,
        } = .MINACTIVITY,
        reserved4: u2 = 0,
        /// Low Power Nest Factor
        NESTFACTOR: u4 = 0x2,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x20
    IF: mmio.Mmio(packed struct(u32) {
        /// Hit Overflow Interrupt Flag
        HITOF: u1 = 0x0,
        /// Miss Overflow Interrupt Flag
        MISSOF: u1 = 0x0,
        /// Advanced Hit Overflow Interrupt Flag
        AHITOF: u1 = 0x0,
        reserved8: u5 = 0,
        /// RAM error Interrupt Flag
        RAMERROR: u1 = 0x0,
        padding: u23 = 0,
    }),
    /// No Description
    /// offset: 0x24
    IEN: mmio.Mmio(packed struct(u32) {
        /// Hit Overflow Interrupt Enable
        HITOF: u1 = 0x0,
        /// Miss Overflow Interrupt Enable
        MISSOF: u1 = 0x0,
        /// Advanced Hit Overflow Interrupt Enable
        AHITOF: u1 = 0x0,
        reserved8: u5 = 0,
        /// RAM error Interrupt Enable
        RAMERROR: u1 = 0x0,
        padding: u23 = 0,
    }),
};
