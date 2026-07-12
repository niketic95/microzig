const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// KEYSCAN_S Registers
pub const KEYSCAN_S = extern struct {
    /// IPVERSION
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IPVERSION
        IPVERSION: u32 = 0x1,
    }),
    /// Enable
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// Enable
        EN: enum(u1) {
            /// Stops clocking and resets peripheral core logic.
            DISABLE = 0x0,
            /// Enables clocking, and begins scanning if CFG.AUTOSTART is 0x1.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Disablement busy status
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// Software Reset
    /// offset: 0x08
    SWRST: mmio.Mmio(packed struct(u32) {
        /// Software reset command
        SWRST: u1 = 0x0,
        /// Software reset busy status
        RESETTING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// Config
    /// offset: 0x0c
    CFG: mmio.Mmio(packed struct(u32) {
        /// Clock Divider
        CLKDIV: u18 = 0x1387F,
        reserved20: u2 = 0,
        /// Single Press
        SINGLEPRESS: enum(u1) {
            /// After KEYIF is set and then cleared, scanning will continue. This can give multiple interrupts for the same key press, but allow multiple key presses to be detected. To use this mode for multi-key detection, the ISR should update a section of memory of COLNUM bytes on each interrupt, until key release is detected. After key release, the section of memory where key presses are recorded can be processed.
            MULTIPRESS = 0x0,
            /// After KEYIF has been set and cleared, it will not set again until no key press is detected. This allows faster response since the ISR can start processing data as soon as the KEYIF is set.
            SINGLEPRESS = 0x1,
        } = .MULTIPRESS,
        reserved22: u1 = 0,
        /// Automatically Start
        AUTOSTART: enum(u1) {
            /// Auto start is disabled
            AUTOSTARTDIS = 0x0,
            /// Auto start is enabled
            AUTOSTARTEN = 0x1,
        } = .AUTOSTARTDIS,
        reserved24: u1 = 0,
        /// Number of Rows
        NUMROWS: enum(u3) {
            /// 1 Row is not supported; defaults to 3 instead
            RSV1 = 0x0,
            /// 2 Rows are not supported; defaults to 3 instead
            RSV2 = 0x1,
            /// 3 Rows
            ROW3 = 0x2,
            /// 4 Rows
            ROW4 = 0x3,
            /// 5 Rows
            ROW5 = 0x4,
            /// 6 Rows
            ROW6 = 0x5,
            _,
        } = .ROW6,
        reserved28: u1 = 0,
        /// Number of Columns
        NUMCOLS: u3 = 0x2,
        padding: u1 = 0,
    }),
    /// Command
    /// offset: 0x10
    CMD: mmio.Mmio(packed struct(u32) {
        /// Keyscan Start
        KEYSCANSTART: u1 = 0x0,
        /// Keyscan Stop
        KEYSCANSTOP: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// Delay
    /// offset: 0x14
    DELAY: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Scan Delay
        SCANDLY: enum(u4) {
            /// 2ms Scan Delay
            SCANDLY2 = 0x0,
            /// 4ms Scan Delay
            SCANDLY4 = 0x1,
            /// 6ms Scan Delay
            SCANDLY6 = 0x2,
            /// 8ms Scan Delay
            SCANDLY8 = 0x3,
            /// 10ms Scan Delay
            SCANDLY10 = 0x4,
            /// 12ms Scan Delay
            SCANDLY12 = 0x5,
            /// 14ms Scan Delay
            SCANDLY14 = 0x6,
            /// 16ms Scan Delay
            SCANDLY16 = 0x7,
            /// 18ms Scan Delay
            SCANDLY18 = 0x8,
            /// 20ms Scan Delay
            SCANDLY20 = 0x9,
            /// 22ms Scan Delay
            SCANDLY22 = 0xa,
            /// 24ms Scan Delay
            SCANDLY24 = 0xb,
            /// 26ms Scan Delay
            SCANDLY26 = 0xc,
            /// 28ms Scan Delay
            SCANDLY28 = 0xd,
            /// 30ms Scan Delay
            SCANDLY30 = 0xe,
            /// 32ms Scan Delay
            SCANDLY32 = 0xf,
        } = .SCANDLY2,
        reserved16: u4 = 0,
        /// Debounce Delay
        DEBDLY: enum(u4) {
            /// 2ms Debounce Delay
            DEBDLY2 = 0x0,
            /// 4ms Debounce Delay
            DEBDLY4 = 0x1,
            /// 6ms Debounce Delay
            DEBDLY6 = 0x2,
            /// 8ms Debounce Delay
            DEBDLY8 = 0x3,
            /// 10ms Debounce Delay
            DEBDLY10 = 0x4,
            /// 12ms Debounce Delay
            DEBDLY12 = 0x5,
            /// 14ms Debounce Delay
            DEBDLY14 = 0x6,
            /// 16ms Debounce Delay
            DEBDLY16 = 0x7,
            /// 18ms Debounce Delay
            DEBDLY18 = 0x8,
            /// 20ms Debounce Delay
            DEBDLY20 = 0x9,
            /// 22ms Debounce Delay
            DEBDLY22 = 0xa,
            /// 24ms Debounce Delay
            DEBDLY24 = 0xb,
            /// 26ms Debounce Delay
            DEBDLY26 = 0xc,
            /// 28ms Debounce Delay
            DEBDLY28 = 0xd,
            /// 30ms Debounce Delay
            DEBDLY30 = 0xe,
            /// 32ms Debounce Delay
            DEBDLY32 = 0xf,
        } = .DEBDLY2,
        reserved24: u4 = 0,
        /// Row stable Delay
        STABDLY: enum(u4) {
            /// 2ms Row Stable Delay
            STABDLY2 = 0x0,
            /// 4ms Row Stable Delay
            STABDLY4 = 0x1,
            /// 6ms Row Stable Delay
            STABDLY6 = 0x2,
            /// 8ms Row Stable Delay
            STABDLY8 = 0x3,
            /// 10ms Row Stable Delay
            STABDLY10 = 0x4,
            /// 12ms Row Stable Delay
            STABDLY12 = 0x5,
            /// 14ms Row Stable Delay
            STABDLY14 = 0x6,
            /// 16ms Row Stable Delay
            STABDLY16 = 0x7,
            /// 18ms Row Stable Delay
            STABDLY18 = 0x8,
            /// 20ms Row Stable Delay
            STABDLY20 = 0x9,
            /// 22ms Row Stable Delay
            STABDLY22 = 0xa,
            /// 24ms Row Stable Delay
            STABDLY24 = 0xb,
            /// 26ms Row Stable Delay
            STABDLY26 = 0xc,
            /// 28ms Row Stable Delay
            STABDLY28 = 0xd,
            /// 30ms Row Stable Delay
            STABDLY30 = 0xe,
            /// 32ms Row Stable Delay
            STABDLY32 = 0xf,
        } = .STABDLY2,
        padding: u4 = 0,
    }),
    /// Status
    /// offset: 0x18
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Row detection
        ROW: u6 = 0x0,
        reserved16: u10 = 0,
        /// Running
        RUNNING: u1 = 0x0,
        reserved24: u7 = 0,
        /// Column Latched
        COL: u3 = 0x0,
        reserved30: u3 = 0,
        /// No Key pressed status
        NOKEY: u1 = 0x1,
        /// Sync Busy
        SYNCBUSY: u1 = 0x0,
    }),
    /// Interrupt Flags
    /// offset: 0x1c
    IF: mmio.Mmio(packed struct(u32) {
        /// No key was pressed
        NOKEY: u1 = 0x0,
        /// A key was pressed
        KEY: u1 = 0x0,
        /// Completed scan
        SCANNED: u1 = 0x0,
        /// Wake up
        WAKEUP: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// Interrupt Enables
    /// offset: 0x20
    IEN: mmio.Mmio(packed struct(u32) {
        /// No Key was pressed
        NOKEY: u1 = 0x0,
        /// A Key was pressed
        KEY: u1 = 0x0,
        /// Completed Scanning
        SCANNED: u1 = 0x0,
        /// Wake up
        WAKEUP: u1 = 0x0,
        padding: u28 = 0,
    }),
};
