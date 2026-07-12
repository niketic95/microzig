const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// CMU_NS Registers
pub const CMU_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version ID
        IPVERSION: u32 = 0x2,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// No Description
    /// offset: 0x08
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Calibration Ready
        CALRDY: u1 = 0x0,
        reserved30: u29 = 0,
        /// Configuration Lock Status for WDOG
        WDOGLOCK: enum(u1) {
            /// WDOG configuration lock is unlocked
            UNLOCKED = 0x0,
            /// WDOG configuration lock is locked
            LOCKED = 0x1,
        } = .UNLOCKED,
        /// Configuration Lock Status
        LOCK: enum(u1) {
            /// Configuration lock is unlocked
            UNLOCKED = 0x0,
            /// Configuration lock is locked
            LOCKED = 0x1,
        } = .UNLOCKED,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// No Description
    /// offset: 0x10
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock Key
        LOCKKEY: enum(u16) {
            /// Write this value to unlock
            UNLOCK = 0x93f7,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x14
    WDOGLOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock Key
        LOCKKEY: enum(u16) {
            /// Write this value to unlock
            UNLOCK = 0x93f7,
            _,
        } = @enumFromInt(0x5257),
        padding: u16 = 0,
    }),
    /// offset: 0x18
    reserved24: [8]u8,
    /// No Description
    /// offset: 0x20
    IF: mmio.Mmio(packed struct(u32) {
        /// Calibration Ready Interrupt Flag
        CALRDY: u1 = 0x0,
        /// Calibration Overflow Interrupt Flag
        CALOF: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x24
    IEN: mmio.Mmio(packed struct(u32) {
        /// Calibration Ready Interrupt Enable
        CALRDY: u1 = 0x0,
        /// Calibration Overflow Interrupt Enable
        CALOF: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// offset: 0x28
    reserved40: [40]u8,
    /// No Description
    /// offset: 0x50
    CALCMD: mmio.Mmio(packed struct(u32) {
        /// Calibration Start
        CALSTART: u1 = 0x0,
        /// Calibration Stop
        CALSTOP: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x54
    CALCTRL: mmio.Mmio(packed struct(u32) {
        /// Calibration Counter Top Value
        CALTOP: u20 = 0x0,
        reserved23: u3 = 0,
        /// Continuous Calibration
        CONT: u1 = 0x0,
        /// Calibration Up-counter Select
        UPSEL: enum(u4) {
            /// Up-counter is not clocked
            DISABLED = 0x0,
            /// PRS CMU_CALUP consumer is clocking up-counter
            PRS = 0x1,
            /// HFXO is clocking up-counter
            HFXO = 0x2,
            /// LFXO is clocking up-counter
            LFXO = 0x3,
            /// HFRCODPLL is clocking up-counter
            HFRCODPLL = 0x4,
            /// HFRCOEM23 is clocking up-counter
            HFRCOEM23 = 0x5,
            /// FSRCO is clocking up-counter
            FSRCO = 0x8,
            /// LFRCO is clocking up-counter
            LFRCO = 0x9,
            /// ULFRCO is clocking up-counter
            ULFRCO = 0xa,
            _,
        } = .DISABLED,
        /// Calibration Down-counter Select
        DOWNSEL: enum(u4) {
            /// Down-counter is not clocked
            DISABLED = 0x0,
            /// HCLK is clocking down-counter
            HCLK = 0x1,
            /// PRS CMU_CALDN consumer is clocking down-counter
            PRS = 0x2,
            /// HFXO is clocking down-counter
            HFXO = 0x3,
            /// LFXO is clocking down-counter
            LFXO = 0x4,
            /// HFRCODPLL is clocking down-counter
            HFRCODPLL = 0x5,
            /// HFRCOEM23 is clocking down-counter
            HFRCOEM23 = 0x6,
            /// FSRCO is clocking down-counter
            FSRCO = 0x9,
            /// LFRCO is clocking down-counter
            LFRCO = 0xa,
            /// ULFRCO is clocking down-counter
            ULFRCO = 0xb,
            _,
        } = .DISABLED,
    }),
    /// No Description
    /// offset: 0x58
    CALCNT: mmio.Mmio(packed struct(u32) {
        /// Calibration Result Counter Value
        CALCNT: u20 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x5c
    reserved92: [8]u8,
    /// No Description
    /// offset: 0x64
    CLKEN0: mmio.Mmio(packed struct(u32) {
        /// Enable Bus Clock
        LDMA: u1 = 0x0,
        /// Enable Bus Clock
        LDMAXBAR: u1 = 0x0,
        /// Enable Bus Clock
        RADIOAES: u1 = 0x0,
        /// Enable Bus Clock
        GPCRC: u1 = 0x0,
        /// Enable Bus Clock
        TIMER0: u1 = 0x0,
        /// Enable Bus Clock
        TIMER1: u1 = 0x0,
        /// Enable Bus Clock
        TIMER2: u1 = 0x0,
        /// Enable Bus Clock
        TIMER3: u1 = 0x0,
        /// Enable Bus Clock
        TIMER4: u1 = 0x0,
        /// Enable Bus Clock
        USART0: u1 = 0x0,
        /// Enable Bus Clock
        IADC0: u1 = 0x0,
        /// Enable Bus Clock
        AMUXCP0: u1 = 0x0,
        /// Enable Bus Clock
        LETIMER0: u1 = 0x0,
        /// Enable Bus Clock
        WDOG0: u1 = 0x0,
        /// Enable Bus Clock
        I2C0: u1 = 0x0,
        /// Enable Bus Clock
        I2C1: u1 = 0x0,
        /// Enable Bus Clock
        SYSCFG: u1 = 0x0,
        /// Enable Bus Clock
        DPLL0: u1 = 0x0,
        /// Enable Bus Clock
        HFRCO0: u1 = 0x0,
        /// Enable Bus Clock
        HFRCOEM23: u1 = 0x0,
        /// Enable Bus Clock
        HFXO0: u1 = 0x0,
        /// Enable Bus Clock
        FSRCO: u1 = 0x0,
        /// Enable Bus Clock
        LFRCO: u1 = 0x0,
        /// Enable Bus Clock
        LFXO: u1 = 0x0,
        /// Enable Bus Clock
        ULFRCO: u1 = 0x0,
        /// Enable Bus Clock
        LESENSE: u1 = 0x0,
        /// Enable Bus Clock
        GPIO: u1 = 0x0,
        /// Enable Bus Clock
        PRS: u1 = 0x0,
        /// Enable Bus Clock
        BURAM: u1 = 0x0,
        /// Enable Bus Clock
        BURTC: u1 = 0x0,
        /// Enable Bus Clock
        SYSRTC0: u1 = 0x0,
        /// Enable Bus Clock
        DCDC: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x68
    CLKEN1: mmio.Mmio(packed struct(u32) {
        /// Enable Bus Clock
        AGC: u1 = 0x0,
        /// Enable Bus Clock
        MODEM: u1 = 0x0,
        /// Enable Bus Clock
        RFCRC: u1 = 0x0,
        /// Enable Bus Clock
        FRC: u1 = 0x0,
        /// Enable Bus Clock
        PROTIMER: u1 = 0x0,
        /// Enable Bus Clock
        RAC: u1 = 0x0,
        /// Enable Bus Clock
        SYNTH: u1 = 0x0,
        /// Enable Bus Clock
        RFSCRATCHPAD: u1 = 0x0,
        /// Enable Bus Clock
        HOSTMAILBOX: u1 = 0x0,
        /// Enable Bus Clock
        RFMAILBOX: u1 = 0x0,
        /// Enable Bus Clock
        SEMAILBOXHOST: u1 = 0x0,
        /// Enable Bus Clock
        BUFC: u1 = 0x0,
        /// Enable Bus Clock
        LCD: u1 = 0x0,
        /// Enable Bus Clock
        KEYSCAN: u1 = 0x0,
        /// Enable Bus Clock
        SMU: u1 = 0x0,
        /// Enable Bus Clock
        ICACHE0: u1 = 0x0,
        /// Enable Bus Clock
        MSC: u1 = 0x0,
        /// Enable Bus Clock
        WDOG1: u1 = 0x0,
        /// Enable Bus Clock
        ACMP0: u1 = 0x0,
        /// Enable Bus Clock
        ACMP1: u1 = 0x0,
        /// Enable Bus Clock
        VDAC0: u1 = 0x0,
        /// Enable Bus Clock
        PCNT0: u1 = 0x0,
        /// Enable Bus Clock
        EUSART0: u1 = 0x0,
        /// Enable Bus Clock
        EUSART1: u1 = 0x0,
        /// Enable Bus Clock
        EUSART2: u1 = 0x0,
        /// Enable Bus Clock
        RFECA0: u1 = 0x0,
        /// Enable Bus Clock
        RFECA1: u1 = 0x0,
        /// Enable Bus Clock
        DMEM: u1 = 0x0,
        /// Enable Bus Clock
        ECAIFADC: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// offset: 0x6c
    reserved108: [4]u8,
    /// No Description
    /// offset: 0x70
    SYSCLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u3) {
            /// FSRCO is clocking SYSCLK
            FSRCO = 0x1,
            /// HFRCODPLL is clocking SYSCLK
            HFRCODPLL = 0x2,
            /// HFXO is clocking SYSCLK
            HFXO = 0x3,
            /// CLKIN0 is clocking SYSCLK
            CLKIN0 = 0x4,
            _,
        } = .FSRCO,
        reserved10: u7 = 0,
        /// PCLK Prescaler
        PCLKPRESC: enum(u1) {
            /// PCLK is HCLK divided by 1
            DIV1 = 0x0,
            /// PCLK is HCLK divided by 2
            DIV2 = 0x1,
        } = .DIV1,
        reserved12: u1 = 0,
        /// HCLK Prescaler
        HCLKPRESC: enum(u4) {
            /// HCLK is SYSCLK divided by 1
            DIV1 = 0x0,
            /// HCLK is SYSCLK divided by 2
            DIV2 = 0x1,
            /// HCLK is SYSCLK divided by 4
            DIV4 = 0x3,
            /// HCLK is SYSCLK divided by 8
            DIV8 = 0x7,
            /// HCLK is SYSCLK divided by 16
            DIV16 = 0xf,
            _,
        } = .DIV1,
        /// Radio HCLK Prescaler
        RHCLKPRESC: enum(u1) {
            /// Radio HCLK is SYSCLK divided by 1
            DIV1 = 0x0,
            /// Radio HCLK is SYSCLK divided by 2
            DIV2 = 0x1,
        } = .DIV1,
        padding: u15 = 0,
    }),
    /// offset: 0x74
    reserved116: [12]u8,
    /// No Description
    /// offset: 0x80
    TRACECLKCTRL: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// TRACECLK Prescaler
        PRESC: enum(u2) {
            /// TRACECLK is SYSCLK divided by 1
            DIV1 = 0x0,
            /// TRACECLK is SYSCLK divided by 2
            DIV2 = 0x1,
            /// TRACECLK is SYSCLK divided by 4
            DIV4 = 0x3,
            _,
        } = .DIV1,
        padding: u26 = 0,
    }),
    /// offset: 0x84
    reserved132: [12]u8,
    /// No Description
    /// offset: 0x90
    EXPORTCLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Output Select 0
        CLKOUTSEL0: enum(u4) {
            /// CLKOUT0 is not clocked
            DISABLED = 0x0,
            /// HCLK is clocking CLKOUT0
            HCLK = 0x1,
            /// EXPORTCLK is clocking CLKOUT0
            HFEXPCLK = 0x2,
            /// ULFRCO is clocking CLKOUT0
            ULFRCO = 0x3,
            /// LFRCO is clocking CLKOUT0
            LFRCO = 0x4,
            /// LFXO is clocking CLKOUT0
            LFXO = 0x5,
            /// HFRCODPLL is clocking CLKOUT0
            HFRCODPLL = 0x6,
            /// HFXO is clocking CLKOUT0
            HFXO = 0x7,
            /// FSRCO is clocking CLKOUT0
            FSRCO = 0x8,
            /// HFRCOEM23 is clocking CLKOUT0
            HFRCOEM23 = 0x9,
            _,
        } = .DISABLED,
        reserved8: u4 = 0,
        /// Clock Output Select 1
        CLKOUTSEL1: enum(u4) {
            /// CLKOUT1 is not clocked
            DISABLED = 0x0,
            /// HCLK is clocking CLKOUT1
            HCLK = 0x1,
            /// EXPORTCLK is clocking CLKOUT1
            HFEXPCLK = 0x2,
            /// ULFRCO is clocking CLKOUT1
            ULFRCO = 0x3,
            /// LFRCO is clocking CLKOUT1
            LFRCO = 0x4,
            /// LFXO is clocking CLKOUT1
            LFXO = 0x5,
            /// HFRCODPLL is clocking CLKOUT1
            HFRCODPLL = 0x6,
            /// HFXO is clocking CLKOUT1
            HFXO = 0x7,
            /// FSRCO is clocking CLKOUT1
            FSRCO = 0x8,
            /// HFRCOEM23 is clocking CLKOUT1
            HFRCOEM23 = 0x9,
            _,
        } = .DISABLED,
        reserved16: u4 = 0,
        /// Clock Output Select 2
        CLKOUTSEL2: enum(u4) {
            /// CLKOUT2 is not clocked
            DISABLED = 0x0,
            /// HCLK is clocking CLKOUT2
            HCLK = 0x1,
            /// EXPORTCLK is clocking CLKOUT2
            HFEXPCLK = 0x2,
            /// ULFRCO is clocking CLKOUT2
            ULFRCO = 0x3,
            /// LFRCO is clocking CLKOUT2
            LFRCO = 0x4,
            /// LFXO is clocking CLKOUT2
            LFXO = 0x5,
            /// HFRCODPLL is clocking CLKOUT2
            HFRCODPLL = 0x6,
            /// HFXO is clocking CLKOUT2
            HFXO = 0x7,
            /// FSRCO is clocking CLKOUT2
            FSRCO = 0x8,
            /// HFRCOEM23 is clocking CLKOUT2
            HFRCOEM23 = 0x9,
            _,
        } = .DISABLED,
        reserved24: u4 = 0,
        /// EXPORTCLK Prescaler
        PRESC: u5 = 0x0,
        padding: u3 = 0,
    }),
    /// offset: 0x94
    reserved148: [108]u8,
    /// No Description
    /// offset: 0x100
    DPLLREFCLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u2) {
            /// DPLLREFCLK is not clocked
            DISABLED = 0x0,
            /// HFXO is clocking DPLLREFCLK
            HFXO = 0x1,
            /// LFXO is clocking DPLLREFCLK
            LFXO = 0x2,
            /// CLKIN0 is clocking DPLLREFCLK
            CLKIN0 = 0x3,
        } = .DISABLED,
        padding: u30 = 0,
    }),
    /// offset: 0x104
    reserved260: [28]u8,
    /// No Description
    /// offset: 0x120
    EM01GRPACLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u3) {
            /// HFRCODPLL is clocking EM01GRPACLK
            HFRCODPLL = 0x1,
            /// HFXO is clocking EM01GRPACLK
            HFXO = 0x2,
            /// FSRCO is clocking EM01GRPACLK
            FSRCO = 0x3,
            /// HFRCOEM23 is clocking EM01GRPACLK
            HFRCOEM23 = 0x4,
            /// HFRCODPLL (retimed) is clocking EM01GRPACLK. Check with datasheet for frequency limitation when using retiming with voltage scaling.
            HFRCODPLLRT = 0x5,
            /// HFXO (retimed) is clocking EM01GRPACLK. Check with datasheet for frequency limitation when using retiming with voltage scaling.
            HFXORT = 0x6,
            _,
        } = .HFRCODPLL,
        padding: u29 = 0,
    }),
    /// offset: 0x124
    reserved292: [4]u8,
    /// No Description
    /// offset: 0x128
    EM01GRPCCLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u3) {
            /// HFRCODPLL is clocking EM01GRPCCLK
            HFRCODPLL = 0x1,
            /// HFXO is clocking EM01GRPCCLK
            HFXO = 0x2,
            /// FSRCO is clocking EM01GRPCCLK
            FSRCO = 0x3,
            /// HFRCOEM23 is clocking EM01GRPCCLK
            HFRCOEM23 = 0x4,
            /// HFRCODPLL (retimed) is clocking EM01GRPCCLK. Check with datasheet for frequency limitation when using retiming with voltage scaling.
            HFRCODPLLRT = 0x5,
            /// HFXO (retimed) is clocking EM01GRPCCLK. Check with datasheet for frequency limitation when using retiming with voltage scaling.
            HFXORT = 0x6,
            _,
        } = .HFRCODPLL,
        padding: u29 = 0,
    }),
    /// offset: 0x12c
    reserved300: [20]u8,
    /// No Description
    /// offset: 0x140
    EM23GRPACLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u2) {
            /// LFRCO is clocking EM23GRPACLK
            LFRCO = 0x1,
            /// LFXO is clocking EM23GRPACLK
            LFXO = 0x2,
            /// ULFRCO is clocking EM23GRPACLK
            ULFRCO = 0x3,
            _,
        } = .LFRCO,
        padding: u30 = 0,
    }),
    /// offset: 0x144
    reserved324: [28]u8,
    /// No Description
    /// offset: 0x160
    EM4GRPACLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u2) {
            /// LFRCO is clocking EM4GRPACLK
            LFRCO = 0x1,
            /// LFXO is clocking EM4GRPACLK
            LFXO = 0x2,
            /// ULFRCO is clocking EM4GRPACLK
            ULFRCO = 0x3,
            _,
        } = .LFRCO,
        padding: u30 = 0,
    }),
    /// offset: 0x164
    reserved356: [28]u8,
    /// No Description
    /// offset: 0x180
    IADCCLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u2) {
            /// EM01GRPACLK is clocking IADCCLK
            EM01GRPACLK = 0x1,
            /// FSRCO is clocking IADCCLK
            FSRCO = 0x2,
            /// HFRCOEM23 is clocking IADCCLK
            HFRCOEM23 = 0x3,
            _,
        } = .EM01GRPACLK,
        padding: u30 = 0,
    }),
    /// offset: 0x184
    reserved388: [124]u8,
    /// No Description
    /// offset: 0x200
    WDOG0CLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u3) {
            /// LFRCO is clocking WDOG0CLK
            LFRCO = 0x1,
            /// LFXO is clocking WDOG0CLK
            LFXO = 0x2,
            /// ULFRCO is clocking WDOG0CLK
            ULFRCO = 0x3,
            /// HCLKDIV1024 is clocking WDOG0CLK
            HCLKDIV1024 = 0x4,
            _,
        } = .LFRCO,
        padding: u29 = 0,
    }),
    /// offset: 0x204
    reserved516: [4]u8,
    /// No Description
    /// offset: 0x208
    WDOG1CLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u3) {
            /// LFRCO is clocking WDOG0CLK
            LFRCO = 0x1,
            /// LFXO is clocking WDOG0CLK
            LFXO = 0x2,
            /// ULFRCO is clocking WDOG0CLK
            ULFRCO = 0x3,
            /// HCLKDIV1024 is clocking WDOG0CLK
            HCLKDIV1024 = 0x4,
            _,
        } = .LFRCO,
        padding: u29 = 0,
    }),
    /// offset: 0x20c
    reserved524: [20]u8,
    /// No Description
    /// offset: 0x220
    EUSART0CLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u3) {
            /// EUSART0 is not clocked
            DISABLED = 0x0,
            /// EM01GRPCCLK is clocking EUSART0
            EM01GRPCCLK = 0x1,
            /// HFRCOEM23 is clocking EUSART0
            HFRCOEM23 = 0x2,
            /// LFRCO is clocking EUSART0
            LFRCO = 0x3,
            /// LFXO is clocking EUSART0
            LFXO = 0x4,
            _,
        } = .EM01GRPCCLK,
        padding: u29 = 0,
    }),
    /// offset: 0x224
    reserved548: [28]u8,
    /// No Description
    /// offset: 0x240
    SYSRTC0CLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u2) {
            /// LFRCO is clocking SYSRTC0CLK
            LFRCO = 0x1,
            /// LFXO is clocking SYSRTC0CLK
            LFXO = 0x2,
            /// ULFRCO is clocking SYSRTC0CLK
            ULFRCO = 0x3,
            _,
        } = .LFRCO,
        padding: u30 = 0,
    }),
    /// offset: 0x244
    reserved580: [12]u8,
    /// No Description
    /// offset: 0x250
    LCDCLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u2) {
            /// LFRCO is clocking LCDCLK
            LFRCO = 0x1,
            /// LFXO is clocking LCDCLK
            LFXO = 0x2,
            /// ULFRCO is clocking LCDCLK
            ULFRCO = 0x3,
            _,
        } = .LFRCO,
        padding: u30 = 0,
    }),
    /// offset: 0x254
    reserved596: [12]u8,
    /// No Description
    /// offset: 0x260
    VDAC0CLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u3) {
            /// VDAC is not clocked
            DISABLED = 0x0,
            /// EM01GRPACLK is clocking VDAC
            EM01GRPACLK = 0x1,
            /// EM23GRPACLK is clocking VDAC
            EM23GRPACLK = 0x2,
            /// FSRCO is clocking VDAC
            FSRCO = 0x3,
            /// HFRCOEM23 is clocking VDAC
            HFRCOEM23 = 0x4,
            _,
        } = .EM01GRPACLK,
        padding: u29 = 0,
    }),
    /// offset: 0x264
    reserved612: [12]u8,
    /// No Description
    /// offset: 0x270
    PCNT0CLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u2) {
            /// PCNT0 is not clocked
            DISABLED = 0x0,
            /// EM23GRPACLK is clocking PCNT0
            EM23GRPACLK = 0x1,
            /// External pin PCNT_S0 is clocking PCNT0
            PCNTS0 = 0x2,
            _,
        } = .EM23GRPACLK,
        padding: u30 = 0,
    }),
    /// offset: 0x274
    reserved628: [12]u8,
    /// No Description
    /// offset: 0x280
    RADIOCLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Enable
        EN: u1 = 0x0,
        reserved31: u30 = 0,
        /// Enable Clock for Debugger
        DBGCLK: u1 = 0x0,
    }),
    /// offset: 0x284
    reserved644: [12]u8,
    /// No Description
    /// offset: 0x290
    LESENSEHFCLKCTRL: mmio.Mmio(packed struct(u32) {
        /// Clock Select
        CLKSEL: enum(u2) {
            /// FSRCO is clocking LESENSEHFCLK
            FSRCO = 0x1,
            /// HFRCOEM23 is clocking LESENSEHFCLK
            HFRCOEM23 = 0x2,
            _,
        } = .FSRCO,
        padding: u30 = 0,
    }),
};
