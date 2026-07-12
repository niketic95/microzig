const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// LFXO_S Registers
pub const LFXO_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version ID
        IPVERSION: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x04
    CTRL: mmio.Mmio(packed struct(u32) {
        /// LFXO Force Enable
        FORCEEN: u1 = 0x0,
        /// LFXO Disable On-demand requests
        DISONDEMAND: u1 = 0x1,
        reserved4: u2 = 0,
        /// LFXO Failure Detection Enable
        FAILDETEN: u1 = 0x0,
        /// LFXO Failure Detection EM4WU Enable
        FAILDETEM4WUEN: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// Do not write to this register unless the oscillator is forced off. The oscillator is forced off if DISONDEMAND is set and FORCEEN is cleared.
    /// offset: 0x08
    CFG: mmio.Mmio(packed struct(u32) {
        /// LFXO AGC Enable
        AGC: u1 = 0x1,
        /// LFXO High Amplitude Enable
        HIGHAMPL: u1 = 0x0,
        reserved4: u2 = 0,
        /// LFXO Mode
        MODE: enum(u2) {
            /// A 32768Hz crystal should be connected to the LF crystal pads. Voltage must not exceed VDDIO.
            XTAL = 0x0,
            /// An external sine source with minimum amplitude 100mv (zero-to-peak) and maximum amplitude 500mV (zero-to-peak) should be connected in series with LFXTAL_I pin. Minimum voltage should be larger than ground and maximum voltage smaller than VDDIO. The sine source does not need to be ac coupled externally as it is ac couples inside LFXO. LFXTAL_O is free to be used as a general purpose GPIO.
            BUFEXTCLK = 0x1,
            /// An external 32KHz CMOS clock should be provided on LFXTAL_I. LFXTAL_O is free to be used as a general purpose GPIO.
            DIGEXTCLK = 0x2,
            _,
        } = .XTAL,
        reserved8: u2 = 0,
        /// LFXO Start-up Delay
        TIMEOUT: enum(u3) {
            /// Timeout period of 2 cycles
            CYCLES2 = 0x0,
            /// Timeout period of 256 cycles
            CYCLES256 = 0x1,
            /// Timeout period of 1024 cycles
            CYCLES1K = 0x2,
            /// Timeout period of 2048 cycles
            CYCLES2K = 0x3,
            /// Timeout period of 4096 cycles
            CYCLES4K = 0x4,
            /// Timeout period of 8192 cycles
            CYCLES8K = 0x5,
            /// Timeout period of 16384 cycles
            CYCLES16K = 0x6,
            /// Timeout period of 32768 cycles
            CYCLES32K = 0x7,
        } = .CYCLES32K,
        padding: u21 = 0,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// No Description
    /// offset: 0x10
    STATUS: mmio.Mmio(packed struct(u32) {
        /// LFXO Ready Status
        RDY: u1 = 0x0,
        reserved16: u15 = 0,
        /// LFXO Enable Status
        ENS: u1 = 0x0,
        reserved31: u14 = 0,
        /// LFXO Locked Status
        LOCK: enum(u1) {
            /// LFXO lockable registers are not locked
            UNLOCKED = 0x0,
            /// LFXO lockable registers are locked
            LOCKED = 0x1,
        } = .UNLOCKED,
    }),
    /// Do not write to this register unless CALBSY in SYNCBUSY register is low.
    /// offset: 0x14
    CAL: mmio.Mmio(packed struct(u32) {
        /// Internal Capacitance Tuning
        CAPTUNE: u7 = 0x0,
        reserved8: u1 = 0,
        /// LFXO Startup Gain
        GAIN: u2 = 0x2,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x18
    IF: mmio.Mmio(packed struct(u32) {
        /// LFXO Ready Interrupt Flag
        RDY: u1 = 0x0,
        /// Rising Edge Interrupt Flag
        POSEDGE: u1 = 0x0,
        /// Falling Edge Interrupt Flag
        NEGEDGE: u1 = 0x0,
        /// LFXO Failure Interrupt Flag
        FAIL: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    IEN: mmio.Mmio(packed struct(u32) {
        /// LFXO Ready Interrupt Enable
        RDY: u1 = 0x0,
        /// Rising Edge Interrupt Enable
        POSEDGE: u1 = 0x0,
        /// Falling Edge Interrupt Enable
        NEGEDGE: u1 = 0x0,
        /// LFXO Failure Interrupt Enable
        FAIL: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// No Description
    /// offset: 0x20
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// LFXO Synchronization status
        CAL: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x24
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Lock Key
        LOCKKEY: enum(u16) {
            /// Unlock LFXO lockable registers
            UNLOCK = 0x1a20,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
};
