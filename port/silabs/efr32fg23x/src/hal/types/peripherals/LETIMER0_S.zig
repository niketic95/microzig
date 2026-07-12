const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// LETIMER0_S Registers
pub const LETIMER0_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// module en
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
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Repeat Mode
        REPMODE: enum(u2) {
            /// When started, the LETIMER counts down until it is stopped by software
            FREE = 0x0,
            /// The counter counts REP0 times. When REP0 reaches zero, the counter stops
            ONESHOT = 0x1,
            /// The counter counts REP0 times. If REP1 has been written, it is loaded into REP0 when REP0 reaches zero, otherwise the counter stops
            BUFFERED = 0x2,
            /// Both REP0 and REP1 are decremented when the LETIMER wraps around. The LETIMER counts until both REP0 and REP1 are zero
            DOUBLE = 0x3,
        } = .FREE,
        /// Underflow Output Action 0
        UFOA0: enum(u2) {
            /// LETIMERn_OUT0 is held at its idle value as defined by OPOL0
            NONE = 0x0,
            /// LETIMERn_OUT0 is toggled on CNT underflow
            TOGGLE = 0x1,
            /// LETIMERn_OUT0 is held active for one LETIMER0 clock cycle on CNT underflow. The output then returns to its idle value as defined by OPOL0
            PULSE = 0x2,
            /// LETIMERn_OUT0 is set idle on CNT underflow, and active on compare match with COMP0
            PWM = 0x3,
        } = .NONE,
        /// Underflow Output Action 1
        UFOA1: enum(u2) {
            /// LETIMERn_OUT1 is held at its idle value as defined by OPOL1
            NONE = 0x0,
            /// LETIMERn_OUT1 is toggled on CNT underflow
            TOGGLE = 0x1,
            /// LETIMERn_OUT1 is held active for one LETIMER0 clock cycle on CNT underflow. The output then returns to its idle value as defined by OPOL1
            PULSE = 0x2,
            /// LETIMERn_OUT1 is set idle on CNT underflow, and active on compare match with COMP1
            PWM = 0x3,
        } = .NONE,
        /// Output 0 Polarity
        OPOL0: u1 = 0x0,
        /// Output 1 Polarity
        OPOL1: u1 = 0x0,
        /// Buffered Top
        BUFTOP: enum(u1) {
            /// TOP is only written by software
            DISABLE = 0x0,
            /// TOP is set to TOPBUFF value when REP0 reaches 0
            ENABLE = 0x1,
        } = .DISABLE,
        /// Compare Value 0 Is Top Value
        CNTTOPEN: enum(u1) {
            /// The top value of the LETIMER is 65535 (0xFFFF)
            DISABLE = 0x0,
            /// The top value of the LETIMER is given by TOP
            ENABLE = 0x1,
        } = .DISABLE,
        reserved12: u2 = 0,
        /// Debug Mode Run Enable
        DEBUGRUN: enum(u1) {
            /// LETIMER is frozen in debug mode
            DISABLE = 0x0,
            /// LETIMER is running in debug mode
            ENABLE = 0x1,
        } = .DISABLE,
        reserved16: u3 = 0,
        /// Counter prescaler value
        CNTPRESC: enum(u4) {
            /// CLK_CNT = (LETIMER LF CLK)/1
            DIV1 = 0x0,
            /// CLK_CNT = (LETIMER LF CLK)/2
            DIV2 = 0x1,
            /// CLK_CNT = (LETIMER LF CLK)/4
            DIV4 = 0x2,
            /// CLK_CNT = (LETIMER LF CLK)/8
            DIV8 = 0x3,
            /// CLK_CNT = (LETIMER LF CLK)/16
            DIV16 = 0x4,
            /// CLK_CNT = (LETIMER LF CLK)/32
            DIV32 = 0x5,
            /// CLK_CNT = (LETIMER LF CLK)/64
            DIV64 = 0x6,
            /// CLK_CNT = (LETIMER LF CLK)/128
            DIV128 = 0x7,
            /// CLK_CNT = (LETIMER LF CLK)/256
            DIV256 = 0x8,
            _,
        } = .DIV1,
        padding: u12 = 0,
    }),
    /// No Description
    /// offset: 0x10
    CMD: mmio.Mmio(packed struct(u32) {
        /// Start LETIMER
        START: u1 = 0x0,
        /// Stop LETIMER
        STOP: u1 = 0x0,
        /// Clear LETIMER
        CLEAR: u1 = 0x0,
        /// Clear Toggle Output 0
        CTO0: u1 = 0x0,
        /// Clear Toggle Output 1
        CTO1: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x14
    STATUS: mmio.Mmio(packed struct(u32) {
        /// LETIMER Running
        RUNNING: u1 = 0x0,
        /// LETIMER Lock Status
        LETIMERLOCKSTATUS: enum(u1) {
            /// LETIMER registers are unlocked
            UNLOCKED = 0x0,
            /// LETIMER registers are locked
            LOCKED = 0x1,
        } = .UNLOCKED,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x18
    CNT: mmio.Mmio(packed struct(u32) {
        /// Counter Value
        CNT: u24 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    COMP0: mmio.Mmio(packed struct(u32) {
        /// Compare Value 0
        COMP0: u24 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x20
    COMP1: mmio.Mmio(packed struct(u32) {
        /// Compare Value 1
        COMP1: u24 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x24
    TOP: mmio.Mmio(packed struct(u32) {
        /// Counter TOP Value
        TOP: u24 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x28
    TOPBUFF: mmio.Mmio(packed struct(u32) {
        /// Buffered Counter TOP Value
        TOPBUFF: u24 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x2c
    REP0: mmio.Mmio(packed struct(u32) {
        /// Repeat Counter 0
        REP0: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x30
    REP1: mmio.Mmio(packed struct(u32) {
        /// Repeat Counter 1
        REP1: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x34
    IF: mmio.Mmio(packed struct(u32) {
        /// Compare Match 0 Interrupt Flag
        COMP0: u1 = 0x0,
        /// Compare Match 1 Interrupt Flag
        COMP1: u1 = 0x0,
        /// Underflow Interrupt Flag
        UF: u1 = 0x0,
        /// Repeat Counter 0 Interrupt Flag
        REP0: u1 = 0x0,
        /// Repeat Counter 1 Interrupt Flag
        REP1: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x38
    IEN: mmio.Mmio(packed struct(u32) {
        /// Compare Match 0 Interrupt Enable
        COMP0: u1 = 0x0,
        /// Compare Match 1 Interrupt Enable
        COMP1: u1 = 0x0,
        /// Underflow Interrupt Enable
        UF: u1 = 0x0,
        /// Repeat Counter 0 Interrupt Enable
        REP0: u1 = 0x0,
        /// Repeat Counter 1 Interrupt Enable
        REP1: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x3c
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock Key
        LETIMERLOCKKEY: enum(u16) {
            /// Write to unock LETIMER lockable registers
            UNLOCK = 0xccfc,
            _,
        } = @enumFromInt(0x0),
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x40
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Sync busy for CNT
        CNT: u1 = 0x0,
        reserved2: u1 = 0,
        /// Sync busy for TOP
        TOP: u1 = 0x0,
        /// Sync busy for REP0
        REP0: u1 = 0x0,
        /// Sync busy for REP1
        REP1: u1 = 0x0,
        /// Sync busy for START
        START: u1 = 0x0,
        /// Sync busy for STOP
        STOP: u1 = 0x0,
        /// Sync busy for CLEAR
        CLEAR: u1 = 0x0,
        /// Sync busy for CTO0
        CTO0: u1 = 0x0,
        /// Sync busy for CTO1
        CTO1: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// offset: 0x44
    reserved68: [12]u8,
    /// No Description
    /// offset: 0x50
    PRSMODE: mmio.Mmio(packed struct(u32) {
        reserved18: u18 = 0,
        /// PRS Start Mode
        PRSSTARTMODE: enum(u2) {
            /// PRS cannot start the LETIMER
            NONE = 0x0,
            /// Rising edge of selected PRS input can start the LETIMER
            RISING = 0x1,
            /// Falling edge of selected PRS input can start the LETIMER
            FALLING = 0x2,
            /// Both the rising or falling edge of the selected PRS input can start the LETIMER
            BOTH = 0x3,
        } = .NONE,
        reserved22: u2 = 0,
        /// PRS Stop Mode
        PRSSTOPMODE: enum(u2) {
            /// PRS cannot stop the LETIMER
            NONE = 0x0,
            /// Rising edge of selected PRS input can stop the LETIMER
            RISING = 0x1,
            /// Falling edge of selected PRS input can stop the LETIMER
            FALLING = 0x2,
            /// Both the rising or falling edge of the selected PRS input can stop the LETIMER
            BOTH = 0x3,
        } = .NONE,
        reserved26: u2 = 0,
        /// PRS Clear Mode
        PRSCLEARMODE: enum(u2) {
            /// PRS cannot clear the LETIMER
            NONE = 0x0,
            /// Rising edge of selected PRS input can clear the LETIMER
            RISING = 0x1,
            /// Falling edge of selected PRS input can clear the LETIMER
            FALLING = 0x2,
            /// Both the rising or falling edge of the selected PRS input can clear the LETIMER
            BOTH = 0x3,
        } = .NONE,
        padding: u4 = 0,
    }),
};
