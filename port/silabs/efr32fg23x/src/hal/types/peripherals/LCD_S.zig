const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// LCD_S Registers
pub const LCD_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IPVERSION
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// Enable
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
    CTRL: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Update Data Control
        UDCTRL: enum(u2) {
            /// The data transfer is controlled by SW. Transfer is performed as soon as possible on the next CTRL.PRESCALE clock. This is primarily available for debug only since only some of the new SEGMENT data may be ready by the time of the UPDATE. This should not be used with interrupts since partially updating SEGMENT data may have indeterminant results.
            REGULAR = 0x0,
            /// Data is loaded continuously at every frame start
            FRAMESTART = 0x1,
            /// The data transfer is done at the next Frame Counter event
            FCEVENT = 0x2,
            /// The data transfer is done at the next Display Counter event
            DISPLAYEVENT = 0x3,
        } = .REGULAR,
        reserved16: u13 = 0,
        /// Direct Segment Control
        DSC: enum(u1) {
            /// DSC disable
            DISABLE = 0x0,
            /// DSC enable
            ENABLE = 0x1,
        } = .DISABLE,
        reserved18: u1 = 0,
        /// Warmup Delay
        WARMUPDLY: enum(u3) {
            /// 1mswarm up
            WARMUP1 = 0x0,
            /// 31ms warm up
            WARMUP31 = 0x1,
            /// 62ms warm up
            WARMUP63 = 0x2,
            /// 125ms warm up
            WARMUP125 = 0x3,
            /// 250ms warm up
            WARMUP250 = 0x4,
            /// 500ms warm up
            WARMUP500 = 0x5,
            /// 1000ms warm up
            WARMUP1000 = 0x6,
            /// 2000ms warm up
            WARMUP2000 = 0x7,
        } = .WARMUP250,
        reserved24: u3 = 0,
        /// Presclae
        PRESCALE: u7 = 0x0,
        padding: u1 = 0,
    }),
    /// No Description
    /// offset: 0x10
    CMD: mmio.Mmio(packed struct(u32) {
        /// Load command
        LOAD: u1 = 0x0,
        /// Clear command
        CLEAR: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x14
    DISPCTRL: mmio.Mmio(packed struct(u32) {
        /// Mux Configuration
        MUX: enum(u3) {
            /// Static
            STATIC = 0x0,
            /// Duplex
            DUPLEX = 0x1,
            /// Triplex
            TRIPLEX = 0x2,
            /// Quadruplex
            QUADRUPLEX = 0x3,
            _,
        } = .STATIC,
        reserved4: u1 = 0,
        /// Waveform Selection
        WAVE: enum(u1) {
            /// Type B waveform
            TYPEB = 0x0,
            /// Type A waveform
            TYPEA = 0x1,
        } = .TYPEB,
        reserved20: u15 = 0,
        /// Charge Redistribution Cycles
        CHGRDST: enum(u3) {
            /// Disable charge redistribution.
            DISABLE = 0x0,
            /// Use 1 prescaled low frequency clock cycle for charge redistribution.
            ONE = 0x1,
            /// Use 2 prescaled low frequency clock cycles for charge redistribution.
            TWO = 0x2,
            /// Use 3 prescaled low frequency clock cycles for charge redistribution.
            THREE = 0x3,
            /// Use 4 prescaled low frequency clock cycles for charge redistribution.
            FOUR = 0x4,
            _,
        } = .ONE,
        reserved24: u1 = 0,
        /// Bias Configuration
        BIAS: enum(u2) {
            /// Static
            STATIC = 0x0,
            /// 1/2 Bias
            ONEHALF = 0x1,
            /// 1/3 Bias
            ONETHIRD = 0x2,
            /// 1/4 Bias
            ONEFOURTH = 0x3,
        } = .STATIC,
        padding: u6 = 0,
    }),
    /// No Description
    /// offset: 0x18
    BACFG: mmio.Mmio(packed struct(u32) {
        /// ASTATE top cnt
        ASTATETOP: u3 = 0x7,
        reserved16: u13 = 0,
        /// Frame Counter Prescaler
        FCPRESC: enum(u2) {
            /// every frame clock
            DIV1 = 0x0,
            /// every 2nd frame clock
            DIV2 = 0x1,
            /// every 4th frame clock
            DIV4 = 0x2,
            /// every 8th frame clock
            DIV8 = 0x3,
        } = .DIV1,
        /// Frame Counter Top
        FCTOP: u6 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    BACTRL: mmio.Mmio(packed struct(u32) {
        /// Blink Enable
        BLINKEN: u1 = 0x0,
        /// Blank Display
        BLANK: enum(u1) {
            /// Display is not "blanked"
            DISABLE = 0x0,
            /// Display is "blanked"
            ENABLE = 0x1,
        } = .DISABLE,
        /// Animation Enable
        AEN: u1 = 0x0,
        /// Animate Register A Shift Control
        AREGASC: enum(u2) {
            /// No Shift operation on Animation Register A
            NOSHIFT = 0x0,
            /// Animation Register A is shifted left
            SHIFTLEFT = 0x1,
            /// Animation Register A is shifted right
            SHIFTRIGHT = 0x2,
            _,
        } = .NOSHIFT,
        /// Animate Register B Shift Control
        AREGBSC: enum(u2) {
            /// No Shift operation on Animation Register B
            NOSHIFT = 0x0,
            /// Animation Register B is shifted left
            SHIFTLEFT = 0x1,
            /// Animation Register B is shifted right
            SHIFTRIGHT = 0x2,
            _,
        } = .NOSHIFT,
        /// Animate Logic Function Select
        ALOGSEL: enum(u1) {
            /// AREGA and AREGB AND'ed
            AND = 0x0,
            /// AREGA and AREGB OR'ed
            OR = 0x1,
        } = .AND,
        /// Frame Counter Enable
        FCEN: u1 = 0x0,
        /// Display Counter Enable
        DISPLAYCNTEN: enum(u1) {
            /// Disable the display counter
            DISABLE = 0x0,
            /// Enable the display counter
            ENABLE = 0x1,
        } = .DISABLE,
        reserved28: u18 = 0,
        /// Animation Location
        ALOC: enum(u1) {
            /// Animation appears on segments 0 to 7
            SEG0TO7 = 0x0,
            /// Animation appears on segments 8 to 15
            SEG8TO15 = 0x1,
        } = .SEG0TO7,
        padding: u3 = 0,
    }),
    /// No Description
    /// offset: 0x20
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Current Animation State
        ASTATE: u4 = 0x0,
        reserved8: u4 = 0,
        /// Blink State
        BLINK: u1 = 0x0,
        reserved11: u2 = 0,
        /// Load Synchronization is busy
        LOADBUSY: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x24
    AREGA: mmio.Mmio(packed struct(u32) {
        /// Animation Register A Data
        AREGA: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x28
    AREGB: mmio.Mmio(packed struct(u32) {
        /// Animation Register B Data
        AREGB: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x2c
    IF: mmio.Mmio(packed struct(u32) {
        /// Frame Counter
        FC: u1 = 0x0,
        /// Display Update Event
        DISPLAY: u1 = 0x0,
        /// Synchronization is Done
        SYNCBUSYDONE: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x30
    IEN: mmio.Mmio(packed struct(u32) {
        /// Frame Counter
        FC: u1 = 0x0,
        /// Display Update Event
        DISPLAY: u1 = 0x0,
        /// Sync Busy Done
        SYNCBUSYDONE: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x34
    BIASCTRL: mmio.Mmio(packed struct(u32) {
        /// Resistor strength
        RESISTOR: u4 = 0x0,
        /// Buffer Drive Strength
        BUFDRV: u3 = 0x0,
        reserved8: u1 = 0,
        /// Buffer Bias Setting
        BUFBIAS: u2 = 0x0,
        reserved12: u2 = 0,
        /// Mode Setting
        MODE: enum(u1) {
            /// Use step down control with VLCD less than VDDX. Use VLCD[4:0] to control VLCD level, and use SPEED to adjust VLCD drive strength.
            STEPDOWN = 0x0,
            /// Use the charge pump to pump VLCD above VDDX.
            CHARGEPUMP = 0x1,
        } = .STEPDOWN,
        reserved16: u3 = 0,
        /// VLCD voltage level
        VLCD: u5 = 0x1F,
        reserved22: u1 = 0,
        /// VDDX select
        VDDXSEL: enum(u1) {
            /// Connect charge pump to digital DVDD supply
            DVDD = 0x0,
            /// Connect charge pump to analog AVDD supply
            AVDD = 0x1,
        } = .DVDD,
        reserved26: u3 = 0,
        /// LCD Gate
        LCDGATE: enum(u1) {
            /// LCD BIAS voltages driven onto pins.
            UNGATE = 0x0,
            /// LCD BIAS MUX tristated at the pins.
            GATE = 0x1,
        } = .UNGATE,
        reserved30: u3 = 0,
        /// DMA Mode
        DMAMODE: enum(u2) {
            /// No DMA requests are generated
            DMADISABLE = 0x0,
            /// DMA request on frame counter event. This will also start a DMA transfer during EM23.
            DMAFC = 0x1,
            /// DMA request on display counter event. This will also start a DMA transfer during EM23.
            DMADISPLAY = 0x2,
            _,
        } = .DMADISABLE,
    }),
    /// No Description
    /// offset: 0x38
    DISPCTRLX: mmio.Mmio(packed struct(u32) {
        /// Display Divider
        DISPLAYDIV: u10 = 0x0,
        padding: u22 = 0,
    }),
    /// offset: 0x3c
    reserved60: [4]u8,
    /// No Description
    /// offset: 0x40
    SEGD0: mmio.Mmio(packed struct(u32) {
        /// COM0 Segment Data Low
        SEGD0: u20 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x44
    reserved68: [4]u8,
    /// No Description
    /// offset: 0x48
    SEGD1: mmio.Mmio(packed struct(u32) {
        /// COM1 Segment Data Low
        SEGD1: u20 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x4c
    reserved76: [4]u8,
    /// No Description
    /// offset: 0x50
    SEGD2: mmio.Mmio(packed struct(u32) {
        /// COM2 Segment Data Low
        SEGD2: u20 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x54
    reserved84: [4]u8,
    /// No Description
    /// offset: 0x58
    SEGD3: mmio.Mmio(packed struct(u32) {
        /// COM3 Segment Data Low
        SEGD3: u20 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x5c
    reserved92: [100]u8,
    /// No Description
    /// offset: 0xc0
    UPDATECTRL: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Auto Load
        AUTOLOAD: enum(u1) {
            /// CLK_BUS register to CLK_PER register loads must be done manually with a write to CMD.LOAD.
            MANUAL = 0x0,
            /// CLK_BUS register to CLK_PER register loads will be started automatically after a write to the register in UPDATECTRL.LOADADDR is detected.
            AUTO = 0x1,
        } = .MANUAL,
        reserved13: u4 = 0,
        /// Load Address
        LOADADDR: enum(u4) {
            /// Starts synchronizing registers from CLK_BUS to CLK_PER after a write to BACTRL. Use with UPDATECTRL.AUTOLOAD
            BACTRLWR = 0x0,
            /// Starts synchronizing registers from CLK_BUS to CLK_PER after a write to AREGA. Use with UPDATECTRL.AUTOLOAD
            AREGAWR = 0x1,
            /// Starts synchronizing registers from CLK_BUS to CLK_PER after a write to AREGB. Use with UPDATECTRL.AUTOLOAD
            AREGBWR = 0x2,
            /// Starts synchronizing registers from CLK_BUS to CLK_PER after a write to SEGD0. Use with UPDATECTRL.AUTOLOAD
            SEGD0WR = 0x3,
            /// Starts synchronizing registers from CLK_BUS to CLK_PER after a write to SEGD1. Use with UPDATECTRL.AUTOLOAD
            SEGD1WR = 0x4,
            /// Starts synchronizing registers from CLK_BUS to CLK_PER after a write to SEGD2. Use with UPDATECTRL.AUTOLOAD
            SEGD2WR = 0x5,
            /// Starts synchronizing registers from CLK_BUS to CLK_PER after a write to SEGD3. Use with UPDATECTRL.AUTOLOAD
            SEGD3WR = 0x6,
            _,
        } = .BACTRLWR,
        padding: u15 = 0,
    }),
    /// offset: 0xc4
    reserved196: [44]u8,
    /// No Description
    /// offset: 0xf0
    FRAMERATE: mmio.Mmio(packed struct(u32) {
        /// Frame Rate Divider
        FRDIV: u9 = 0x0,
        padding: u23 = 0,
    }),
};
