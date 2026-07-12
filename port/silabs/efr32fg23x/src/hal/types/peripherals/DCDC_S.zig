const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// DCDC_S Registers
pub const DCDC_S = extern struct {
    /// IPVERSION
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IPVERSION
        IPVERSION: u32 = 0x1,
    }),
    /// Control
    /// offset: 0x04
    CTRL: mmio.Mmio(packed struct(u32) {
        /// DCDC/Bypass Mode Control
        MODE: enum(u1) {
            /// DCDC is OFF, bypass switch is enabled
            BYPASS = 0x0,
            /// Request DCDC regulation, bypass switch disabled
            DCDCREGULATION = 0x1,
        } = .BYPASS,
        reserved4: u3 = 0,
        /// Ton_max timeout control
        IPKTMAXCTRL: u5 = 0x10,
        padding: u23 = 0,
    }),
    /// EM01 Configurations
    /// offset: 0x08
    EM01CTRL0: mmio.Mmio(packed struct(u32) {
        /// EM01 Peak Current Setting
        IPKVAL: enum(u4) {
            /// Ipeak = 90mA, Iload = 36mA
            Load36mA = 0x3,
            /// Ipeak = 100mA, Iload = 40mA
            Load40mA = 0x4,
            /// Ipeak = 110mA, Iload = 44mA
            Load44mA = 0x5,
            /// Ipeak = 120mA, Iload = 48mA
            Load48mA = 0x6,
            /// Ipeak = 130mA, Iload = 52mA
            Load52mA = 0x7,
            /// Ipeak = 140mA, Iload = 56mA
            Load56mA = 0x8,
            /// Ipeak = 150mA, Iload = 60mA
            Load60mA = 0x9,
            _,
        } = .Load60mA,
        reserved8: u4 = 0,
        /// EM01 Drive Speed Setting
        DRVSPEED: enum(u2) {
            /// Not recommended for use (no benefit to this setting)
            BEST_EMI = 0x0,
            /// Recommended for use for best efficiency and low EMI
            DEFAULT_SETTING = 0x1,
            /// Not recommended for use (no benefit to this setting)
            INTERMEDIATE = 0x2,
            /// Not recommended for use (no benefit to this setting)
            BEST_EFFICIENCY = 0x3,
        } = .DEFAULT_SETTING,
        padding: u22 = 0,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// EM23 Configurations
    /// offset: 0x10
    EM23CTRL0: mmio.Mmio(packed struct(u32) {
        /// EM23 Peak Current Setting
        IPKVAL: enum(u4) {
            /// Ipeak = 90mA, Iload = 5 mA
            Load5mA = 0x3,
            /// Ipeak = 150mA, Iload = 10 mA
            Load10mA = 0x9,
            _,
        } = .Load5mA,
        reserved8: u4 = 0,
        /// EM23 Drive Speed Setting
        DRVSPEED: enum(u2) {
            /// Not recommended for use (no benefit to this setting)
            BEST_EMI = 0x0,
            /// Recommended for use for best efficiency and low EMI
            DEFAULT_SETTING = 0x1,
            /// Not recommended for use (no benefit to this setting)
            INTERMEDIATE = 0x2,
            /// Not recommended for use (no benefit to this setting)
            BEST_EFFICIENCY = 0x3,
        } = .DEFAULT_SETTING,
        padding: u22 = 0,
    }),
    /// offset: 0x14
    reserved20: [12]u8,
    /// PFMX Control Register
    /// offset: 0x20
    PFMXCTRL: mmio.Mmio(packed struct(u32) {
        /// PFMX mode Peak Current Setting
        IPKVAL: enum(u4) {
            /// Ipeak = 90 mA, Iload = 50 mA
            LOAD50MA = 0x3,
            /// Ipeak = 100 mA, Iload = 65 mA
            LOAD65MA = 0x4,
            /// Ipeak = 110 mA, Iload = 73 mA
            LOAD73MA = 0x5,
            /// Ipeak = 120 mA, Iload = 80 mA
            LOAD80MA = 0x6,
            /// Ipeak = 130 mA, Iload = 86 mA
            LOAD86MA = 0x7,
            /// Ipeak = 140 mA, Iload = 93 mA
            LOAD93MA = 0x8,
            /// Ipeak = 150 mA, Iload = 100 mA
            LOAD100MA = 0x9,
            /// Ipeak = 160 mA, Iload = 106 mA
            LOAD106MA = 0xa,
            /// Ipeak = 170 mA, Iload = 113 mA
            LOAD113MA = 0xb,
            /// Ipeak = 180 mA, Iload = 120 mA
            LOAD120MA = 0xc,
            _,
        } = .LOAD120MA,
        reserved8: u4 = 0,
        /// Ton_max timeout control
        IPKTMAXCTRL: u5 = 0xC,
        padding: u19 = 0,
    }),
    /// offset: 0x24
    reserved36: [4]u8,
    /// Interrupt Flags
    /// offset: 0x28
    IF: mmio.Mmio(packed struct(u32) {
        /// Bypass Switch Enabled
        BYPSW: u1 = 0x0,
        /// DCDC Warmup Time Done
        WARM: u1 = 0x0,
        /// DCDC Running
        RUNNING: u1 = 0x0,
        /// VREGIN below threshold
        VREGINLOW: u1 = 0x0,
        /// VREGIN above threshold
        VREGINHIGH: u1 = 0x0,
        /// DCDC in regulation
        REGULATION: u1 = 0x0,
        /// Ton_max Timeout Reached
        TMAX: u1 = 0x0,
        /// EM4 Entry Request Error
        EM4ERR: u1 = 0x0,
        /// Entered Pulse Pairing mode
        PPMODE: u1 = 0x0,
        /// Entered PFMX mode
        PFMXMODE: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// Interrupt Enable
    /// offset: 0x2c
    IEN: mmio.Mmio(packed struct(u32) {
        /// Bypass Switch Enabled Interrupt Enable
        BYPSW: u1 = 0x0,
        /// DCDC Warmup Time Done Interrupt Enable
        WARM: u1 = 0x0,
        /// DCDC Running Interrupt Enable
        RUNNING: u1 = 0x0,
        /// VREGIN below threshold Interrupt Enable
        VREGINLOW: u1 = 0x0,
        /// VREGIN above threshold Interrupt Enable
        VREGINHIGH: u1 = 0x0,
        /// DCDC in Regulation Interrupt Enable
        REGULATION: u1 = 0x0,
        /// Ton_max Timeout Interrupt Enable
        TMAX: u1 = 0x0,
        /// EM4 Entry Req Interrupt Enable
        EM4ERR: u1 = 0x0,
        /// Pulse Pairing Mode Interrupt Enable
        PPMODE: u1 = 0x0,
        /// PFMX Mode Interrupt Enable
        PFMXMODE: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// DCDC Status Register
    /// offset: 0x30
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Bypass Switch is currently enabled
        BYPSW: u1 = 0x0,
        /// DCDC Warmup Done
        WARM: u1 = 0x0,
        /// DCDC is running
        RUNNING: u1 = 0x0,
        /// VREGVDD comparator status
        VREGIN: u1 = 0x0,
        /// Bypass Comparator Output
        BYPCMPOUT: u1 = 0x0,
        reserved8: u3 = 0,
        /// DCDC in pulse-pairing mode
        PPMODE: u1 = 0x0,
        /// DCDC in PFMX mode
        PFMXMODE: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// Syncbusy Status Register
    /// offset: 0x34
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// CTRL Sync Busy Status
        CTRL: u1 = 0x0,
        /// EM01CTRL0 Sync Busy Status
        EM01CTRL0: u1 = 0x0,
        /// EM01CTRL1 Sync Bust Status
        EM01CTRL1: u1 = 0x0,
        /// EM23CTRL0 Sync Busy Status
        EM23CTRL0: u1 = 0x0,
        reserved7: u3 = 0,
        /// PFMXCTRL Sync Busy Status
        PFMXCTRL: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// offset: 0x38
    reserved56: [8]u8,
    /// No Description
    /// offset: 0x40
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock Key
        LOCKKEY: enum(u16) {
            /// UNLOCKKEY
            UNLOCKKEY = 0xabcd,
            _,
        } = @enumFromInt(0x0),
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x44
    LOCKSTATUS: mmio.Mmio(packed struct(u32) {
        /// Lock Status
        LOCK: enum(u1) {
            /// Unlocked State
            UNLOCKED = 0x0,
            /// LOCKED STATE
            LOCKED = 0x1,
        } = .UNLOCKED,
        padding: u31 = 0,
    }),
};
