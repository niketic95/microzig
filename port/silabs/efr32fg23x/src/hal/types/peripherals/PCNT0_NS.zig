const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// PCNT0_NS Registers
pub const PCNT0_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP VERSION
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// PCNT Module Enable
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
        /// Mode Select
        MODE: enum(u3) {
            /// Single input EM23GRPACLK oversampling mode (available in EM0-EM3).
            OVSSINGLE = 0x0,
            /// Externally clocked single input counter mode (available in EM0-EM3).
            EXTCLKSINGLE = 0x1,
            /// Externally clocked quadrature decoder mode (available in EM0-EM3).
            EXTCLKQUAD = 0x2,
            /// EM23GRPACLK oversampling quadrature decoder 1X mode (available in EM0-EM3).
            OVSQUAD1X = 0x3,
            /// EM23GRPACLK oversampling quadrature decoder 2X mode (available in EM0-EM3).
            OVSQUAD2X = 0x4,
            /// EM23GRPACLK oversampling quadrature decoder 4X mode (available in EM0-EM3).
            OVSQUAD4X = 0x5,
            _,
        } = .OVSSINGLE,
        reserved4: u1 = 0,
        /// Debug Mode Halt Enable
        DEBUGHALT: enum(u1) {
            /// PCNT is running in debug mode.
            DISABLE = 0x0,
            /// PCNT is frozen in debug mode.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Enable Digital Pulse Width Filter
        FILTEN: u1 = 0x0,
        /// Enable Hysteresis
        HYST: u1 = 0x0,
        reserved8: u1 = 0,
        /// S0IN PRS Enable
        S0PRSEN: u1 = 0x0,
        /// S1IN PRS Enable
        S1PRSEN: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x10
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Count Direction Determined By S1
        S1CDIR: u1 = 0x0,
        /// Non-Quadrature Mode Counter Direction Co
        CNTDIR: enum(u1) {
            /// Up counter mode.
            UP = 0x0,
            /// Down counter mode.
            DOWN = 0x1,
        } = .UP,
        /// Edge Select
        EDGE: enum(u1) {
            /// Positive edges on the PCNTn_S0IN inputs are counted in OVSSINGLE mode. Does not invert PCNTn_S1IN input in OVSSINGLE and EXTCLKSINGLE modes
            POS = 0x0,
            /// Negative edges on the PCNTn_S0IN inputs are counted in OVSSINGLE mode. Inverts the PCNTn_S1IN input in OVSSINGLE and EXTCLKSINGLE modes
            NEG = 0x1,
        } = .POS,
        reserved4: u1 = 0,
        /// Controls When the Counter Counts
        CNTEV: enum(u2) {
            /// Counts up on up-count and down on down-count events.
            BOTH = 0x0,
            /// Only counts up on up-count events.
            UP = 0x1,
            /// Only counts down on down-count events.
            DOWN = 0x2,
            _,
        } = .BOTH,
        /// Controls When the Aux Counter Counts
        AUXCNTEV: enum(u2) {
            /// Counts up on both up-count and down-count events.
            BOTH = 0x0,
            /// Counts up on up-count events.
            UP = 0x1,
            /// Counts up on down-count events.
            DOWN = 0x2,
            _,
        } = .BOTH,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x14
    CMD: mmio.Mmio(packed struct(u32) {
        /// PCNT Clock Domain Reset
        CORERST: u1 = 0x0,
        /// CNT Reset
        CNTRST: u1 = 0x0,
        /// AUXCNT Reset
        AUXCNTRST: u1 = 0x0,
        reserved4: u1 = 0,
        /// Load CNT Immediately
        LCNTIM: u1 = 0x0,
        reserved8: u3 = 0,
        /// Start Main Counter
        STARTCNT: u1 = 0x0,
        /// Start Aux Counter
        STARTAUXCNT: u1 = 0x0,
        /// Stop Main Counter
        STOPCNT: u1 = 0x0,
        /// Stop Aux Counter
        STOPAUXCNT: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x18
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Current Counter Direction
        DIR: enum(u1) {
            /// Up counter mode (clockwise in EXTCLKQUAD mode with the EDGE bit in PCNTn_CTRL set to 0).
            UP = 0x0,
            /// Down counter mode.
            DOWN = 0x1,
        } = .UP,
        /// TOP Buffer Valid
        TOPBV: u1 = 0x0,
        /// Lock Status
        PCNTLOCKSTATUS: enum(u1) {
            /// PCNT registers are unlocked
            UNLOCKED = 0x0,
            /// PCNT registers are locked
            LOCKED = 0x1,
        } = .UNLOCKED,
        /// Main Counter running status
        CNTRUNNING: u1 = 0x0,
        /// Aux Counter running status
        AUXCNTRUNNING: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    IF: mmio.Mmio(packed struct(u32) {
        /// Underflow Interrupt Read Flag
        UF: u1 = 0x0,
        /// Overflow Interrupt Read Flag
        OF: u1 = 0x0,
        /// Direction Change Detect Interrupt Flag
        DIRCNG: u1 = 0x0,
        /// Auxiliary Overflow Interrupt Read Flag
        AUXOF: u1 = 0x0,
        /// Oversampling Quad State Err Int Flag
        OQSTERR: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x20
    IEN: mmio.Mmio(packed struct(u32) {
        /// Underflow Interrupt Read Flag
        UF: u1 = 0x0,
        /// Overflow Interrupt Read Flag
        OF: u1 = 0x0,
        /// Direction Change Detect Interrupt Flag
        DIRCNG: u1 = 0x0,
        /// Auxiliary Overflow Interrupt Read Flag
        AUXOF: u1 = 0x0,
        /// Oversampling Quad State Err Int Flag
        OQSTERR: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x24
    CNT: mmio.Mmio(packed struct(u32) {
        /// Counter Value
        CNT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x28
    AUXCNT: mmio.Mmio(packed struct(u32) {
        /// Auxiliary Counter Value
        AUXCNT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x2c
    TOP: mmio.Mmio(packed struct(u32) {
        /// Counter Top Value
        TOP: u16 = 0xFF,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x30
    TOPB: mmio.Mmio(packed struct(u32) {
        /// Counter Top Buffer Register
        TOPB: u16 = 0xFF,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x34
    OVSCTRL: mmio.Mmio(packed struct(u32) {
        /// Configure Filter Length for Inputs S0IN
        FILTLEN: u8 = 0x0,
        reserved12: u4 = 0,
        /// Flutter Remove
        FLUTTERRM: u1 = 0x0,
        padding: u19 = 0,
    }),
    /// No Description
    /// offset: 0x38
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// CTRL Register Busy
        CTRL: u1 = 0x0,
        /// CMD Register Busy
        CMD: u1 = 0x0,
        /// TOP Register Busy
        TOP: u1 = 0x0,
        /// TOPB Register Busy
        TOPB: u1 = 0x0,
        /// OVSCTRL Register Busy
        OVSCTRL: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x3c
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock Key
        PCNTLOCKKEY: enum(u16) {
            /// Write to unock PCNT lockable registers
            UNLOCK = 0xa7e0,
            _,
        } = @enumFromInt(0x0),
        padding: u16 = 0,
    }),
};
