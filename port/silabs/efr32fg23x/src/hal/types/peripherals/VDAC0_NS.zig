const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// VDAC0_NS Registers
pub const VDAC0_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IPVERSION
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// VDAC Module Enable
        EN: enum(u1) {
            /// Disable
            DISABLE = 0x0,
            /// Enable
            ENABLE = 0x1,
        } = .DISABLE,
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
        /// Differential Mode
        DIFF: enum(u1) {
            /// Single ended output
            SINGLEENDED = 0x0,
            /// Differential output
            DIFFERENTIAL = 0x1,
        } = .SINGLEENDED,
        /// Sine Mode
        SINEMODE: enum(u1) {
            /// Sine mode disabled. Sine reset to 0 degrees
            DISSINEMODE = 0x0,
            /// Sine mode enabled
            ENSINEMODE = 0x1,
        } = .DISSINEMODE,
        /// Sine Wave Reset When inactive
        SINERESET: u1 = 0x0,
        /// Channel 0 Start Reset Prescaler
        CH0PRESCRST: enum(u1) {
            /// Prescaler not reset on channel 0 start
            NORESETPRESC = 0x0,
            /// Prescaler reset on channel 0 start
            RESETPRESC = 0x1,
        } = .NORESETPRESC,
        /// Reference Selection
        REFRSEL: enum(u2) {
            /// Internal 1.25 V bandgap reference
            V125 = 0x0,
            /// Internal 2.5 V bandgap reference
            V25 = 0x1,
            /// AVDD reference
            VDD = 0x2,
            /// External pin reference
            EXT = 0x3,
        } = .V125,
        reserved7: u1 = 0,
        /// Prescaler Setting for DAC clock
        PRESC: u7 = 0x0,
        reserved16: u2 = 0,
        /// Internal Timer Overflow Period
        TIMEROVRFLOWPERIOD: enum(u3) {
            /// The Timer overflows every 2 Prescaled CLK_DAC cycles
            CYCLES2 = 0x0,
            /// The Timer overflows every 4 Prescaled CLK_DAC cycles
            CYCLES4 = 0x1,
            /// The Timer overflows every 8 Prescaled CLK_DAC cycles
            CYCLES8 = 0x2,
            /// The Timer overflows every 16 Prescaled CLK_DAC cycles
            CYCLES16 = 0x3,
            /// The Timer overflows every 32 Prescaled CLK_DAC cycles
            CYCLES32 = 0x4,
            /// The Timer overflows every 64 Prescaled CLK_DAC cycles
            CYCLES64 = 0x5,
            _,
        } = .CYCLES2,
        reserved20: u1 = 0,
        /// Refresh Timer Overflow Period
        REFRESHPERIOD: enum(u3) {
            /// All channels with enabled refresh are refreshed every 2 CLK_REFRESH cycles
            CYCLES2 = 0x0,
            /// All channels with enabled refresh are refreshed every 4 CLK_REFRESH cycles
            CYCLES4 = 0x1,
            /// All channels with enabled refresh are refreshed every 8 CLK_REFRESH cycles
            CYCLES8 = 0x2,
            /// All channels with enabled refresh are refreshed every 16 CLK_REFRESH cycles
            CYCLES16 = 0x3,
            /// All channels with enabled refresh are refreshed every 32 CLK_REFRESH cycles
            CYCLES32 = 0x4,
            /// All channels with enabled refresh are refreshed every 64 CLK_REFRESH cycles
            CYCLES64 = 0x5,
            /// All channels with enabled refresh are refreshed every 128 CLK_REFRESH cycles
            CYCLES128 = 0x6,
            /// All channels with enabled refresh are refreshed every 256 CLK_REFRESH cycles
            CYCLES256 = 0x7,
        } = .CYCLES2,
        reserved24: u1 = 0,
        /// Bias Keepwarm Mode Enable
        BIASKEEPWARM: u1 = 0x0,
        /// VDAC DMA Wakeup
        DMAWU: u1 = 0x0,
        /// Always allow clk_dac
        ONDEMANDCLK: u1 = 0x0,
        /// Debug Halt
        DBGHALT: enum(u1) {
            /// Continue operation as normal during debug mode
            NORMAL = 0x0,
            /// Complete the current conversion and then halt during debug mode
            HALT = 0x1,
        } = .NORMAL,
        /// DAC Warmup Time
        WARMUPTIME: u3 = 0x2,
        padding: u1 = 0,
    }),
    /// No Description
    /// offset: 0x10
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Enabled Status
        CH0ENS: u1 = 0x0,
        /// Channel 1 Enabled Status
        CH1ENS: u1 = 0x0,
        reserved4: u2 = 0,
        /// Channel 0 Warmed Status
        CH0WARM: u1 = 0x0,
        /// Channel 1 Warmed Status
        CH1WARM: u1 = 0x0,
        reserved8: u2 = 0,
        /// Channel 0 FIFO Full Status
        CH0FIFOFULL: u1 = 0x0,
        /// Channel 1 FIFO Full Status
        CH1FIFOFULL: u1 = 0x0,
        reserved12: u2 = 0,
        /// Channel 0 FIFO Valid Count
        CH0FIFOCNT: u3 = 0x0,
        /// Channel 1 FIFO Valid Count
        CH1FIFOCNT: u3 = 0x0,
        reserved19: u1 = 0,
        /// Channel 0 Current Status
        CH0CURRENTSTATE: u1 = 0x0,
        /// Channel 1 Current Status
        CH1CURRENTSTATE: u1 = 0x0,
        reserved22: u1 = 0,
        /// Channel 0 FIFO Empty Status
        CH0FIFOEMPTY: u1 = 0x0,
        /// Channel 1 FIFO Empty Status
        CH1FIFOEMPTY: u1 = 0x0,
        reserved26: u2 = 0,
        /// CH0 FIFO Flush Sync Busy
        CH0FIFOFLBUSY: u1 = 0x0,
        /// CH1 FIFO Flush Sync Busy
        CH1FIFOFLBUSY: u1 = 0x0,
        /// ABUS Input Conflict Status
        ABUSINPUTCONFLICT: u1 = 0x0,
        /// Sine Wave Output Status on Channel
        SINEACTIVE: u1 = 0x0,
        /// ABUS Allocation Error Status
        ABUSALLOCERR: u1 = 0x0,
        /// Sync Busy Combined
        SYNCBUSY: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x14
    CH0CFG: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Conversion Mode
        CONVMODE: enum(u1) {
            /// DAC channel 0 is set in continuous mode
            CONTINUOUS = 0x0,
            /// DAC channel 0 is set in sample/shut off mode
            SAMPLEOFF = 0x1,
        } = .CONTINUOUS,
        reserved2: u1 = 0,
        /// Channel 0 Power Mode
        POWERMODE: enum(u1) {
            /// Default is High Power Mode
            HIGHPOWER = 0x0,
            /// Set this bit for Low Power Mode
            LOWPOWER = 0x1,
        } = .HIGHPOWER,
        reserved4: u1 = 0,
        /// Channel 0 Trigger Mode
        TRIGMODE: enum(u3) {
            /// No Conversion Trigger Source Selected for Channel 0
            NONE = 0x0,
            /// Channel 0 is triggered by Channel 0 FIFO (CH0F) write
            SW = 0x1,
            /// Channel 0 is triggered by Sync PRS input. PRS Trigger should have the same clock group as VDAC.
            SYNCPRS = 0x2,
            /// Channel 0 is triggered by LESENSE
            LESENSE = 0x3,
            /// Channel 0 is triggered by Internal Timer Overflow
            INTERNALTIMER = 0x4,
            /// Channel 0 is triggered by Async PRS input
            ASYNCPRS = 0x5,
            _,
        } = .SW,
        reserved8: u1 = 0,
        /// Channel 0 Refresh Source
        REFRESHSOURCE: enum(u2) {
            /// No Refresh Source Selected for Channel 0.
            NONE = 0x0,
            /// Channel 0 Refresh triggered by Refresh Timer Overflow
            REFRESHTIMER = 0x1,
            /// Channel 0 Refresh triggered by Sync PRS. PRS Trigger should have the same clock group as VDAC.
            SYNCPRS = 0x2,
            /// Channel 0 Refresh triggered by Async PRS
            ASYNCPRS = 0x3,
        } = .NONE,
        reserved11: u1 = 0,
        /// Channel 0 FIFO Low Watermark
        FIFODVL: u2 = 0x0,
        reserved14: u1 = 0,
        /// Channel 0 High Cap Load Mode Enable
        HIGHCAPLOADEN: u1 = 0x0,
        reserved16: u1 = 0,
        /// Channel 0 Keepwarm Mode Enable
        KEEPWARM: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// No Description
    /// offset: 0x18
    CH1CFG: mmio.Mmio(packed struct(u32) {
        /// Channel 1 Conversion Mode
        CONVMODE: enum(u1) {
            /// DAC channel 1 is set in continuous mode
            CONTINUOUS = 0x0,
            /// DAC channel 1 is set in sample/shut off mode
            SAMPLEOFF = 0x1,
        } = .CONTINUOUS,
        reserved2: u1 = 0,
        /// Channel 1 Power Mode
        POWERMODE: enum(u1) {
            /// Default is High Power Mode
            HIGHPOWER = 0x0,
            /// Set this bit for Low Power Mode
            LOWPOWER = 0x1,
        } = .HIGHPOWER,
        reserved4: u1 = 0,
        /// Channel 1 Trigger Mode
        TRIGMODE: enum(u3) {
            /// No Conversion Trigger Source Selected for Channel 1
            NONE = 0x0,
            /// Channel 1 is triggered by Channel 1 FIFO (CH1F) write
            SW = 0x1,
            /// Channel 1 is triggered by Sync PRS input.PRS Trigger should have the same clock group as VDAC.
            SYNCPRS = 0x2,
            /// Channel 1 is triggered by Internal Timer Overflow
            INTERNALTIMER = 0x4,
            /// Channel 1 is triggered by Async PRS input
            ASYNCPRS = 0x5,
            _,
        } = .SW,
        reserved8: u1 = 0,
        /// Channel 1 Refresh Source
        REFRESHSOURCE: enum(u2) {
            /// No Refresh Source Selected
            NONE = 0x0,
            /// CH1 Refresh Triggered by Refresh Timer Overflow
            REFRESHTIMER = 0x1,
            /// CH1 Refresh Triggered by Sync PRS. PRS Trigger should have the same clock group as VDAC.
            SYNCPRS = 0x2,
            /// CH1 Refresh Triggered by Async PRS
            ASYNCPRS = 0x3,
        } = .NONE,
        reserved11: u1 = 0,
        /// Channel 1 FIFO Low Watermark
        FIFODVL: u2 = 0x0,
        reserved14: u1 = 0,
        /// Channel 1 High Cap Load Mode Enable
        HIGHCAPLOADEN: u1 = 0x0,
        reserved16: u1 = 0,
        /// Channel 1 Keepwarm Mode Enable
        KEEPWARM: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    CMD: mmio.Mmio(packed struct(u32) {
        /// DAC Channel 0 Enable
        CH0EN: u1 = 0x0,
        /// DAC Channel 0 Disable
        CH0DIS: u1 = 0x0,
        reserved4: u2 = 0,
        /// DAC Channel 1 Enable
        CH1EN: u1 = 0x0,
        /// DAC Channel 1 Disable
        CH1DIS: u1 = 0x0,
        reserved8: u2 = 0,
        /// CH0 WFIFO Flush
        CH0FIFOFLUSH: u1 = 0x0,
        /// CH1 WFIFO Flush
        CH1FIFOFLUSH: u1 = 0x0,
        /// Start Sine Wave Generation
        SINEMODESTART: u1 = 0x0,
        /// Stop Sine Wave Generation
        SINEMODESTOP: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x20
    IF: mmio.Mmio(packed struct(u32) {
        /// CH0 Conversion Done Interrupt Flag
        CH0CD: u1 = 0x0,
        /// CH1 Conversion Done Interrupt Flag
        CH1CD: u1 = 0x0,
        reserved4: u2 = 0,
        /// CH0 Data Overflow Interrupt Flag
        CH0OF: u1 = 0x0,
        /// CH1 Data Overflow Interrupt Flag
        CH1OF: u1 = 0x0,
        reserved8: u2 = 0,
        /// CH0 Data Underflow Interrupt Flag
        CH0UF: u1 = 0x0,
        /// CH1 Data Underflow Interrupt Flag
        CH1UF: u1 = 0x0,
        reserved18: u8 = 0,
        /// ABUS Port Allocation Error Flag
        ABUSALLOCERR: u1 = 0x0,
        reserved20: u1 = 0,
        /// CH0 Data Valid Level Interrupt Flag
        CH0DVL: u1 = 0x0,
        /// CH1 Data Valid Level Interrupt Flag
        CH1DVL: u1 = 0x0,
        reserved26: u4 = 0,
        /// ABUS Input Conflict Error Flag
        ABUSINPUTCONFLICT: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// No Description
    /// offset: 0x24
    IEN: mmio.Mmio(packed struct(u32) {
        /// CH0 Conversion Done Interrupt Flag
        CH0CD: u1 = 0x0,
        /// CH1 Conversion Done Interrupt Flag
        CH1CD: u1 = 0x0,
        reserved4: u2 = 0,
        /// CH0 Data Overflow Interrupt Flag
        CH0OF: u1 = 0x0,
        /// CH1 Data Overflow Interrupt Flag
        CH1OF: u1 = 0x0,
        reserved8: u2 = 0,
        /// CH0 Data Underflow Interrupt Flag
        CH0UF: u1 = 0x0,
        /// CH1 Data Underflow Interrupt Flag
        CH1UF: u1 = 0x0,
        reserved18: u8 = 0,
        /// ABUS Allocation Error Interrupt Flag
        ABUSALLOCERR: u1 = 0x0,
        reserved20: u1 = 0,
        /// CH0 Data Valid Level Interrupt Flag
        CH0DVL: u1 = 0x0,
        /// CH1 Data Valid Level Interrupt Flag
        CH1DVL: u1 = 0x0,
        reserved26: u4 = 0,
        /// ABUS Input Conflict Interrupt Flag
        ABUSINPUTCONFLICT: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// No Description
    /// offset: 0x28
    CH0F: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Data
        DATA: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x2c
    CH1F: mmio.Mmio(packed struct(u32) {
        /// Channel 1 Data
        DATA: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x30
    OUTCTRL: mmio.Mmio(packed struct(u32) {
        /// CH0 Main Output Enable
        MAINOUTENCH0: u1 = 0x0,
        /// CH1 Main Output Enable
        MAINOUTENCH1: u1 = 0x0,
        reserved4: u2 = 0,
        /// CH0 Alternative Output Enable
        AUXOUTENCH0: u1 = 0x0,
        /// CH1 Alternative Output Enable
        AUXOUTENCH1: u1 = 0x0,
        reserved8: u2 = 0,
        /// CH1 Main and Alternative Output Short
        SHORTCH0: u1 = 0x0,
        /// CH0 Main and Alternative Output Short
        SHORTCH1: u1 = 0x0,
        reserved12: u2 = 0,
        /// CH0 ABUS Port Select
        ABUSPORTSELCH0: enum(u3) {
            /// No GPIO Selected for CH0 ABUS Output
            NONE = 0x0,
            /// Port A Selected
            PORTA = 0x1,
            /// Port B Selected
            PORTB = 0x2,
            /// Port C Selected
            PORTC = 0x3,
            /// Port D Selected
            PORTD = 0x4,
            _,
        } = .NONE,
        /// CH0 ABUS Pin Select
        ABUSPINSELCH0: u6 = 0x0,
        reserved22: u1 = 0,
        /// CH1 ABUS Port Select
        ABUSPORTSELCH1: enum(u3) {
            /// No GPIO Selected for CH1 ABUS Output
            NONE = 0x0,
            /// Port A Selected
            PORTA = 0x1,
            /// Port B Selected
            PORTB = 0x2,
            /// Port C Selected
            PORTC = 0x3,
            /// Port D Selected
            PORTD = 0x4,
            _,
        } = .NONE,
        /// CH1 ABUS Pin Select
        ABUSPINSELCH1: u6 = 0x0,
        padding: u1 = 0,
    }),
    /// No Description
    /// offset: 0x34
    OUTTIMERCFG: mmio.Mmio(packed struct(u32) {
        /// CH0 Output Hold Time
        CH0OUTHOLDTIME: u10 = 0x0,
        reserved15: u5 = 0,
        /// CH1 Output Hold Time
        CH1OUTHOLDTIME: u10 = 0x0,
        padding: u7 = 0,
    }),
};
