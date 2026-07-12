const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// TIMER0_NS Registers
pub const TIMER0_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version ID
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    CFG: mmio.Mmio(packed struct(u32) {
        /// Timer Mode
        MODE: enum(u2) {
            /// Up-count mode
            UP = 0x0,
            /// Down-count mode
            DOWN = 0x1,
            /// Up/down-count mode
            UPDOWN = 0x2,
            /// Quadrature decoder mode
            QDEC = 0x3,
        } = .UP,
        reserved3: u1 = 0,
        /// Timer Start/Stop/Reload Synchronization
        SYNC: enum(u1) {
            /// Timer operation is unaffected by other timers.
            DISABLE = 0x0,
            /// Timer may be started, stopped and re-loaded from other timer instances.
            ENABLE = 0x1,
        } = .DISABLE,
        /// One-shot Mode Enable
        OSMEN: u1 = 0x0,
        /// Quadrature Decoder Mode Selection
        QDM: enum(u1) {
            /// X2 mode selected
            X2 = 0x0,
            /// X4 mode selected
            X4 = 0x1,
        } = .X2,
        /// Debug Mode Run Enable
        DEBUGRUN: enum(u1) {
            /// Timer is halted in debug mode
            HALT = 0x0,
            /// Timer is running in debug mode
            RUN = 0x1,
        } = .HALT,
        /// DMA Request Clear on Active
        DMACLRACT: u1 = 0x0,
        /// Clock Source Select
        CLKSEL: enum(u2) {
            /// Prescaled EM01GRPACLK
            PRESCEM01GRPACLK = 0x0,
            /// Compare/Capture Channel 1 Input
            CC1 = 0x1,
            /// Timer is clocked by underflow(down-count) or overflow(up-count) in the lower numbered neighbor Timer
            TIMEROUF = 0x2,
            _,
        } = .PRESCEM01GRPACLK,
        /// PWM output retimed enable
        RETIMEEN: enum(u1) {
            /// PWM outputs are not re-timed.
            DISABLE = 0x0,
            /// PWM outputs are re-timed.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Disable Timer Start/Stop/Reload output
        DISSYNCOUT: enum(u1) {
            /// Timer can start/stop/reload other timers with SYNC bit set
            EN = 0x0,
            /// Timer cannot start/stop/reload other timers with SYNC bit set
            DIS = 0x1,
        } = .EN,
        /// PWM output retime select
        RETIMESEL: u1 = 0x0,
        reserved16: u3 = 0,
        /// Always Track Inputs
        ATI: u1 = 0x0,
        /// Reload-Start Sets COIST
        RSSCOIST: u1 = 0x0,
        /// Prescaler Setting
        PRESC: enum(u10) {
            /// No prescaling
            DIV1 = 0x0,
            /// Prescale by 2
            DIV2 = 0x1,
            /// Prescale by 4
            DIV4 = 0x3,
            /// Prescale by 8
            DIV8 = 0x7,
            /// Prescale by 16
            DIV16 = 0xf,
            /// Prescale by 32
            DIV32 = 0x1f,
            /// Prescale by 64
            DIV64 = 0x3f,
            /// Prescale by 128
            DIV128 = 0x7f,
            /// Prescale by 256
            DIV256 = 0xff,
            /// Prescale by 512
            DIV512 = 0x1ff,
            /// Prescale by 1024
            DIV1024 = 0x3ff,
            _,
        } = .DIV1,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Timer Rising Input Edge Action
        RISEA: enum(u2) {
            /// No action
            NONE = 0x0,
            /// Start counter without reload
            START = 0x1,
            /// Stop counter without reload
            STOP = 0x2,
            /// Reload and start counter
            RELOADSTART = 0x3,
        } = .NONE,
        /// Timer Falling Input Edge Action
        FALLA: enum(u2) {
            /// No action
            NONE = 0x0,
            /// Start counter without reload
            START = 0x1,
            /// Stop counter without reload
            STOP = 0x2,
            /// Reload and start counter
            RELOADSTART = 0x3,
        } = .NONE,
        /// 2x Count Mode
        X2CNT: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    CMD: mmio.Mmio(packed struct(u32) {
        /// Start Timer
        START: u1 = 0x0,
        /// Stop Timer
        STOP: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x10
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Running
        RUNNING: u1 = 0x0,
        /// Direction
        DIR: enum(u1) {
            /// Counting up
            UP = 0x0,
            /// Counting down
            DOWN = 0x1,
        } = .UP,
        /// TOP Buffer Valid
        TOPBV: u1 = 0x0,
        reserved4: u1 = 0,
        /// Timer lock status
        TIMERLOCKSTATUS: enum(u1) {
            /// TIMER registers are unlocked
            UNLOCKED = 0x0,
            /// TIMER registers are locked
            LOCKED = 0x1,
        } = .UNLOCKED,
        /// DTI lock status
        DTILOCKSTATUS: enum(u1) {
            /// DTI registers are unlocked
            UNLOCKED = 0x0,
            /// DTI registers are locked
            LOCKED = 0x1,
        } = .UNLOCKED,
        /// Sync Busy
        SYNCBUSY: u1 = 0x0,
        reserved8: u1 = 0,
        /// Output Compare Buffer Valid
        OCBV0: u1 = 0x0,
        /// Output Compare Buffer Valid
        OCBV1: u1 = 0x0,
        /// Output Compare Buffer Valid
        OCBV2: u1 = 0x0,
        reserved16: u5 = 0,
        /// Input capture fifo empty
        ICFEMPTY0: u1 = 0x0,
        /// Input capture fifo empty
        ICFEMPTY1: u1 = 0x0,
        /// Input capture fifo empty
        ICFEMPTY2: u1 = 0x0,
        reserved24: u5 = 0,
        /// Compare/Capture Polarity
        CCPOL0: enum(u1) {
            /// CCx polarity low level/rising edge
            LOWRISE = 0x0,
            /// CCx polarity high level/falling edge
            HIGHFALL = 0x1,
        } = .LOWRISE,
        /// Compare/Capture Polarity
        CCPOL1: enum(u1) {
            /// CCx polarity low level/rising edge
            LOWRISE = 0x0,
            /// CCx polarity high level/falling edge
            HIGHFALL = 0x1,
        } = .LOWRISE,
        /// Compare/Capture Polarity
        CCPOL2: enum(u1) {
            /// CCx polarity low level/rising edge
            LOWRISE = 0x0,
            /// CCx polarity high level/falling edge
            HIGHFALL = 0x1,
        } = .LOWRISE,
        padding: u5 = 0,
    }),
    /// No Description
    /// offset: 0x14
    IF: mmio.Mmio(packed struct(u32) {
        /// Overflow Interrupt Flag
        OF: u1 = 0x0,
        /// Underflow Interrupt Flag
        UF: u1 = 0x0,
        /// Direction Change Detect Interrupt Flag
        DIRCHG: u1 = 0x0,
        reserved4: u1 = 0,
        /// Capture Compare Channel 0 Interrupt Flag
        CC0: u1 = 0x0,
        /// Capture Compare Channel 1 Interrupt Flag
        CC1: u1 = 0x0,
        /// Capture Compare Channel 2 Interrupt Flag
        CC2: u1 = 0x0,
        reserved16: u9 = 0,
        /// Input Capture Watermark Level Full
        ICFWLFULL0: u1 = 0x0,
        /// Input Capture Watermark Level Full
        ICFWLFULL1: u1 = 0x0,
        /// Input Capture Watermark Level Full
        ICFWLFULL2: u1 = 0x0,
        reserved20: u1 = 0,
        /// Input Capture FIFO overflow
        ICFOF0: u1 = 0x0,
        /// Input Capture FIFO overflow
        ICFOF1: u1 = 0x0,
        /// Input Capture FIFO overflow
        ICFOF2: u1 = 0x0,
        reserved24: u1 = 0,
        /// Input capture FIFO underflow
        ICFUF0: u1 = 0x0,
        /// Input capture FIFO underflow
        ICFUF1: u1 = 0x0,
        /// Input capture FIFO underflow
        ICFUF2: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// No Description
    /// offset: 0x18
    IEN: mmio.Mmio(packed struct(u32) {
        /// Overflow Interrupt Enable
        OF: u1 = 0x0,
        /// Underflow Interrupt Enable
        UF: u1 = 0x0,
        /// Direction Change Detect Interrupt Enable
        DIRCHG: u1 = 0x0,
        reserved4: u1 = 0,
        /// CC0 Interrupt Enable
        CC0: u1 = 0x0,
        /// CC1 Interrupt Enable
        CC1: u1 = 0x0,
        /// CC2 Interrupt Enable
        CC2: u1 = 0x0,
        reserved16: u9 = 0,
        /// ICFWLFULL0 Interrupt Enable
        ICFWLFULL0: u1 = 0x0,
        /// ICFWLFULL1 Interrupt Enable
        ICFWLFULL1: u1 = 0x0,
        /// ICFWLFULL2 Interrupt Enable
        ICFWLFULL2: u1 = 0x0,
        reserved20: u1 = 0,
        /// ICFOF0 Interrupt Enable
        ICFOF0: u1 = 0x0,
        /// ICFOF1 Interrupt Enable
        ICFOF1: u1 = 0x0,
        /// ICFOF2 Interrupt Enable
        ICFOF2: u1 = 0x0,
        reserved24: u1 = 0,
        /// ICFUF0 Interrupt Enable
        ICFUF0: u1 = 0x0,
        /// ICFUF1 Interrupt Enable
        ICFUF1: u1 = 0x0,
        /// ICFUF2 Interrupt Enable
        ICFUF2: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    TOP: mmio.Mmio(packed struct(u32) {
        /// Counter Top Value
        TOP: u32 = 0xFFFF,
    }),
    /// No Description
    /// offset: 0x20
    TOPB: mmio.Mmio(packed struct(u32) {
        /// Counter Top Buffer Register
        TOPB: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x24
    CNT: mmio.Mmio(packed struct(u32) {
        /// Counter Value
        CNT: u32 = 0x0,
    }),
    /// offset: 0x28
    reserved40: [4]u8,
    /// No Description
    /// offset: 0x2c
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Timer Lock Key
        LOCKKEY: enum(u16) {
            /// Write to unlock TIMER registers
            UNLOCK = 0xce80,
            _,
        } = @enumFromInt(0x0),
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x30
    EN: mmio.Mmio(packed struct(u32) {
        /// Timer Module Enable
        EN: u1 = 0x0,
        /// Disablement busy status
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// offset: 0x34
    reserved52: [44]u8,
    /// No Description
    /// offset: 0x60
    CC0_CFG: mmio.Mmio(packed struct(u32) {
        /// CC Channel Mode
        MODE: enum(u2) {
            /// Compare/Capture channel turned off
            OFF = 0x0,
            /// Input Capture
            INPUTCAPTURE = 0x1,
            /// Output Compare
            OUTPUTCOMPARE = 0x2,
            /// Pulse-Width Modulation
            PWM = 0x3,
        } = .OFF,
        reserved4: u2 = 0,
        /// Compare Output Initial State
        COIST: u1 = 0x0,
        reserved17: u12 = 0,
        /// Input Selection
        INSEL: enum(u2) {
            /// TIMERnCCx pin is selected
            PIN = 0x0,
            /// Synchornous PRS selected
            PRSSYNC = 0x1,
            /// Asynchronous Level PRS selected
            PRSASYNCLEVEL = 0x2,
            /// Asynchronous Pulse PRS selected
            PRSASYNCPULSE = 0x3,
        } = .PIN,
        /// PRS Configuration
        PRSCONF: enum(u1) {
            /// Each CC event will generate a one EM01GRPACLK cycle high pulse
            PULSE = 0x0,
            /// The PRS channel will follow CC out
            LEVEL = 0x1,
        } = .PULSE,
        /// Digital Filter
        FILT: enum(u1) {
            /// Digital Filter Disabled
            DISABLE = 0x0,
            /// Digital Filter Enabled
            ENABLE = 0x1,
        } = .DISABLE,
        /// Input Capture FIFO watermark level
        ICFWL: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x64
    CC0_CTRL: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Output Invert
        OUTINV: u1 = 0x0,
        reserved8: u5 = 0,
        /// Compare Match Output Action
        CMOA: enum(u2) {
            /// No action on compare match
            NONE = 0x0,
            /// Toggle output on compare match
            TOGGLE = 0x1,
            /// Clear output on compare match
            CLEAR = 0x2,
            /// Set output on compare match
            SET = 0x3,
        } = .NONE,
        /// Counter Overflow Output Action
        COFOA: enum(u2) {
            /// No action on counter overflow
            NONE = 0x0,
            /// Toggle output on counter overflow
            TOGGLE = 0x1,
            /// Clear output on counter overflow
            CLEAR = 0x2,
            /// Set output on counter overflow
            SET = 0x3,
        } = .NONE,
        /// Counter Underflow Output Action
        CUFOA: enum(u2) {
            /// No action on counter underflow
            NONE = 0x0,
            /// Toggle output on counter underflow
            TOGGLE = 0x1,
            /// Clear output on counter underflow
            CLEAR = 0x2,
            /// Set output on counter underflow
            SET = 0x3,
        } = .NONE,
        reserved24: u10 = 0,
        /// Input Capture Edge Select
        ICEDGE: enum(u2) {
            /// Rising edges detected
            RISING = 0x0,
            /// Falling edges detected
            FALLING = 0x1,
            /// Both edges detected
            BOTH = 0x2,
            /// No edge detection, signal is left as it is
            NONE = 0x3,
        } = .RISING,
        /// Input Capture Event Control
        ICEVCTRL: enum(u2) {
            /// PRS output pulse and interrupt flag set on every capture
            EVERYEDGE = 0x0,
            /// PRS output pulse and interrupt flag set on every second capture
            EVERYSECONDEDGE = 0x1,
            /// PRS output pulse and interrupt flag set on rising edge only (if ICEDGE = BOTH)
            RISING = 0x2,
            /// PRS output pulse and interrupt flag set on falling edge only (if ICEDGE = BOTH)
            FALLING = 0x3,
        } = .EVERYEDGE,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x68
    CC0_OC: mmio.Mmio(packed struct(u32) {
        /// Output Compare Value
        OC: u32 = 0x0,
    }),
    /// offset: 0x6c
    reserved108: [4]u8,
    /// No Description
    /// offset: 0x70
    CC0_OCB: mmio.Mmio(packed struct(u32) {
        /// Output Compare Value Buffer
        OCB: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x74
    CC0_ICF: mmio.Mmio(packed struct(u32) {
        /// Input Capture FIFO
        ICF: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x78
    CC0_ICOF: mmio.Mmio(packed struct(u32) {
        /// Input Capture FIFO Overflow
        ICOF: u32 = 0x0,
    }),
    /// offset: 0x7c
    reserved124: [4]u8,
    /// No Description
    /// offset: 0x80
    CC1_CFG: mmio.Mmio(packed struct(u32) {
        /// CC Channel Mode
        MODE: enum(u2) {
            /// Compare/Capture channel turned off
            OFF = 0x0,
            /// Input Capture
            INPUTCAPTURE = 0x1,
            /// Output Compare
            OUTPUTCOMPARE = 0x2,
            /// Pulse-Width Modulation
            PWM = 0x3,
        } = .OFF,
        reserved4: u2 = 0,
        /// Compare Output Initial State
        COIST: u1 = 0x0,
        reserved17: u12 = 0,
        /// Input Selection
        INSEL: enum(u2) {
            /// TIMERnCCx pin is selected
            PIN = 0x0,
            /// Synchornous PRS selected
            PRSSYNC = 0x1,
            /// Asynchronous Level PRS selected
            PRSASYNCLEVEL = 0x2,
            /// Asynchronous Pulse PRS selected
            PRSASYNCPULSE = 0x3,
        } = .PIN,
        /// PRS Configuration
        PRSCONF: enum(u1) {
            /// Each CC event will generate a one EM01GRPACLK cycle high pulse
            PULSE = 0x0,
            /// The PRS channel will follow CC out
            LEVEL = 0x1,
        } = .PULSE,
        /// Digital Filter
        FILT: enum(u1) {
            /// Digital Filter Disabled
            DISABLE = 0x0,
            /// Digital Filter Enabled
            ENABLE = 0x1,
        } = .DISABLE,
        /// Input Capture FIFO watermark level
        ICFWL: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x84
    CC1_CTRL: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Output Invert
        OUTINV: u1 = 0x0,
        reserved8: u5 = 0,
        /// Compare Match Output Action
        CMOA: enum(u2) {
            /// No action on compare match
            NONE = 0x0,
            /// Toggle output on compare match
            TOGGLE = 0x1,
            /// Clear output on compare match
            CLEAR = 0x2,
            /// Set output on compare match
            SET = 0x3,
        } = .NONE,
        /// Counter Overflow Output Action
        COFOA: enum(u2) {
            /// No action on counter overflow
            NONE = 0x0,
            /// Toggle output on counter overflow
            TOGGLE = 0x1,
            /// Clear output on counter overflow
            CLEAR = 0x2,
            /// Set output on counter overflow
            SET = 0x3,
        } = .NONE,
        /// Counter Underflow Output Action
        CUFOA: enum(u2) {
            /// No action on counter underflow
            NONE = 0x0,
            /// Toggle output on counter underflow
            TOGGLE = 0x1,
            /// Clear output on counter underflow
            CLEAR = 0x2,
            /// Set output on counter underflow
            SET = 0x3,
        } = .NONE,
        reserved24: u10 = 0,
        /// Input Capture Edge Select
        ICEDGE: enum(u2) {
            /// Rising edges detected
            RISING = 0x0,
            /// Falling edges detected
            FALLING = 0x1,
            /// Both edges detected
            BOTH = 0x2,
            /// No edge detection, signal is left as it is
            NONE = 0x3,
        } = .RISING,
        /// Input Capture Event Control
        ICEVCTRL: enum(u2) {
            /// PRS output pulse and interrupt flag set on every capture
            EVERYEDGE = 0x0,
            /// PRS output pulse and interrupt flag set on every second capture
            EVERYSECONDEDGE = 0x1,
            /// PRS output pulse and interrupt flag set on rising edge only (if ICEDGE = BOTH)
            RISING = 0x2,
            /// PRS output pulse and interrupt flag set on falling edge only (if ICEDGE = BOTH)
            FALLING = 0x3,
        } = .EVERYEDGE,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x88
    CC1_OC: mmio.Mmio(packed struct(u32) {
        /// Output Compare Value
        OC: u32 = 0x0,
    }),
    /// offset: 0x8c
    reserved140: [4]u8,
    /// No Description
    /// offset: 0x90
    CC1_OCB: mmio.Mmio(packed struct(u32) {
        /// Output Compare Value Buffer
        OCB: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x94
    CC1_ICF: mmio.Mmio(packed struct(u32) {
        /// Input Capture FIFO
        ICF: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x98
    CC1_ICOF: mmio.Mmio(packed struct(u32) {
        /// Input Capture FIFO Overflow
        ICOF: u32 = 0x0,
    }),
    /// offset: 0x9c
    reserved156: [4]u8,
    /// No Description
    /// offset: 0xa0
    CC2_CFG: mmio.Mmio(packed struct(u32) {
        /// CC Channel Mode
        MODE: enum(u2) {
            /// Compare/Capture channel turned off
            OFF = 0x0,
            /// Input Capture
            INPUTCAPTURE = 0x1,
            /// Output Compare
            OUTPUTCOMPARE = 0x2,
            /// Pulse-Width Modulation
            PWM = 0x3,
        } = .OFF,
        reserved4: u2 = 0,
        /// Compare Output Initial State
        COIST: u1 = 0x0,
        reserved17: u12 = 0,
        /// Input Selection
        INSEL: enum(u2) {
            /// TIMERnCCx pin is selected
            PIN = 0x0,
            /// Synchornous PRS selected
            PRSSYNC = 0x1,
            /// Asynchronous Level PRS selected
            PRSASYNCLEVEL = 0x2,
            /// Asynchronous Pulse PRS selected
            PRSASYNCPULSE = 0x3,
        } = .PIN,
        /// PRS Configuration
        PRSCONF: enum(u1) {
            /// Each CC event will generate a one EM01GRPACLK cycle high pulse
            PULSE = 0x0,
            /// The PRS channel will follow CC out
            LEVEL = 0x1,
        } = .PULSE,
        /// Digital Filter
        FILT: enum(u1) {
            /// Digital Filter Disabled
            DISABLE = 0x0,
            /// Digital Filter Enabled
            ENABLE = 0x1,
        } = .DISABLE,
        /// Input Capture FIFO watermark level
        ICFWL: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0xa4
    CC2_CTRL: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Output Invert
        OUTINV: u1 = 0x0,
        reserved8: u5 = 0,
        /// Compare Match Output Action
        CMOA: enum(u2) {
            /// No action on compare match
            NONE = 0x0,
            /// Toggle output on compare match
            TOGGLE = 0x1,
            /// Clear output on compare match
            CLEAR = 0x2,
            /// Set output on compare match
            SET = 0x3,
        } = .NONE,
        /// Counter Overflow Output Action
        COFOA: enum(u2) {
            /// No action on counter overflow
            NONE = 0x0,
            /// Toggle output on counter overflow
            TOGGLE = 0x1,
            /// Clear output on counter overflow
            CLEAR = 0x2,
            /// Set output on counter overflow
            SET = 0x3,
        } = .NONE,
        /// Counter Underflow Output Action
        CUFOA: enum(u2) {
            /// No action on counter underflow
            NONE = 0x0,
            /// Toggle output on counter underflow
            TOGGLE = 0x1,
            /// Clear output on counter underflow
            CLEAR = 0x2,
            /// Set output on counter underflow
            SET = 0x3,
        } = .NONE,
        reserved24: u10 = 0,
        /// Input Capture Edge Select
        ICEDGE: enum(u2) {
            /// Rising edges detected
            RISING = 0x0,
            /// Falling edges detected
            FALLING = 0x1,
            /// Both edges detected
            BOTH = 0x2,
            /// No edge detection, signal is left as it is
            NONE = 0x3,
        } = .RISING,
        /// Input Capture Event Control
        ICEVCTRL: enum(u2) {
            /// PRS output pulse and interrupt flag set on every capture
            EVERYEDGE = 0x0,
            /// PRS output pulse and interrupt flag set on every second capture
            EVERYSECONDEDGE = 0x1,
            /// PRS output pulse and interrupt flag set on rising edge only (if ICEDGE = BOTH)
            RISING = 0x2,
            /// PRS output pulse and interrupt flag set on falling edge only (if ICEDGE = BOTH)
            FALLING = 0x3,
        } = .EVERYEDGE,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0xa8
    CC2_OC: mmio.Mmio(packed struct(u32) {
        /// Output Compare Value
        OC: u32 = 0x0,
    }),
    /// offset: 0xac
    reserved172: [4]u8,
    /// No Description
    /// offset: 0xb0
    CC2_OCB: mmio.Mmio(packed struct(u32) {
        /// Output Compare Value Buffer
        OCB: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0xb4
    CC2_ICF: mmio.Mmio(packed struct(u32) {
        /// Input Capture FIFO
        ICF: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0xb8
    CC2_ICOF: mmio.Mmio(packed struct(u32) {
        /// Input Capture FIFO Overflow
        ICOF: u32 = 0x0,
    }),
    /// offset: 0xbc
    reserved188: [36]u8,
    /// No Description
    /// offset: 0xe0
    DTCFG: mmio.Mmio(packed struct(u32) {
        /// DTI Enable
        DTEN: u1 = 0x0,
        /// DTI Automatic Start-up Functionality
        DTDAS: enum(u1) {
            /// No DTI restart on debugger exit
            NORESTART = 0x0,
            /// DTI restart on debugger exit
            RESTART = 0x1,
        } = .NORESTART,
        reserved9: u7 = 0,
        /// DTI Always Run
        DTAR: u1 = 0x0,
        /// DTI Fault Action on Timer Stop
        DTFATS: u1 = 0x0,
        /// DTI PRS Source Enable
        DTPRSEN: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0xe4
    DTTIMECFG: mmio.Mmio(packed struct(u32) {
        /// DTI Prescaler Setting
        DTPRESC: u10 = 0x0,
        /// DTI Rise-time
        DTRISET: u6 = 0x0,
        /// DTI Fall-time
        DTFALLT: u6 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0xe8
    DTFCFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// DTI Fault Action
        DTFA: enum(u2) {
            /// No action on fault
            NONE = 0x0,
            /// Set outputs inactive
            INACTIVE = 0x1,
            /// Clear outputs
            CLEAR = 0x2,
            /// Tristate outputs
            TRISTATE = 0x3,
        } = .NONE,
        reserved24: u6 = 0,
        /// DTI PRS 0 Fault Enable
        DTPRS0FEN: u1 = 0x0,
        /// DTI PRS 1 Fault Enable
        DTPRS1FEN: u1 = 0x0,
        /// DTI Debugger Fault Enable
        DTDBGFEN: u1 = 0x0,
        /// DTI Lockup Fault Enable
        DTLOCKUPFEN: u1 = 0x0,
        /// DTI EM23 Fault Enable
        DTEM23FEN: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// No Description
    /// offset: 0xec
    DTCTRL: mmio.Mmio(packed struct(u32) {
        /// DTI Complementary Output Invert.
        DTCINV: u1 = 0x0,
        /// DTI Inactive Polarity
        DTIPOL: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0xf0
    DTOGEN: mmio.Mmio(packed struct(u32) {
        /// DTI CCn Output Generation Enable
        DTOGCC0EN: u1 = 0x0,
        /// DTI CCn Output Generation Enable
        DTOGCC1EN: u1 = 0x0,
        /// DTI CCn Output Generation Enable
        DTOGCC2EN: u1 = 0x0,
        /// DTI CDTIn Output Generation Enable
        DTOGCDTI0EN: u1 = 0x0,
        /// DTI CDTIn Output Generation Enable
        DTOGCDTI1EN: u1 = 0x0,
        /// DTI CDTIn Output Generation Enable
        DTOGCDTI2EN: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// No Description
    /// offset: 0xf4
    DTFAULT: mmio.Mmio(packed struct(u32) {
        /// DTI PRS 0 Fault
        DTPRS0F: u1 = 0x0,
        /// DTI PRS 1 Fault
        DTPRS1F: u1 = 0x0,
        /// DTI Debugger Fault
        DTDBGF: u1 = 0x0,
        /// DTI Lockup Fault
        DTLOCKUPF: u1 = 0x0,
        /// DTI EM23 Entry Fault
        DTEM23F: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0xf8
    DTFAULTC: mmio.Mmio(packed struct(u32) {
        /// DTI PRS0 Fault Clear
        DTPRS0FC: u1 = 0x0,
        /// DTI PRS1 Fault Clear
        DTPRS1FC: u1 = 0x0,
        /// DTI Debugger Fault Clear
        DTDBGFC: u1 = 0x0,
        /// DTI Lockup Fault Clear
        DTLOCKUPFC: u1 = 0x0,
        /// DTI EM23 Fault Clear
        DTEM23FC: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0xfc
    DTLOCK: mmio.Mmio(packed struct(u32) {
        /// DTI Lock Key
        DTILOCKKEY: enum(u16) {
            /// Write to unlock TIMER DTI registers
            UNLOCK = 0xce80,
            _,
        } = @enumFromInt(0x0),
        padding: u16 = 0,
    }),
};
