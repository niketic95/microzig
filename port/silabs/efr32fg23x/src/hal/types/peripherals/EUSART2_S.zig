const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// EUSART2_S Registers
pub const EUSART2_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP version ID
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// Module enable
        EN: u1 = 0x0,
        /// Disablement busy status
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CFG0: mmio.Mmio(packed struct(u32) {
        /// Synchronous Mode
        SYNC: enum(u1) {
            /// The EUSART operates in asynchronous mode
            ASYNC = 0x0,
            /// The EUSART operates in synchronous mode
            SYNC = 0x1,
        } = .ASYNC,
        /// Loopback Enable
        LOOPBK: enum(u1) {
            /// The receiver is connected to and receives data from UARTn_RX
            DISABLE = 0x0,
            /// The receiver is connected to and receives data from UARTn_TX
            ENABLE = 0x1,
        } = .DISABLE,
        /// Collision Check Enable
        CCEN: enum(u1) {
            /// Collision check is disabled
            DISABLE = 0x0,
            /// Collision check is enabled. The receiver must be enabled for the check to be performed
            ENABLE = 0x1,
        } = .DISABLE,
        /// Multi-Processor Mode
        MPM: enum(u1) {
            /// The 9th bit of incoming frames has no special function
            DISABLE = 0x0,
            /// An incoming frame with the 9th bit equal to MPAB will be loaded into the RX FIFO regardless of RXBLOCK and will result in the MPAB interrupt flag being set
            ENABLE = 0x1,
        } = .DISABLE,
        /// Multi-Processor Address-Bit
        MPAB: u1 = 0x0,
        /// Oversampling
        OVS: enum(u3) {
            /// 16X oversampling
            X16 = 0x0,
            /// 8X oversampling
            X8 = 0x1,
            /// 6X oversampling
            X6 = 0x2,
            /// 4X oversampling
            X4 = 0x3,
            /// Disable oversampling (for LF operation)
            DISABLE = 0x4,
            _,
        } = .X16,
        reserved10: u2 = 0,
        /// Most Significant Bit First
        MSBF: enum(u1) {
            /// Data is sent with the least significant bit first
            DISABLE = 0x0,
            /// Data is sent with the most significant bit first
            ENABLE = 0x1,
        } = .DISABLE,
        reserved13: u2 = 0,
        /// Receiver Input Invert
        RXINV: enum(u1) {
            /// Input is passed directly to the receiver
            DISABLE = 0x0,
            /// Input is inverted before it is passed to the receiver
            ENABLE = 0x1,
        } = .DISABLE,
        /// Transmitter output Invert
        TXINV: enum(u1) {
            /// Output from the transmitter is passed unchanged to UARTn_TX
            DISABLE = 0x0,
            /// Output from the transmitter is inverted before it is passed to UARTn_TX
            ENABLE = 0x1,
        } = .DISABLE,
        reserved17: u2 = 0,
        /// Automatic TX Tristate
        AUTOTRI: enum(u1) {
            /// The output on UARTn_TX when the transmitter is idle is defined by TXINV
            DISABLE = 0x0,
            /// UARTn_TX is tristated whenever the transmitter is idle
            ENABLE = 0x1,
        } = .DISABLE,
        reserved20: u2 = 0,
        /// Skip Parity Error Frames
        SKIPPERRF: u1 = 0x0,
        reserved22: u1 = 0,
        /// Halt DMA Read On Error
        ERRSDMA: enum(u1) {
            /// Framing and parity errors have no effect on DMA requests from the EUSART
            DISABLE = 0x0,
            /// DMA requests from the EUSART are blocked while the PERR or FERR interrupt flags are set
            ENABLE = 0x1,
        } = .DISABLE,
        /// Disable RX On Error
        ERRSRX: enum(u1) {
            /// Framing and parity errors have no effect on receiver
            DISABLE = 0x0,
            /// Framing and parity errors disable the receiver
            ENABLE = 0x1,
        } = .DISABLE,
        /// Disable TX On Error
        ERRSTX: enum(u1) {
            /// Received framing and parity errors have no effect on transmitter
            DISABLE = 0x0,
            /// Received framing and parity errors disable the transmitter
            ENABLE = 0x1,
        } = .DISABLE,
        reserved30: u5 = 0,
        /// Majority Vote Disable
        MVDIS: u1 = 0x0,
        /// AUTOBAUD detection enable
        AUTOBAUDEN: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x0c
    CFG1: mmio.Mmio(packed struct(u32) {
        /// Debug halt
        DBGHALT: enum(u1) {
            /// Continue normal EUSART operation even if core is halted
            DISABLE = 0x0,
            /// If core is halted, receive one frame and then halt reception by deactivating RTS. Next frame reception happens when the core is unhalted during single stepping.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Clear-to-send Invert Enable
        CTSINV: enum(u1) {
            /// The CTS pin is active low
            DISABLE = 0x0,
            /// The CTS pin is active high
            ENABLE = 0x1,
        } = .DISABLE,
        /// Clear-to-send Enable
        CTSEN: enum(u1) {
            /// Ignore CTS
            DISABLE = 0x0,
            /// Stop transmitting when CTS is inactive
            ENABLE = 0x1,
        } = .DISABLE,
        /// Request-to-send Invert Enable
        RTSINV: enum(u1) {
            /// The RTS pin is active low
            DISABLE = 0x0,
            /// The RTS pin is active high
            ENABLE = 0x1,
        } = .DISABLE,
        /// RX Timeout
        RXTIMEOUT: enum(u3) {
            /// DISABLED
            DISABLED = 0x0,
            /// ONEFRAME
            ONEFRAME = 0x1,
            /// TWOFRAMES
            TWOFRAMES = 0x2,
            /// THREEFRAMES
            THREEFRAMES = 0x3,
            /// FOURFRAMES
            FOURFRAMES = 0x4,
            /// FIVEFRAMES
            FIVEFRAMES = 0x5,
            /// SIXFRAMES
            SIXFRAMES = 0x6,
            /// SEVENFRAMES
            SEVENFRAMES = 0x7,
        } = .DISABLED,
        reserved11: u4 = 0,
        /// Start Frame Unblock Receiver
        SFUBRX: u1 = 0x0,
        reserved15: u3 = 0,
        /// PRS RX Enable
        RXPRSEN: u1 = 0x0,
        /// TX FIFO Interrupt Watermark
        TXFIW: enum(u4) {
            /// TXFL status flag and IF are set when the TX FIFO has space for at least one more frame.
            ONEFRAME = 0x0,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least two more frames.
            TWOFRAMES = 0x1,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least three more frames.
            THREEFRAMES = 0x2,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least four more frames.
            FOURFRAMES = 0x3,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least five more frames.
            FIVEFRAMES = 0x4,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least six more frames.
            SIXFRAMES = 0x5,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least seven more frames.
            SEVENFRAMES = 0x6,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least eight more frames.
            EIGHTFRAMES = 0x7,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least nine more frames.
            NINEFRAMES = 0x8,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least ten more frames.
            TENFRAMES = 0x9,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least eleven more frames.
            ELEVENFRAMES = 0xa,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least twelve more frames.
            TWELVEFRAMES = 0xb,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least thriteen more frames.
            THIRTEENFRAMES = 0xc,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least fourteen more frames.
            FOURTEENFRAMES = 0xd,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least fifteen more frames.
            FIFTEENFRAMES = 0xe,
            /// TXFL status flag and IF are set when the TX FIFO has space for at least sixteen more frames.
            SIXTEENFRAMES = 0xf,
        } = .ONEFRAME,
        reserved22: u2 = 0,
        /// Request-to-send RX FIFO Watermark
        RTSRXFW: enum(u4) {
            /// RTS is set if there is space for at least one more frame in the RX FIFO.
            ONEFRAME = 0x0,
            /// RTS is set if there is space for at least two more frames in the RX FIFO.
            TWOFRAMES = 0x1,
            /// RTS is set if there is space for at least three more frames in the RX FIFO.
            THREEFRAMES = 0x2,
            /// RTS is set if there is space for four more frames in the RX FIFO.
            FOURFRAMES = 0x3,
            /// RTS is set if there is space for five more frames in the RX FIFO.
            FIVEFRAMES = 0x4,
            /// RTS is set if there is space for six more frames in the RX FIFO.
            SIXFRAMES = 0x5,
            /// RTS is set if there is space for seven more frames in the RX FIFO.
            SEVENFRAMES = 0x6,
            /// RTS is set if there is space for eight more frames in the RX FIFO.
            EIGHTFRAMES = 0x7,
            /// RTS is set if there is space for nine more frames in the RX FIFO.
            NINEFRAMES = 0x8,
            /// RTS is set if there is space for ten more frames in the RX FIFO.
            TENFRAMES = 0x9,
            /// RTS is set if there is space for eleven more frames in the RX FIFO.
            ELEVENFRAMES = 0xa,
            /// RTS is set if there is space for twelve more frames in the RX FIFO.
            TWELVEFRAMES = 0xb,
            /// RTS is set if there is space for thirteen more frames in the RX FIFO.
            THIRTEENFRAMES = 0xc,
            /// RTS is set if there is space for fourteen more frames in the RX FIFO.
            FOURTEENFRAMES = 0xd,
            /// RTS is set if there is space for fifteen more frames in the RX FIFO.
            FIFTEENFRAMES = 0xe,
            /// RTS is set if there is space for sixteen more frames in the RX FIFO.
            SIXTEENFRAMES = 0xf,
        } = .ONEFRAME,
        reserved27: u1 = 0,
        /// RX FIFO Interrupt Watermark
        RXFIW: enum(u4) {
            /// RXFL status flag and IF are set when the RX FIFO has at least one frame in it.
            ONEFRAME = 0x0,
            /// RXFL status flag and IF are set when the RX FIFO has at least two frames in it.
            TWOFRAMES = 0x1,
            /// RXFL status flag and IF are set when the RX FIFO has at least three frames in it.
            THREEFRAMES = 0x2,
            /// RXFL status flag and IF are set when the RX FIFO has at least four frames in it.
            FOURFRAMES = 0x3,
            /// RXFL status flag and IF are set when the RX FIFO has at least five frames in it.
            FIVEFRAMES = 0x4,
            /// RXFL status flag and IF are set when the RX FIFO has at least six frames in it.
            SIXFRAMES = 0x5,
            /// RXFL status flag and IF are set when the RX FIFO has at least seven frames in it.
            SEVENFRAMES = 0x6,
            /// RXFL status flag and IF are set when the RX FIFO has at least eight frames in it.
            EIGHTFRAMES = 0x7,
            /// RXFL status flag and IF are set when the RX FIFO has at least nine frames in it.
            NINEFRAMES = 0x8,
            /// RXFL status flag and IF are set when the RX FIFO has at least ten frames in it.
            TENFRAMES = 0x9,
            /// RXFL status flag and IF are set when the RX FIFO has at least eleven frames in it.
            ELEVENFRAMES = 0xa,
            /// RXFL status flag and IF are set when the RX FIFO has at least twelve frames in it.
            TWELVEFRAMES = 0xb,
            /// RXFL status flag and IF are set when the RX FIFO has at least thriteen frames in it.
            THIRTEENFRAMES = 0xc,
            /// RXFL status flag and IF are set when the RX FIFO has at least fourteen frames in it.
            FOURTEENFRAMES = 0xd,
            /// RXFL status flag and IF are set when the RX FIFO has at least fifteen frames in it.
            FIFTEENFRAMES = 0xe,
            /// RXFL status flag and IF are set when the RX FIFO has at least sixteen frames in it.
            SIXTEENFRAMES = 0xf,
        } = .ONEFRAME,
        padding: u1 = 0,
    }),
    /// No Description
    /// offset: 0x10
    CFG2: mmio.Mmio(packed struct(u32) {
        /// Main mode
        MASTER: enum(u1) {
            /// Secondary mode
            SLAVE = 0x0,
            /// Main mode
            MASTER = 0x1,
        } = .SLAVE,
        /// Clock Polarity
        CLKPOL: enum(u1) {
            /// The bus clock used in synchronous mode has a low base value
            IDLELOW = 0x0,
            /// The bus clock used in synchronous mode has a high base value
            IDLEHIGH = 0x1,
        } = .IDLELOW,
        /// Clock Edge for Setup/Sample
        CLKPHA: enum(u1) {
            /// Data is sampled on the leading edge and set-up on the trailing edge of the bus clock in synchronous mode
            SAMPLELEADING = 0x0,
            /// Data is set-up on the leading edge and sampled on the trailing edge of the bus clock in synchronous mode
            SAMPLETRAILING = 0x1,
        } = .SAMPLELEADING,
        /// Chip Select Invert
        CSINV: enum(u1) {
            /// Chip select is active low
            AL = 0x0,
            /// Chip select is active high
            AH = 0x1,
        } = .AL,
        /// Always Transmit When RXFIFO Not Full
        AUTOTX: u1 = 0x0,
        /// Automatic Chip Select
        AUTOCS: u1 = 0x1,
        /// PRS CLK Enable
        CLKPRSEN: u1 = 0x0,
        /// Force Load to Shift Register
        FORCELOAD: u1 = 0x0,
        reserved24: u16 = 0,
        /// Sync Clock Div
        SDIV: u8 = 0x0,
    }),
    /// No Description
    /// offset: 0x14
    FRAMECFG: mmio.Mmio(packed struct(u32) {
        /// Data-Bit Mode
        DATABITS: enum(u4) {
            /// Each frame contains 7 data bits
            SEVEN = 0x1,
            /// Each frame contains 8 data bits
            EIGHT = 0x2,
            /// Each frame contains 9 data bits
            NINE = 0x3,
            /// Each frame contains 10 data bits
            TEN = 0x4,
            /// Each frame contains 11 data bits
            ELEVEN = 0x5,
            /// Each frame contains 12 data bits
            TWELVE = 0x6,
            /// Each frame contains 13 data bits
            THIRTEEN = 0x7,
            /// Each frame contains 14 data bits
            FOURTEEN = 0x8,
            /// Each frame contains 15 data bits
            FIFTEEN = 0x9,
            /// Each frame contains 16 data bits
            SIXTEEN = 0xa,
            _,
        } = .EIGHT,
        reserved8: u4 = 0,
        /// Parity-Bit Mode
        PARITY: enum(u2) {
            /// Parity bits are not used
            NONE = 0x0,
            /// Even parity are used. Parity bits are automatically generated and checked by hardware.
            EVEN = 0x2,
            /// Odd parity is used. Parity bits are automatically generated and checked by hardware.
            ODD = 0x3,
            _,
        } = .NONE,
        reserved12: u2 = 0,
        /// Stop-Bit Mode
        STOPBITS: enum(u2) {
            /// The transmitter generates a half stop bit. Stop-bits are not verified by receiver
            HALF = 0x0,
            /// One stop bit is generated and verified
            ONE = 0x1,
            /// The transmitter generates one and a half stop bit. The receiver verifies the first stop bit
            ONEANDAHALF = 0x2,
            /// The transmitter generates two stop bits. The receiver checks the first stop-bit only
            TWO = 0x3,
        } = .ONE,
        padding: u18 = 0,
    }),
    /// No Description
    /// offset: 0x18
    DTXDATCFG: mmio.Mmio(packed struct(u32) {
        /// Default TX DATA
        DTXDAT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    IRHFCFG: mmio.Mmio(packed struct(u32) {
        /// Enable IrDA Module
        IRHFEN: u1 = 0x0,
        /// IrDA TX Pulse Width
        IRHFPW: enum(u2) {
            /// IrDA pulse width is 1/16 for OVS=0 and 1/8 for OVS=1
            ONE = 0x0,
            /// IrDA pulse width is 2/16 for OVS=0 and 2/8 for OVS=1
            TWO = 0x1,
            /// IrDA pulse width is 3/16 for OVS=0 and 3/8 for OVS=1
            THREE = 0x2,
            /// IrDA pulse width is 4/16 for OVS=0 and 4/8 for OVS=1
            FOUR = 0x3,
        } = .ONE,
        /// IrDA RX Filter
        IRHFFILT: enum(u1) {
            /// No filter enabled
            DISABLE = 0x0,
            /// Filter enabled. IrDA pulse must be high for at least 5 consecutive clock cycles to be detected
            ENABLE = 0x1,
        } = .DISABLE,
        padding: u28 = 0,
    }),
    /// offset: 0x20
    reserved32: [4]u8,
    /// No Description
    /// offset: 0x24
    TIMINGCFG: mmio.Mmio(packed struct(u32) {
        /// TX Delay Transmission
        TXDELAY: enum(u2) {
            /// Frames are transmitted immediately.
            NONE = 0x0,
            /// Transmission of new frames is delayed by a single bit period.
            SINGLE = 0x1,
            /// Transmission of new frames is delayed by a two bit periods.
            DOUBLE = 0x2,
            /// Transmission of new frames is delayed by a three bit periods.
            TRIPPLE = 0x3,
        } = .NONE,
        reserved4: u2 = 0,
        /// Chip Select Setup
        CSSETUP: enum(u3) {
            /// CS is asserted half or 1 baud-time before the start of transmission depending on CLKPHASE equal to 1 or 0 respectively
            ZERO = 0x0,
            /// CS is asserted 1 additional baud-time before start of transmission
            ONE = 0x1,
            /// CS is asserted 2 additional baud-times before start of transmission
            TWO = 0x2,
            /// CS is asserted 3 additional baud-times before start of transmission
            THREE = 0x3,
            /// CS is asserted 4 additional baud-times before start of transmission
            FOUR = 0x4,
            /// CS is asserted 5 additional baud-times before start of transmission
            FIVE = 0x5,
            /// CS is asserted 6 additional baud-times before start of transmission
            SIX = 0x6,
            /// CS is asserted 7 additional baud-times before start of transmission
            SEVEN = 0x7,
        } = .ZERO,
        reserved8: u1 = 0,
        /// Chip Select Hold
        CSHOLD: enum(u3) {
            /// CS is de-asserted half or 1 baud-time after the end of transmission depending on CLKPHASE equal to 1 or 0 respectively
            ZERO = 0x0,
            /// CS is de-asserted 1 additional baud-time after the end of transmission
            ONE = 0x1,
            /// CS is de-asserted 2 additional baud-times after the end of transmission
            TWO = 0x2,
            /// CS is de-asserted 3 additional baud-times after the end of transmission
            THREE = 0x3,
            /// CS is de-asserted 4 additional baud-times after the end of transmission
            FOUR = 0x4,
            /// CS is de-asserted 5 additional baud-times after the end of transmission
            FIVE = 0x5,
            /// CS is de-asserted 6 additional baud-times after the end of transmission
            SIX = 0x6,
            /// CS is de-asserted 7 additional baud-times after the end of transmission
            SEVEN = 0x7,
        } = .ZERO,
        reserved12: u1 = 0,
        /// Inter-Character Spacing
        ICS: enum(u3) {
            /// There is no space between charcters
            ZERO = 0x0,
            /// Create a space of 1 baud-times between frames
            ONE = 0x1,
            /// Create a space of 2 baud-times between frames
            TWO = 0x2,
            /// Create a space of 3 baud-times between frames
            THREE = 0x3,
            /// Create a space of 4 baud-times between frames
            FOUR = 0x4,
            /// Create a space of 5 baud-times between frames
            FIVE = 0x5,
            /// Create a space of 6 baud-times between frames
            SIX = 0x6,
            /// Create a space of 7 baud-times between frames
            SEVEN = 0x7,
        } = .ZERO,
        reserved16: u1 = 0,
        /// Setup Window
        SETUPWINDOW: u4 = 0x5,
        padding: u12 = 0,
    }),
    /// No Description
    /// offset: 0x28
    STARTFRAMECFG: mmio.Mmio(packed struct(u32) {
        /// Start Frame
        STARTFRAME: u9 = 0x0,
        padding: u23 = 0,
    }),
    /// No Description
    /// offset: 0x2c
    SIGFRAMECFG: mmio.Mmio(packed struct(u32) {
        /// Signal Frame Value
        SIGFRAME: u9 = 0x0,
        padding: u23 = 0,
    }),
    /// No Description
    /// offset: 0x30
    CLKDIV: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// Fractional Clock Divider
        DIV: u20 = 0x0,
        padding: u9 = 0,
    }),
    /// No Description
    /// offset: 0x34
    TRIGCTRL: mmio.Mmio(packed struct(u32) {
        /// Receive Trigger Enable
        RXTEN: u1 = 0x0,
        /// Transmit Trigger Enable
        TXTEN: u1 = 0x0,
        /// AUTOTX Trigger Enable
        AUTOTXTEN: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x38
    CMD: mmio.Mmio(packed struct(u32) {
        /// Receiver Enable
        RXEN: u1 = 0x0,
        /// Receiver Disable
        RXDIS: u1 = 0x0,
        /// Transmitter Enable
        TXEN: u1 = 0x0,
        /// Transmitter Disable
        TXDIS: u1 = 0x0,
        /// Receiver Block Enable
        RXBLOCKEN: u1 = 0x0,
        /// Receiver Block Disable
        RXBLOCKDIS: u1 = 0x0,
        /// Transmitter Tristate Enable
        TXTRIEN: u1 = 0x0,
        /// Transmitter Tristate Disable
        TXTRIDIS: u1 = 0x0,
        /// Clear TX FIFO
        CLEARTX: u1 = 0x0,
        padding: u23 = 0,
    }),
    /// No Description
    /// offset: 0x3c
    RXDATA: mmio.Mmio(packed struct(u32) {
        /// RX Data and Control bits
        RXDATA: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x40
    RXDATAP: mmio.Mmio(packed struct(u32) {
        /// RX Data Peek
        RXDATAP: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x44
    TXDATA: mmio.Mmio(packed struct(u32) {
        /// TX Data and Control bits
        TXDATA: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x48
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Receiver Enable Status
        RXENS: u1 = 0x0,
        /// Transmitter Enable Status
        TXENS: u1 = 0x0,
        reserved3: u1 = 0,
        /// Block Incoming Data
        RXBLOCK: u1 = 0x0,
        /// Transmitter Tristated
        TXTRI: u1 = 0x0,
        /// TX Complete
        TXC: u1 = 0x0,
        /// TX FIFO Level
        TXFL: u1 = 0x1,
        /// RX FIFO Level
        RXFL: u1 = 0x0,
        /// RX FIFO Full
        RXFULL: u1 = 0x0,
        reserved12: u3 = 0,
        /// RX Idle
        RXIDLE: u1 = 0x1,
        /// TX Idle
        TXIDLE: u1 = 0x1,
        reserved16: u2 = 0,
        /// Valid entries in TX FIFO
        TXFCNT: u5 = 0x0,
        reserved24: u3 = 0,
        /// Auto Baud Rate Detection Completed
        AUTOBAUDDONE: u1 = 0x0,
        /// TX FIFO Clear Busy
        CLEARTXBUSY: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// No Description
    /// offset: 0x4c
    IF: mmio.Mmio(packed struct(u32) {
        /// TX Complete Interrupt Flag
        TXC: u1 = 0x0,
        /// TX FIFO Level Interrupt Flag
        TXFL: u1 = 0x0,
        /// RX FIFO Level Interrupt Flag
        RXFL: u1 = 0x0,
        /// RX FIFO Full Interrupt Flag
        RXFULL: u1 = 0x0,
        /// RX FIFO Overflow Interrupt Flag
        RXOF: u1 = 0x0,
        /// RX FIFO Underflow Interrupt Flag
        RXUF: u1 = 0x0,
        /// TX FIFO Overflow Interrupt Flag
        TXOF: u1 = 0x0,
        /// TX FIFO Underflow Interrupt Flag
        TXUF: u1 = 0x0,
        /// Parity Error Interrupt Flag
        PERR: u1 = 0x0,
        /// Framing Error Interrupt Flag
        FERR: u1 = 0x0,
        /// Multi-Processor Address Frame Interrupt
        MPAF: u1 = 0x0,
        /// Load Error Interrupt Flag
        LOADERR: u1 = 0x0,
        /// Collision Check Fail Interrupt Flag
        CCF: u1 = 0x0,
        /// TX Idle Interrupt Flag
        TXIDLE: u1 = 0x0,
        reserved18: u4 = 0,
        /// Start Frame Interrupt Flag
        STARTF: u1 = 0x0,
        /// Signal Frame Interrupt Flag
        SIGF: u1 = 0x0,
        reserved24: u4 = 0,
        /// Auto Baud Complete Interrupt Flag
        AUTOBAUDDONE: u1 = 0x0,
        /// RX Timeout Interrupt Flag
        RXTO: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// No Description
    /// offset: 0x50
    IEN: mmio.Mmio(packed struct(u32) {
        /// TX Complete Enable
        TXC: u1 = 0x0,
        /// TX FIFO Level Enable
        TXFL: u1 = 0x0,
        /// RX FIFO Level Enable
        RXFL: u1 = 0x0,
        /// RX FIFO Full Enable
        RXFULL: u1 = 0x0,
        /// RX FIFO Overflow Enable
        RXOF: u1 = 0x0,
        /// RX FIFO Underflow Enable
        RXUF: u1 = 0x0,
        /// TX FIFO Overflow Enable
        TXOF: u1 = 0x0,
        /// TX FIFO Underflow Enable
        TXUF: u1 = 0x0,
        /// Parity Error Enable
        PERR: u1 = 0x0,
        /// Framing Error Enable
        FERR: u1 = 0x0,
        /// Multi-Processor Addr Frame Enable
        MPAF: u1 = 0x0,
        /// Load Error Enable
        LOADERR: u1 = 0x0,
        /// Collision Check Fail Enable
        CCF: u1 = 0x0,
        /// TX IDLE Enable
        TXIDLE: u1 = 0x0,
        reserved18: u4 = 0,
        /// Start Frame Enable
        STARTF: u1 = 0x0,
        /// Signal Frame Enable
        SIGF: u1 = 0x0,
        reserved24: u4 = 0,
        /// Auto Baud Complete Enable
        AUTOBAUDDONE: u1 = 0x0,
        /// RX Timeout Enable
        RXTO: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// No Description
    /// offset: 0x54
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// SYNCBUSY for DIV in CLKDIV
        DIV: u1 = 0x0,
        /// SYNCBUSY for RXTEN in TRIGCTRL
        RXTEN: u1 = 0x0,
        /// SYNCBUSY for TXTEN in TRIGCTRL
        TXTEN: u1 = 0x0,
        /// SYNCBUSY for RXEN in CMD
        RXEN: u1 = 0x0,
        /// SYNCBUSY for RXDIS in CMD
        RXDIS: u1 = 0x0,
        /// SYNCBUSY for TXEN in CMD
        TXEN: u1 = 0x0,
        /// SYNCBUSY for TXDIS in CMD
        TXDIS: u1 = 0x0,
        /// SYNCBUSY for RXBLOCKEN in CMD
        RXBLOCKEN: u1 = 0x0,
        /// SYNCBUSY for RXBLOCKDIS in CMD
        RXBLOCKDIS: u1 = 0x0,
        /// SYNCBUSY for TXTRIEN in CMD
        TXTRIEN: u1 = 0x0,
        /// SYNCBUSY in TXTRIDIS in CMD
        TXTRIDIS: u1 = 0x0,
        /// SYNCBUSY for AUTOTXTEN in TRIGCTRL
        AUTOTXTEN: u1 = 0x0,
        padding: u20 = 0,
    }),
};
