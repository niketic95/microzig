const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// HFXO0_S Registers
pub const HFXO0_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version ID
        IPVERSION: u32 = 0x3,
    }),
    /// offset: 0x04
    reserved4: [12]u8,
    /// No Description
    /// offset: 0x10
    XTALCFG: mmio.Mmio(packed struct(u32) {
        /// Intermediate Startup Core Bias Current
        COREBIASSTARTUPI: u6 = 0x20,
        /// Startup Core Bias Current
        COREBIASSTARTUP: u6 = 0x20,
        /// Startup Tuning Capacitance on XI
        CTUNEXISTARTUP: u4 = 0x0,
        /// Startup Tuning Capacitance on XO
        CTUNEXOSTARTUP: u4 = 0x0,
        /// Steady State Timeout
        TIMEOUTSTEADY: enum(u4) {
            /// The steady state timeout is set to 16 us minimum. The maximum can be +40%.
            T4US = 0x0,
            /// The steady state timeout is set to 41 us minimum. The maximum can be +40%.
            T16US = 0x1,
            /// The steady state timeout is set to 83 us minimum. The maximum can be +40%.
            T41US = 0x2,
            /// The steady state timeout is set to 125 us minimum. The maximum can be +40%.
            T83US = 0x3,
            /// The steady state timeout is set to 166 us minimum. The maximum can be +40%.
            T125US = 0x4,
            /// The steady state timeout is set to 208 us minimum. The maximum can be +40%.
            T166US = 0x5,
            /// The steady state timeout is set to 250 us minimum. The maximum can be +40%.
            T208US = 0x6,
            /// The steady state timeout is set to 333 us minimum. The maximum can be +40%.
            T250US = 0x7,
            /// The steady state timeout is set to 416 us minimum. The maximum can be +40%.
            T333US = 0x8,
            /// The steady state timeout is set to 500 us minimum. The maximum can be +40%.
            T416US = 0x9,
            /// The steady state timeout is set to 666 us minimum. The maximum can be +40%.
            T500US = 0xa,
            /// The steady state timeout is set to 833 us minimum. The maximum can be +40%.
            T666US = 0xb,
            /// The steady state timeout is set to 1666 us minimum. The maximum can be +40%.
            T833US = 0xc,
            /// The steady state timeout is set to 2500 us minimum. The maximum can be +40%.
            T1666US = 0xd,
            /// The steady state timeout is set to 4166 us minimum. The maximum can be +40%.
            T2500US = 0xe,
            /// The steady state timeout is set to 7500 us minimum. The maximum can be +40%.
            T4166US = 0xf,
        } = .T666US,
        /// Core Bias LSB Change Timeout
        TIMEOUTCBLSB: enum(u4) {
            /// The core bias LSB change timeout is set to 8 us minimum. The maximum can be +40%.
            T8US = 0x0,
            /// The core bias LSB change timeout is set to 20 us minimum. The maximum can be +40%.
            T20US = 0x1,
            /// The core bias LSB change timeout is set to 41 us minimum. The maximum can be +40%.
            T41US = 0x2,
            /// The core bias LSB change timeout is set to 62 us minimum. The maximum can be +40%.
            T62US = 0x3,
            /// The core bias LSB change timeout is set to 83 us minimum. The maximum can be +40%.
            T83US = 0x4,
            /// The core bias LSB change timeout is set to 104 us minimum. The maximum can be +40%.
            T104US = 0x5,
            /// The core bias LSB change timeout is set to 125 us minimum. The maximum can be +40%.
            T125US = 0x6,
            /// The core bias LSB change timeout is set to 166 us minimum. The maximum can be +40%.
            T166US = 0x7,
            /// The core bias LSB change timeout is set to 208 us minimum. The maximum can be +40%.
            T208US = 0x8,
            /// The core bias LSB change timeout is set to 250 us minimum. The maximum can be +40%.
            T250US = 0x9,
            /// The core bias LSB change timeout is set to 333 us minimum. The maximum can be +40%.
            T333US = 0xa,
            /// The core bias LSB change timeout is set to 416 us minimum. The maximum can be +40%.
            T416US = 0xb,
            /// The core bias LSB change timeout is set to 833 us minimum. The maximum can be +40%.
            T833US = 0xc,
            /// The core bias LSB change timeout is set to 1250 us minimum. The maximum can be +40%.
            T1250US = 0xd,
            /// The core bias LSB change timeout is set to 2083 us minimum. The maximum can be +40%.
            T2083US = 0xe,
            /// The core bias LSB change timeout is set to 3750 us minimum. The maximum can be +40%.
            T3750US = 0xf,
        } = .T416US,
        padding: u4 = 0,
    }),
    /// offset: 0x14
    reserved20: [4]u8,
    /// No Description
    /// offset: 0x18
    XTALCTRL: mmio.Mmio(packed struct(u32) {
        /// Core Bias Current
        COREBIASANA: u8 = 0x3C,
        /// Tuning Capacitance on XI
        CTUNEXIANA: u8 = 0x3C,
        /// Tuning Capacitance on XO
        CTUNEXOANA: u8 = 0x3C,
        /// Fixed Tuning Capacitance
        CTUNEFIXANA: enum(u2) {
            /// Remove fixed capacitance on XI and XO nodes
            NONE = 0x0,
            /// Adds fixed capacitance on XI node
            XI = 0x1,
            /// Adds fixed capacitance on XO node
            XO = 0x2,
            /// Adds fixed capacitance on both XI and XO nodes
            BOTH = 0x3,
        } = .BOTH,
        /// Core Degeneration
        COREDGENANA: enum(u2) {
            /// Do not apply core degeneration resistence
            NONE = 0x0,
            /// Apply 33 ohm core degeneration resistence
            DGEN33 = 0x1,
            /// Apply 50 ohm core degeneration resistence
            DGEN50 = 0x2,
            /// Apply 100 ohm core degeneration resistence
            DGEN100 = 0x3,
        } = .NONE,
        reserved31: u3 = 0,
        /// Skip Core Bias Optimization
        SKIPCOREBIASOPT: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x1c
    XTALCTRL1: mmio.Mmio(packed struct(u32) {
        /// BUFOUT Tuning Capacitance on XI
        CTUNEXIBUFOUTANA: u8 = 0x3C,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x20
    CFG: mmio.Mmio(packed struct(u32) {
        /// Crystal Oscillator Mode
        MODE: enum(u2) {
            /// crystal oscillator
            XTAL = 0x0,
            /// external sinusoidal clock can be supplied on XI pin.
            EXTCLK = 0x1,
            /// external sinusoidal clock can be supplied on XI pin (peak detector used).
            EXTCLKPKDET = 0x2,
            _,
        } = .XTAL,
        /// Enable XI Internal DC Bias
        ENXIDCBIASANA: u1 = 0x0,
        /// Squaring Buffer Schmitt Trigger
        SQBUFSCHTRGANA: enum(u1) {
            /// Squaring buffer schmitt trigger is disabled
            DISABLE = 0x0,
            /// Squaring buffer schmitt trigger is enabled
            ENABLE = 0x1,
        } = .DISABLE,
        reserved28: u24 = 0,
        /// Force Low Frequency Timeout
        FORCELFTIMEOUT: u1 = 0x1,
        padding: u3 = 0,
    }),
    /// offset: 0x24
    reserved36: [4]u8,
    /// No Description
    /// offset: 0x28
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Freeze BUFOUT Controls
        BUFOUTFREEZE: u1 = 0x0,
        reserved2: u1 = 0,
        /// Keep Warm
        KEEPWARM: u1 = 0x0,
        /// On-demand During EM23
        EM23ONDEMAND: u1 = 0x0,
        /// Force XI Pin to Ground
        FORCEXI2GNDANA: enum(u1) {
            /// Disabled (not pulled)
            DISABLE = 0x0,
            /// Enabled (pulled)
            ENABLE = 0x1,
        } = .DISABLE,
        /// Force XO Pin to Ground
        FORCEXO2GNDANA: enum(u1) {
            /// Disabled (not pulled)
            DISABLE = 0x0,
            /// Enabled (pulled)
            ENABLE = 0x1,
        } = .DISABLE,
        /// Force Tuning Cap to Max Value
        FORCECTUNEMAX: u1 = 0x1,
        reserved8: u1 = 0,
        /// PRS Status 0 Output Select
        PRSSTATUSSEL0: enum(u4) {
            /// PRS mux outputs 0
            DISABLED = 0x0,
            /// PRS mux outputs enabled status
            ENS = 0x1,
            /// PRS mux outputs core bias optimization ready status
            COREBIASOPTRDY = 0x2,
            /// PRS mux outputs ready status
            RDY = 0x3,
            /// PRS mux outputs PRS ready status
            PRSRDY = 0x4,
            /// PRS mux outputs BUFOUT ready status
            BUFOUTRDY = 0x5,
            /// PRS mux outputs oscillator requested by digital clock status
            HWREQ = 0x8,
            /// PRS mux outputs oscillator requested by PRS request status
            PRSHWREQ = 0x9,
            /// PRS mux outputs oscillator requested by BUFOUT request status
            BUFOUTHWREQ = 0xa,
            _,
        } = .DISABLED,
        /// PRS Status 1 Output Select
        PRSSTATUSSEL1: enum(u4) {
            /// PRS mux outputs 0
            DISABLED = 0x0,
            /// PRS mux outputs enabled status
            ENS = 0x1,
            /// PRS mux outputs core bias optimization ready status
            COREBIASOPTRDY = 0x2,
            /// PRS mux outputs ready status
            RDY = 0x3,
            /// PRS mux outputs PRS ready status
            PRSRDY = 0x4,
            /// PRS mux outputs BUFOUT ready status
            BUFOUTRDY = 0x5,
            /// PRS mux outputs oscillator requested by digital clock status
            HWREQ = 0x8,
            /// PRS mux outputs oscillator requested by PRS request status
            PRSHWREQ = 0x9,
            /// PRS mux outputs oscillator requested by BUFOUT request status
            BUFOUTHWREQ = 0xa,
            _,
        } = .DISABLED,
        /// Force Digital Clock Request
        FORCEEN: u1 = 0x0,
        /// Force PRS Oscillator Request
        FORCEENPRS: u1 = 0x0,
        /// Force BUFOUT Request
        FORCEENBUFOUT: u1 = 0x0,
        reserved24: u5 = 0,
        /// Disable On-demand For Digital Clock
        DISONDEMAND: u1 = 0x1,
        /// Disable On-demand For PRS
        DISONDEMANDPRS: u1 = 0x1,
        /// Disable On-demand For BUFOUT
        DISONDEMANDBUFOUT: u1 = 0x1,
        padding: u5 = 0,
    }),
    /// offset: 0x2c
    reserved44: [20]u8,
    /// No Description
    /// offset: 0x40
    BUFOUTTRIM: mmio.Mmio(packed struct(u32) {
        /// BUFOUT Reference Trim
        VTRTRIMANA: u4 = 0x8,
        padding: u28 = 0,
    }),
    /// No Description
    /// offset: 0x44
    BUFOUTCTRL: mmio.Mmio(packed struct(u32) {
        /// Driver Bias Current
        XOUTBIASANA: u4 = 0x5,
        /// Buffer Gain
        XOUTCFANA: u4 = 0x1,
        /// No Description
        XOUTGMANA: u4 = 0xC,
        /// Peak Detector Threshold for XOUT
        PEAKDETTHRESANA: enum(u4) {
            /// V105MV
            V105MV = 0x0,
            /// V132MV
            V132MV = 0x1,
            /// V157MV
            V157MV = 0x2,
            /// V184MV
            V184MV = 0x3,
            /// V210MV
            V210MV = 0x4,
            /// V236MV
            V236MV = 0x5,
            /// V262MV
            V262MV = 0x6,
            /// V289MV
            V289MV = 0x7,
            /// V315MV
            V315MV = 0x8,
            /// V341MV
            V341MV = 0x9,
            /// V367MV
            V367MV = 0xa,
            /// V394MV
            V394MV = 0xb,
            /// V420MV
            V420MV = 0xc,
            /// V446MV
            V446MV = 0xd,
            /// V472MV
            V472MV = 0xe,
            /// V499MV
            V499MV = 0xf,
        } = .V184MV,
        /// Tuning Cap Change Timeout
        TIMEOUTCTUNE: enum(u4) {
            /// The tuning cap change timeout is set to 2 us minimum. The maximum can be +40%.
            T2US = 0x0,
            /// The tuning cap change timeout is set to 5 us minimum. The maximum can be +40%.
            T5US = 0x1,
            /// The tuning cap change timeout is set to 10 us minimum. The maximum can be +40%.
            T10US = 0x2,
            /// The tuning cap change timeout is set to 16 us minimum. The maximum can be +40%.
            T16US = 0x3,
            /// The tuning cap change timeout is set to 21 us minimum. The maximum can be +40%.
            T21US = 0x4,
            /// The tuning cap change timeout is set to 26 us minimum. The maximum can be +40%.
            T26US = 0x5,
            /// The tuning cap change timeout is set to 31 us minimum. The maximum can be +40%.
            T31US = 0x6,
            /// The tuning cap change timeout is set to 42 us minimum. The maximum can be +40%.
            T42US = 0x7,
            /// The tuning cap change timeout is set to 52 us minimum. The maximum can be +40%.
            T52US = 0x8,
            /// The tuning cap change timeout is set to 63 us minimum. The maximum can be +40%.
            T63US = 0x9,
            /// The tuning cap change timeout is set to 83 us minimum. The maximum can be +40%.
            T83US = 0xa,
            /// The tuning cap change timeout is set to 104 us minimum. The maximum can be +40%.
            T104US = 0xb,
            /// The tuning cap change timeout is set to 208 us minimum. The maximum can be +40%.
            T208US = 0xc,
            /// The tuning cap change timeout is set to 313 us minimum. The maximum can be +40%.
            T313US = 0xd,
            /// The tuning cap change timeout is set to 521 us minimum. The maximum can be +40%.
            T521US = 0xe,
            /// The tuning cap change timeout is set to 938 us minimum. The maximum can be +40%.
            T938US = 0xf,
        } = .T21US,
        /// Oscillator Startup Timeout
        TIMEOUTSTARTUP: enum(u4) {
            /// The oscillator startup timeout is set to 42 us minimum. The maximum can be +40%.
            T42US = 0x0,
            /// The oscillator startup timeout is set to 83 us minimum. The maximum can be +40%.
            T83US = 0x1,
            /// The oscillator startup timeout is set to 108 us minimum. The maximum can be +40%.
            T108US = 0x2,
            /// The oscillator startup timeout is set to 133 us minimum. The maximum can be +40%.
            T133US = 0x3,
            /// The oscillator startup timeout is set to 158 us minimum. The maximum can be +40%.
            T158US = 0x4,
            /// The oscillator startup timeout is set to 183 us minimum. The maximum can be +40%.
            T183US = 0x5,
            /// The oscillator startup timeout is set to 208 us minimum. The maximum can be +40%.
            T208US = 0x6,
            /// The oscillator startup timeout is set to 233 us minimum. The maximum can be +40%.
            T233US = 0x7,
            /// The oscillator startup timeout is set to 258 us minimum. The maximum can be +40%.
            T258US = 0x8,
            /// The oscillator startup timeout is set to 283 us minimum. The maximum can be +40%.
            T283US = 0x9,
            /// The oscillator startup timeout is set to 333 us minimum. The maximum can be +40%.
            T333US = 0xa,
            /// The oscillator startup timeout is set to 375 us minimum. The maximum can be +40%.
            T375US = 0xb,
            /// The oscillator startup timeout is set to 417 us minimum. The maximum can be +40%.
            T417US = 0xc,
            /// The oscillator startup timeout is set to 458 us minimum. The maximum can be +40%.
            T458US = 0xd,
            /// The oscillator startup timeout is set to 500 us minimum. The maximum can be +40%.
            T500US = 0xe,
            /// The oscillator startup timeout is set to 667 us minimum. The maximum can be +40%.
            T667US = 0xf,
        } = .T208US,
        reserved31: u7 = 0,
        /// Minimum Startup Delay
        MINIMUMSTARTUPDELAY: u1 = 0x0,
    }),
    /// offset: 0x48
    reserved72: [8]u8,
    /// No Description
    /// offset: 0x50
    CMD: mmio.Mmio(packed struct(u32) {
        /// Core Bias Optimizaton
        COREBIASOPT: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// offset: 0x54
    reserved84: [4]u8,
    /// No Description
    /// offset: 0x58
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Ready Status
        RDY: u1 = 0x0,
        /// Core Bias Optimization Ready
        COREBIASOPTRDY: u1 = 0x0,
        /// PRS Ready Status
        PRSRDY: u1 = 0x0,
        /// BUFOUT Ready Status
        BUFOUTRDY: u1 = 0x0,
        reserved15: u11 = 0,
        /// BUFOUT Frozen
        BUFOUTFROZEN: u1 = 0x0,
        /// Enabled Status
        ENS: u1 = 0x0,
        /// Oscillator Requested by Digital Clock
        HWREQ: u1 = 0x0,
        reserved19: u1 = 0,
        /// Oscillator Is Kept Warm
        ISWARM: u1 = 0x0,
        /// Oscillator Requested by PRS Request
        PRSHWREQ: u1 = 0x0,
        /// Oscillator Requested by BUFOUT Request
        BUFOUTHWREQ: u1 = 0x0,
        reserved30: u8 = 0,
        /// Sync Busy
        SYNCBUSY: u1 = 0x0,
        /// Configuration Lock Status
        LOCK: enum(u1) {
            /// Configuration lock is unlocked
            UNLOCKED = 0x0,
            /// Configuration lock is locked
            LOCKED = 0x1,
        } = .UNLOCKED,
    }),
    /// offset: 0x5c
    reserved92: [20]u8,
    /// No Description
    /// offset: 0x70
    IF: mmio.Mmio(packed struct(u32) {
        /// Digital Clock Ready Interrupt
        RDY: u1 = 0x0,
        /// Core Bias Optimization Ready Interrupt
        COREBIASOPTRDY: u1 = 0x0,
        /// PRS Ready Interrupt
        PRSRDY: u1 = 0x0,
        /// BUFOUT Ready Interrupt
        BUFOUTRDY: u1 = 0x0,
        reserved15: u11 = 0,
        /// BUFOUT FROZEN Interrupt
        BUFOUTFROZEN: u1 = 0x0,
        reserved20: u4 = 0,
        /// PRS Requset Error Interrupt
        PRSERR: u1 = 0x0,
        /// BUFOUT Request Error Interrupt
        BUFOUTERR: u1 = 0x0,
        reserved27: u5 = 0,
        /// BUFOUT Freeze Error Interrupt
        BUFOUTFREEZEERR: u1 = 0x0,
        /// BUFOUT Did Not Start Error Interrupt
        BUFOUTDNSERR: u1 = 0x0,
        /// Did Not Start Error Interrupt
        DNSERR: u1 = 0x0,
        /// Low Frequency Timeout Error Interrupt
        LFTIMEOUTERR: u1 = 0x0,
        /// Core Bias Optimization Error Interrupt
        COREBIASOPTERR: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x74
    IEN: mmio.Mmio(packed struct(u32) {
        /// Digital Clock Ready Interrupt
        RDY: u1 = 0x0,
        /// Core Bias Optimization Ready Interrupt
        COREBIASOPTRDY: u1 = 0x0,
        /// PRS Ready Interrupt
        PRSRDY: u1 = 0x0,
        /// BUFOUT Ready Interrupt
        BUFOUTRDY: u1 = 0x0,
        reserved15: u11 = 0,
        /// BUFOUT FROZEN Interrupt
        BUFOUTFROZEN: u1 = 0x0,
        reserved20: u4 = 0,
        /// PRS Requset Error Interrupt
        PRSERR: u1 = 0x0,
        /// BUFOUT Request Error Interrupt
        BUFOUTERR: u1 = 0x0,
        reserved27: u5 = 0,
        /// BUFOUT Freeze Error Interrupt
        BUFOUTFREEZEERR: u1 = 0x0,
        /// BUFOUT Did Not Start Error Interrupt
        BUFOUTDNSERR: u1 = 0x0,
        /// Did Not Start Error Interrupt
        DNSERR: u1 = 0x0,
        /// Low Frequency Timeout Error Interrupt
        LFTIMEOUTERR: u1 = 0x0,
        /// Core Bias Optimization Error Interrupt
        COREBIASOPTERR: u1 = 0x0,
    }),
    /// offset: 0x78
    reserved120: [8]u8,
    /// No Description
    /// offset: 0x80
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock Key
        LOCKKEY: enum(u16) {
            /// Write this value to unlock
            UNLOCK = 0x580e,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
};
