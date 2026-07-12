const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// EMU_NS Registers
pub const EMU_NS = extern struct {
    /// offset: 0x00
    reserved0: [16]u8,
    /// No Description
    /// offset: 0x10
    DECBOD: mmio.Mmio(packed struct(u32) {
        /// DECBOD enable
        DECBODEN: u1 = 0x0,
        /// DECBOD Mask
        DECBODMASK: u1 = 0x1,
        reserved4: u2 = 0,
        /// Over Voltage Monitor enable
        DECOVMBODEN: u1 = 0x0,
        /// Over Voltage Monitor Mask
        DECOVMBODMASK: u1 = 0x1,
        padding: u26 = 0,
    }),
    /// offset: 0x14
    reserved20: [12]u8,
    /// No Description
    /// offset: 0x20
    BOD3SENSE: mmio.Mmio(packed struct(u32) {
        /// AVDD BOD enable
        AVDDBODEN: u1 = 0x0,
        /// VDDIO0 BOD enable
        VDDIO0BODEN: u1 = 0x0,
        /// VDDIO1 BOD enable
        VDDIO1BODEN: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// offset: 0x24
    reserved36: [24]u8,
    /// No Description
    /// offset: 0x3c
    VREGVDDCMPCTRL: mmio.Mmio(packed struct(u32) {
        /// VREGVDD comparator enable
        VREGINCMPEN: u1 = 0x0,
        /// VREGVDD comparator threshold programming
        THRESSEL: u2 = 0x3,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x40
    PD1PARETCTRL: mmio.Mmio(packed struct(u32) {
        /// Disable PD1 Partial Retention
        PD1PARETDIS: enum(u16) {
            /// Retain associated registers when in EM2/3
            PERIPHNORETAIN = 0x1,
            /// Bit[1]. When set, do not retain RADIO associated registers when in EM2/3
            RADIONORETAIN = 0x2,
            _,
        } = @enumFromInt(0x0),
        padding: u16 = 0,
    }),
    /// offset: 0x44
    reserved68: [24]u8,
    /// IP Version
    /// offset: 0x5c
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version
        IPVERSION: u32 = 0x2,
    }),
    /// No Description
    /// offset: 0x60
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Lock Key
        LOCKKEY: enum(u16) {
            /// Unlock EMU register
            UNLOCK = 0xade8,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x64
    IF: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// AVDD BOD Interrupt flag
        AVDDBOD: u1 = 0x0,
        /// VDDIO0 BOD Interrupt flag
        IOVDD0BOD: u1 = 0x0,
        reserved24: u6 = 0,
        /// EM23 Wake up Interrupt flag
        EM23WAKEUP: u1 = 0x0,
        /// Vscale done Interrupt flag
        VSCALEDONE: u1 = 0x0,
        reserved27: u1 = 0,
        /// Temperature Average Interrupt flag
        TEMPAVG: u1 = 0x0,
        reserved29: u1 = 0,
        /// Temperature Interrupt flag
        TEMP: u1 = 0x0,
        /// Temperature low Interrupt flag
        TEMPLOW: u1 = 0x0,
        /// Temperature high Interrupt flag
        TEMPHIGH: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x68
    IEN: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// AVDD BOD Interrupt enable
        AVDDBOD: u1 = 0x0,
        /// VDDIO0 BOD Interrupt enable
        IOVDD0BOD: u1 = 0x0,
        reserved24: u6 = 0,
        /// EM23 Wake up Interrupt enable
        EM23WAKEUP: u1 = 0x0,
        /// Vscale done Interrupt enable
        VSCALEDONE: u1 = 0x0,
        reserved27: u1 = 0,
        /// Temperature Interrupt enable
        TEMPAVG: u1 = 0x0,
        reserved29: u1 = 0,
        /// Temperature Interrupt enable
        TEMP: u1 = 0x0,
        /// Temperature low Interrupt enable
        TEMPLOW: u1 = 0x0,
        /// Temperature high Interrupt enable
        TEMPHIGH: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x6c
    EM4CTRL: mmio.Mmio(packed struct(u32) {
        /// EM4 entry request
        EM4ENTRY: u2 = 0x0,
        reserved4: u2 = 0,
        /// EM4 IO retention mode
        EM4IORETMODE: enum(u2) {
            /// No Retention: Pads enter reset state when entering EM4
            DISABLE = 0x0,
            /// Retention through EM4: Pads enter reset state when exiting EM4
            EM4EXIT = 0x1,
            /// Retention through EM4 and Wakeup: software writes UNLATCH register to remove retention
            SWUNLATCH = 0x2,
            _,
        } = .DISABLE,
        reserved8: u2 = 0,
        /// Set BOD3SENSE as EM4 wakeup
        BOD3SENSEEM4WU: u1 = 0x0,
        padding: u23 = 0,
    }),
    /// No Description
    /// offset: 0x70
    CMD: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// EM4 unlatch
        EM4UNLATCH: u1 = 0x0,
        reserved4: u2 = 0,
        /// Temperature Average Request
        TEMPAVGREQ: u1 = 0x0,
        reserved10: u5 = 0,
        /// Scale voltage to Vscale1
        EM01VSCALE1: u1 = 0x0,
        /// Scale voltage to Vscale2
        EM01VSCALE2: u1 = 0x0,
        reserved17: u5 = 0,
        /// Reset Cause Clear
        RSTCAUSECLR: u1 = 0x0,
        /// Tamper Reset Cause Clear
        TAMPERRCCLR: u1 = 0x0,
        padding: u13 = 0,
    }),
    /// No Description
    /// offset: 0x74
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Enable debugging in EM2
        EM2DBGEN: u1 = 0x0,
        reserved3: u2 = 0,
        /// Averaged Temperature samples num
        TEMPAVGNUM: enum(u1) {
            /// 16 measurements
            N16 = 0x0,
            /// 64 measurements
            N64 = 0x1,
        } = .N16,
        reserved8: u4 = 0,
        /// EM2/EM3 Vscale
        EM23VSCALE: enum(u2) {
            /// VSCALE0. 0.9v
            VSCALE0 = 0x0,
            /// VSCALE1. 1.0v
            VSCALE1 = 0x1,
            /// VSCALE2. 1.1v
            VSCALE2 = 0x2,
            _,
        } = .VSCALE2,
        reserved16: u6 = 0,
        /// Enable flash on demand wakeup
        FLASHPWRUPONDEMAND: u1 = 0x0,
        reserved29: u12 = 0,
        /// EFP Direct Mode Enable
        EFPDIRECTMODEEN: u1 = 0x0,
        /// EFP drives DECOUPLE
        EFPDRVDECOUPLE: u1 = 0x0,
        /// EFP drives DVDD
        EFPDRVDVDD: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x78
    TEMPLIMITS: mmio.Mmio(packed struct(u32) {
        /// Temp Low limit
        TEMPLOW: u9 = 0x0,
        reserved16: u7 = 0,
        /// Temp High limit
        TEMPHIGH: u9 = 0x1FF,
        padding: u7 = 0,
    }),
    /// offset: 0x7c
    reserved124: [8]u8,
    /// No Description
    /// offset: 0x84
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Lock status
        LOCK: enum(u1) {
            /// All EMU lockable registers are unlocked.
            UNLOCKED = 0x0,
            /// All EMU lockable registers are locked.
            LOCKED = 0x1,
        } = .UNLOCKED,
        /// First Temp done
        FIRSTTEMPDONE: u1 = 0x0,
        /// Temp active
        TEMPACTIVE: u1 = 0x0,
        /// Temp Average active
        TEMPAVGACTIVE: u1 = 0x0,
        /// Vscale busy
        VSCALEBUSY: u1 = 0x0,
        /// Vscale failed
        VSCALEFAILED: u1 = 0x0,
        /// Vscale status
        VSCALE: enum(u2) {
            /// Voltage scaling set to 0.9v
            VSCALE0 = 0x0,
            /// Voltage scaling set to 1.0v
            VSCALE1 = 0x1,
            /// Voltage scaling set to 1.1v
            VSCALE2 = 0x2,
            _,
        } = .VSCALE2,
        reserved10: u2 = 0,
        /// RAC active
        RACACTIVE: u1 = 0x0,
        reserved12: u1 = 0,
        /// EM4 IO retention status
        EM4IORET: u1 = 0x0,
        reserved14: u1 = 0,
        /// EM2 entered
        EM2ENTERED: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// No Description
    /// offset: 0x88
    TEMP: mmio.Mmio(packed struct(u32) {
        /// Temperature measured decimal part
        TEMPLSB: u2 = 0x0,
        /// Temperature measured
        TEMP: u9 = 0x0,
        reserved16: u5 = 0,
        /// Averaged Temperature
        TEMPAVG: u11 = 0x0,
        padding: u5 = 0,
    }),
    /// offset: 0x8c
    reserved140: [4]u8,
    /// No Description
    /// offset: 0x90
    RSTCTRL: mmio.Mmio(packed struct(u32) {
        /// Enable WDOG0 reset
        WDOG0RMODE: enum(u1) {
            /// Reset request is blocked
            DISABLED = 0x0,
            /// The entire device is reset except some EMU registers
            ENABLED = 0x1,
        } = .ENABLED,
        reserved2: u1 = 0,
        /// Enable M33 System reset
        SYSRMODE: enum(u1) {
            /// Reset request is blocked
            DISABLED = 0x0,
            /// Device is reset except some EMU registers
            ENABLED = 0x1,
        } = .ENABLED,
        /// Enable M33 Lockup reset
        LOCKUPRMODE: enum(u1) {
            /// Reset Request is Block
            DISABLED = 0x0,
            /// The entire device is reset except some EMU registers
            ENABLED = 0x1,
        } = .DISABLED,
        reserved6: u2 = 0,
        /// Enable AVDD BOD reset
        AVDDBODRMODE: enum(u1) {
            /// Reset Request is block
            DISABLED = 0x0,
            /// The entire device is reset except some EMU registers
            ENABLED = 0x1,
        } = .DISABLED,
        /// Enable VDDIO0 BOD reset
        IOVDD0BODRMODE: enum(u1) {
            /// Reset request is blocked
            DISABLED = 0x0,
            /// The entire device is reset except some EMU registers
            ENABLED = 0x1,
        } = .DISABLED,
        reserved10: u2 = 0,
        /// Enable DECBOD reset
        DECBODRMODE: enum(u1) {
            /// Reset request is blocked
            DISABLED = 0x0,
            /// The entire device is reset
            ENABLED = 0x1,
        } = .ENABLED,
        padding: u21 = 0,
    }),
    /// No Description
    /// offset: 0x94
    RSTCAUSE: mmio.Mmio(packed struct(u32) {
        /// Power On Reset
        POR: u1 = 0x0,
        /// Pin Reset
        PIN: u1 = 0x0,
        /// EM4 Wakeup Reset
        EM4: u1 = 0x0,
        /// Watchdog 0 Reset
        WDOG0: u1 = 0x0,
        /// Watchdog 1 Reset
        WDOG1: u1 = 0x0,
        /// M33 Core Lockup Reset
        LOCKUP: u1 = 0x0,
        /// M33 Core Sys Reset
        SYSREQ: u1 = 0x0,
        /// HVBOD Reset
        DVDDBOD: u1 = 0x0,
        /// LEBOD Reset
        DVDDLEBOD: u1 = 0x0,
        /// LVBOD Reset
        DECBOD: u1 = 0x0,
        /// LEBOD1 Reset
        AVDDBOD: u1 = 0x0,
        /// LEBOD2 Reset
        IOVDD0BOD: u1 = 0x0,
        reserved13: u1 = 0,
        /// SE Tamper event Reset
        SETAMPER: u1 = 0x0,
        reserved31: u17 = 0,
        /// DCDC VREGIN comparator
        VREGIN: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x98
    TAMPERRSTCAUSE: mmio.Mmio(packed struct(u32) {
        /// Tamper reset vector
        TAMPERRST: u32 = 0x0,
    }),
    /// offset: 0x9c
    reserved156: [4]u8,
    /// No Description
    /// offset: 0xa0
    DGIF: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// EM23 Wake up Interrupt flag
        EM23WAKEUPDGIF: u1 = 0x0,
        reserved29: u4 = 0,
        /// Temperature Interrupt flag
        TEMPDGIF: u1 = 0x0,
        /// Temperature low Interrupt flag
        TEMPLOWDGIF: u1 = 0x0,
        /// Temperature high Interrupt flag
        TEMPHIGHDGIF: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0xa4
    DGIEN: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// EM23 Wake up Interrupt enable
        EM23WAKEUPDGIEN: u1 = 0x0,
        reserved29: u4 = 0,
        /// Temperature Interrupt enable
        TEMPDGIEN: u1 = 0x0,
        /// Temperature low Interrupt enable
        TEMPLOWDGIEN: u1 = 0x0,
        /// Temperature high Interrupt enable
        TEMPHIGHDGIEN: u1 = 0x0,
    }),
    /// offset: 0xa8
    reserved168: [88]u8,
    /// No Description
    /// offset: 0x100
    EFPIF: mmio.Mmio(packed struct(u32) {
        /// EFP Interrupt Flag
        EFPIF: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x104
    EFPIEN: mmio.Mmio(packed struct(u32) {
        /// EFP Interrupt enable
        EFPIEN: u1 = 0x0,
        padding: u31 = 0,
    }),
};
