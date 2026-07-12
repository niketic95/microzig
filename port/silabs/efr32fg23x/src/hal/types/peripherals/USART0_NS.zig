const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// USART0_NS Registers
pub const USART0_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IPVERSION
        IPVERSION: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// USART Enable
        EN: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CTRL: mmio.Mmio(packed struct(u32) {
        /// USART Synchronous Mode
        SYNC: enum(u1) {
            /// The USART operates in asynchronous mode
            DISABLE = 0x0,
            /// The USART operates in synchronous mode
            ENABLE = 0x1,
        } = .DISABLE,
        /// Loopback Enable
        LOOPBK: enum(u1) {
            /// The receiver is connected to and receives data from U(S)n_RX
            DISABLE = 0x0,
            /// The receiver is connected to and receives data from U(S)n_TX
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
            /// An incoming frame with the 9th bit equal to MPAB will be loaded into the receive buffer regardless of RXBLOCK and will result in the MPAB interrupt flag being set
            ENABLE = 0x1,
        } = .DISABLE,
        /// Multi-Processor Address-Bit
        MPAB: u1 = 0x0,
        /// Oversampling
        OVS: enum(u2) {
            /// Regular UART mode with 16X oversampling in asynchronous mode
            X16 = 0x0,
            /// Double speed with 8X oversampling in asynchronous mode
            X8 = 0x1,
            /// 6X oversampling in asynchronous mode
            X6 = 0x2,
            /// Quadruple speed with 4X oversampling in asynchronous mode
            X4 = 0x3,
        } = .X16,
        reserved8: u1 = 0,
        /// Clock Polarity
        CLKPOL: enum(u1) {
            /// The bus clock used in synchronous mode has a low base value
            IDLELOW = 0x0,
            /// The bus clock used in synchronous mode has a high base value
            IDLEHIGH = 0x1,
        } = .IDLELOW,
        /// Clock Edge For Setup/Sample
        CLKPHA: enum(u1) {
            /// Data is sampled on the leading edge and set-up on the trailing edge of the bus clock in synchronous mode
            SAMPLELEADING = 0x0,
            /// Data is set-up on the leading edge and sampled on the trailing edge of the bus clock in synchronous mode
            SAMPLETRAILING = 0x1,
        } = .SAMPLELEADING,
        /// Most Significant Bit First
        MSBF: enum(u1) {
            /// Data is sent with the least significant bit first
            DISABLE = 0x0,
            /// Data is sent with the most significant bit first
            ENABLE = 0x1,
        } = .DISABLE,
        /// Action On Chip Select In Main Mode
        CSMA: enum(u1) {
            /// No action taken
            NOACTION = 0x0,
            /// Go to secondary mode
            GOTOSLAVEMODE = 0x1,
        } = .NOACTION,
        /// TX Buffer Interrupt Level
        TXBIL: enum(u1) {
            /// TXBL and the TXBL interrupt flag are set when the transmit buffer becomes empty. TXBL is cleared when the buffer becomes nonempty.
            EMPTY = 0x0,
            /// TXBL and TXBLIF are set when the transmit buffer goes from full to half-full or empty. TXBL is cleared when the buffer becomes full.
            HALFFULL = 0x1,
        } = .EMPTY,
        /// Receiver Input Invert
        RXINV: enum(u1) {
            /// Input is passed directly to the receiver
            DISABLE = 0x0,
            /// Input is inverted before it is passed to the receiver
            ENABLE = 0x1,
        } = .DISABLE,
        /// Transmitter output Invert
        TXINV: enum(u1) {
            /// Output from the transmitter is passed unchanged to U(S)n_TX
            DISABLE = 0x0,
            /// Output from the transmitter is inverted before it is passed to U(S)n_TX
            ENABLE = 0x1,
        } = .DISABLE,
        /// Chip Select Invert
        CSINV: enum(u1) {
            /// Chip select is active low
            DISABLE = 0x0,
            /// Chip select is active high
            ENABLE = 0x1,
        } = .DISABLE,
        /// Automatic Chip Select
        AUTOCS: u1 = 0x0,
        /// Automatic TX Tristate
        AUTOTRI: enum(u1) {
            /// The output on U(S)n_TX when the transmitter is idle is defined by TXINV
            DISABLE = 0x0,
            /// U(S)n_TX is tristated whenever the transmitter is idle
            ENABLE = 0x1,
        } = .DISABLE,
        /// SmartCard Mode
        SCMODE: u1 = 0x0,
        /// SmartCard Retransmit
        SCRETRANS: u1 = 0x0,
        /// Skip Parity Error Frames
        SKIPPERRF: u1 = 0x0,
        /// Bit 8 Default Value
        BIT8DV: u1 = 0x0,
        /// Halt DMA On Error
        ERRSDMA: enum(u1) {
            /// Framing and parity errors have no effect on DMA requests from the USART
            DISABLE = 0x0,
            /// DMA requests from the USART are blocked while the PERR or FERR interrupt flags are set
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
        /// Synchronous Secondary Setup Early
        SSSEARLY: u1 = 0x0,
        reserved28: u2 = 0,
        /// Byteswap In Double Accesses
        BYTESWAP: enum(u1) {
            /// Normal byte order
            DISABLE = 0x0,
            /// Byte order swapped
            ENABLE = 0x1,
        } = .DISABLE,
        /// Always Transmit When RX Not Full
        AUTOTX: u1 = 0x0,
        /// Majority Vote Disable
        MVDIS: u1 = 0x0,
        /// Synchronous Main Sample Delay
        SMSDELAY: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x0c
    FRAME: mmio.Mmio(packed struct(u32) {
        /// Data-Bit Mode
        DATABITS: enum(u4) {
            /// Each frame contains 4 data bits
            FOUR = 0x1,
            /// Each frame contains 5 data bits
            FIVE = 0x2,
            /// Each frame contains 6 data bits
            SIX = 0x3,
            /// Each frame contains 7 data bits
            SEVEN = 0x4,
            /// Each frame contains 8 data bits
            EIGHT = 0x5,
            /// Each frame contains 9 data bits
            NINE = 0x6,
            /// Each frame contains 10 data bits
            TEN = 0x7,
            /// Each frame contains 11 data bits
            ELEVEN = 0x8,
            /// Each frame contains 12 data bits
            TWELVE = 0x9,
            /// Each frame contains 13 data bits
            THIRTEEN = 0xa,
            /// Each frame contains 14 data bits
            FOURTEEN = 0xb,
            /// Each frame contains 15 data bits
            FIFTEEN = 0xc,
            /// Each frame contains 16 data bits
            SIXTEEN = 0xd,
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
    /// offset: 0x10
    TRIGCTRL: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// Receive Trigger Enable
        RXTEN: u1 = 0x0,
        /// Transmit Trigger Enable
        TXTEN: u1 = 0x0,
        /// AUTOTX Trigger Enable
        AUTOTXTEN: u1 = 0x0,
        /// Enable Transmit Trigger after RX End of
        TXARX0EN: u1 = 0x0,
        /// Enable Transmit Trigger after RX End of
        TXARX1EN: u1 = 0x0,
        /// Enable Transmit Trigger after RX End of
        TXARX2EN: u1 = 0x0,
        /// Enable Receive Trigger after TX end of f
        RXATX0EN: u1 = 0x0,
        /// Enable Receive Trigger after TX end of f
        RXATX1EN: u1 = 0x0,
        /// Enable Receive Trigger after TX end of f
        RXATX2EN: u1 = 0x0,
        padding: u19 = 0,
    }),
    /// No Description
    /// offset: 0x14
    CMD: mmio.Mmio(packed struct(u32) {
        /// Receiver Enable
        RXEN: u1 = 0x0,
        /// Receiver Disable
        RXDIS: u1 = 0x0,
        /// Transmitter Enable
        TXEN: u1 = 0x0,
        /// Transmitter Disable
        TXDIS: u1 = 0x0,
        /// Main Mode Enable
        MASTEREN: u1 = 0x0,
        /// Main Mode Disable
        MASTERDIS: u1 = 0x0,
        /// Receiver Block Enable
        RXBLOCKEN: u1 = 0x0,
        /// Receiver Block Disable
        RXBLOCKDIS: u1 = 0x0,
        /// Transmitter Tristate Enable
        TXTRIEN: u1 = 0x0,
        /// Transmitter Tristate Disable
        TXTRIDIS: u1 = 0x0,
        /// Clear TX
        CLEARTX: u1 = 0x0,
        /// Clear RX
        CLEARRX: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x18
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Receiver Enable Status
        RXENS: u1 = 0x0,
        /// Transmitter Enable Status
        TXENS: u1 = 0x0,
        /// SPI Main Mode
        MASTER: u1 = 0x0,
        /// Block Incoming Data
        RXBLOCK: u1 = 0x0,
        /// Transmitter Tristated
        TXTRI: u1 = 0x0,
        /// TX Complete
        TXC: u1 = 0x0,
        /// TX Buffer Level
        TXBL: u1 = 0x1,
        /// RX Data Valid
        RXDATAV: u1 = 0x0,
        /// RX FIFO Full
        RXFULL: u1 = 0x0,
        /// TX Buffer Expects Double Right Data
        TXBDRIGHT: u1 = 0x0,
        /// TX Buffer Expects Single Right Data
        TXBSRIGHT: u1 = 0x0,
        /// RX Data Right
        RXDATAVRIGHT: u1 = 0x0,
        /// RX Full of Right Data
        RXFULLRIGHT: u1 = 0x0,
        /// TX Idle
        TXIDLE: u1 = 0x1,
        /// The USART Timer restarted itself
        TIMERRESTARTED: u1 = 0x0,
        reserved16: u1 = 0,
        /// TX Buffer Count
        TXBUFCNT: u2 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    CLKDIV: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// Fractional Clock Divider
        DIV: u20 = 0x0,
        reserved31: u8 = 0,
        /// AUTOBAUD detection enable
        AUTOBAUDEN: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x20
    RXDATAX: mmio.Mmio(packed struct(u32) {
        /// RX Data
        RXDATA: u9 = 0x0,
        reserved14: u5 = 0,
        /// Data Parity Error
        PERR: u1 = 0x0,
        /// Data Framing Error
        FERR: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x24
    RXDATA: mmio.Mmio(packed struct(u32) {
        /// RX Data
        RXDATA: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x28
    RXDOUBLEX: mmio.Mmio(packed struct(u32) {
        /// RX Data 0
        RXDATA0: u9 = 0x0,
        reserved14: u5 = 0,
        /// Data Parity Error 0
        PERR0: u1 = 0x0,
        /// Data Framing Error 0
        FERR0: u1 = 0x0,
        /// RX Data 1
        RXDATA1: u9 = 0x0,
        reserved30: u5 = 0,
        /// Data Parity Error 1
        PERR1: u1 = 0x0,
        /// Data Framing Error 1
        FERR1: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x2c
    RXDOUBLE: mmio.Mmio(packed struct(u32) {
        /// RX Data 0
        RXDATA0: u8 = 0x0,
        /// RX Data 1
        RXDATA1: u8 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x30
    RXDATAXP: mmio.Mmio(packed struct(u32) {
        /// RX Data Peek
        RXDATAP: u9 = 0x0,
        reserved14: u5 = 0,
        /// Data Parity Error Peek
        PERRP: u1 = 0x0,
        /// Data Framing Error Peek
        FERRP: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x34
    RXDOUBLEXP: mmio.Mmio(packed struct(u32) {
        /// RX Data 0 Peek
        RXDATAP0: u9 = 0x0,
        reserved14: u5 = 0,
        /// Data Parity Error 0 Peek
        PERRP0: u1 = 0x0,
        /// Data Framing Error 0 Peek
        FERRP0: u1 = 0x0,
        /// RX Data 1 Peek
        RXDATAP1: u9 = 0x0,
        reserved30: u5 = 0,
        /// Data Parity Error 1 Peek
        PERRP1: u1 = 0x0,
        /// Data Framing Error 1 Peek
        FERRP1: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x38
    TXDATAX: mmio.Mmio(packed struct(u32) {
        /// TX Data
        TXDATAX: u9 = 0x0,
        reserved11: u2 = 0,
        /// Unblock RX After Transmission
        UBRXAT: u1 = 0x0,
        /// Set TXTRI After Transmission
        TXTRIAT: u1 = 0x0,
        /// Transmit Data As Break
        TXBREAK: u1 = 0x0,
        /// Clear TXEN After Transmission
        TXDISAT: u1 = 0x0,
        /// Enable RX After Transmission
        RXENAT: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x3c
    TXDATA: mmio.Mmio(packed struct(u32) {
        /// TX Data
        TXDATA: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x40
    TXDOUBLEX: mmio.Mmio(packed struct(u32) {
        /// TX Data
        TXDATA0: u9 = 0x0,
        reserved11: u2 = 0,
        /// Unblock RX After Transmission
        UBRXAT0: u1 = 0x0,
        /// Set TXTRI After Transmission
        TXTRIAT0: u1 = 0x0,
        /// Transmit Data As Break
        TXBREAK0: u1 = 0x0,
        /// Clear TXEN After Transmission
        TXDISAT0: u1 = 0x0,
        /// Enable RX After Transmission
        RXENAT0: u1 = 0x0,
        /// TX Data
        TXDATA1: u9 = 0x0,
        reserved27: u2 = 0,
        /// Unblock RX After Transmission
        UBRXAT1: u1 = 0x0,
        /// Set TXTRI After Transmission
        TXTRIAT1: u1 = 0x0,
        /// Transmit Data As Break
        TXBREAK1: u1 = 0x0,
        /// Clear TXEN After Transmission
        TXDISAT1: u1 = 0x0,
        /// Enable RX After Transmission
        RXENAT1: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x44
    TXDOUBLE: mmio.Mmio(packed struct(u32) {
        /// TX Data
        TXDATA0: u8 = 0x0,
        /// TX Data
        TXDATA1: u8 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x48
    IF: mmio.Mmio(packed struct(u32) {
        /// TX Complete Interrupt Flag
        TXC: u1 = 0x0,
        /// TX Buffer Level Interrupt Flag
        TXBL: u1 = 0x1,
        /// RX Data Valid Interrupt Flag
        RXDATAV: u1 = 0x0,
        /// RX Buffer Full Interrupt Flag
        RXFULL: u1 = 0x0,
        /// RX Overflow Interrupt Flag
        RXOF: u1 = 0x0,
        /// RX Underflow Interrupt Flag
        RXUF: u1 = 0x0,
        /// TX Overflow Interrupt Flag
        TXOF: u1 = 0x0,
        /// TX Underflow Interrupt Flag
        TXUF: u1 = 0x0,
        /// Parity Error Interrupt Flag
        PERR: u1 = 0x0,
        /// Framing Error Interrupt Flag
        FERR: u1 = 0x0,
        /// Multi-Processor Address Frame Interrupt
        MPAF: u1 = 0x0,
        /// Chip-Select In Main Mode Interrupt Flag
        SSM: u1 = 0x0,
        /// Collision Check Fail Interrupt Flag
        CCF: u1 = 0x0,
        /// TX Idle Interrupt Flag
        TXIDLE: u1 = 0x0,
        /// Timer comparator 0 Interrupt Flag
        TCMP0: u1 = 0x0,
        /// Timer comparator 1 Interrupt Flag
        TCMP1: u1 = 0x0,
        /// Timer comparator 2 Interrupt Flag
        TCMP2: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// No Description
    /// offset: 0x4c
    IEN: mmio.Mmio(packed struct(u32) {
        /// TX Complete Interrupt Enable
        TXC: u1 = 0x0,
        /// TX Buffer Level Interrupt Enable
        TXBL: u1 = 0x0,
        /// RX Data Valid Interrupt Enable
        RXDATAV: u1 = 0x0,
        /// RX Buffer Full Interrupt Enable
        RXFULL: u1 = 0x0,
        /// RX Overflow Interrupt Enable
        RXOF: u1 = 0x0,
        /// RX Underflow Interrupt Enable
        RXUF: u1 = 0x0,
        /// TX Overflow Interrupt Enable
        TXOF: u1 = 0x0,
        /// TX Underflow Interrupt Enable
        TXUF: u1 = 0x0,
        /// Parity Error Interrupt Enable
        PERR: u1 = 0x0,
        /// Framing Error Interrupt Enable
        FERR: u1 = 0x0,
        /// Multi-Processor Address Frame Interrupt
        MPAF: u1 = 0x0,
        /// Chip-Select In Main Mode Interrupt Flag
        SSM: u1 = 0x0,
        /// Collision Check Fail Interrupt Enable
        CCF: u1 = 0x0,
        /// TX Idle Interrupt Enable
        TXIDLE: u1 = 0x0,
        /// Timer comparator 0 Interrupt Enable
        TCMP0: u1 = 0x0,
        /// Timer comparator 1 Interrupt Enable
        TCMP1: u1 = 0x0,
        /// Timer comparator 2 Interrupt Enable
        TCMP2: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// No Description
    /// offset: 0x50
    IRCTRL: mmio.Mmio(packed struct(u32) {
        /// Enable IrDA Module
        IREN: u1 = 0x0,
        /// IrDA TX Pulse Width
        IRPW: enum(u2) {
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
        IRFILT: enum(u1) {
            /// No filter enabled
            DISABLE = 0x0,
            /// Filter enabled. IrDA pulse must be high for at least 5 consecutive clock cycles to be detected
            ENABLE = 0x1,
        } = .DISABLE,
        padding: u28 = 0,
    }),
    /// No Description
    /// offset: 0x54
    I2SCTRL: mmio.Mmio(packed struct(u32) {
        /// Enable I2S Mode
        EN: u1 = 0x0,
        /// Stero or Mono
        MONO: u1 = 0x0,
        /// Justification of I2S Data
        JUSTIFY: enum(u1) {
            /// Data is left-justified
            LEFT = 0x0,
            /// Data is right-justified
            RIGHT = 0x1,
        } = .LEFT,
        /// Separate DMA Request For Left/Right Data
        DMASPLIT: u1 = 0x0,
        /// Delay on I2S data
        DELAY: u1 = 0x0,
        reserved8: u3 = 0,
        /// I2S Word Format
        FORMAT: enum(u3) {
            /// 32-bit word, 32-bit data
            W32D32 = 0x0,
            /// 32-bit word, 32-bit data with 8 lsb masked
            W32D24M = 0x1,
            /// 32-bit word, 24-bit data
            W32D24 = 0x2,
            /// 32-bit word, 16-bit data
            W32D16 = 0x3,
            /// 32-bit word, 8-bit data
            W32D8 = 0x4,
            /// 16-bit word, 16-bit data
            W16D16 = 0x5,
            /// 16-bit word, 8-bit data
            W16D8 = 0x6,
            /// 8-bit word, 8-bit data
            W8D8 = 0x7,
        } = .W32D32,
        padding: u21 = 0,
    }),
    /// No Description
    /// offset: 0x58
    TIMING: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// TX frame start delay
        TXDELAY: enum(u3) {
            /// Disable - TXDELAY in USARTn_CTRL can be used for legacy
            DISABLE = 0x0,
            /// Start of transmission is delayed for 1 baud-times
            ONE = 0x1,
            /// Start of transmission is delayed for 2 baud-times
            TWO = 0x2,
            /// Start of transmission is delayed for 3 baud-times
            THREE = 0x3,
            /// Start of transmission is delayed for 7 baud-times
            SEVEN = 0x4,
            /// Start of transmission is delayed for TCMPVAL0 baud-times
            TCMP0 = 0x5,
            /// Start of transmission is delayed for TCMPVAL1 baud-times
            TCMP1 = 0x6,
            /// Start of transmission is delayed for TCMPVAL2 baud-times
            TCMP2 = 0x7,
        } = .DISABLE,
        reserved20: u1 = 0,
        /// Chip Select Setup
        CSSETUP: enum(u3) {
            /// CS is not asserted before start of transmission
            ZERO = 0x0,
            /// CS is asserted for 1 baud-times before start of transmission
            ONE = 0x1,
            /// CS is asserted for 2 baud-times before start of transmission
            TWO = 0x2,
            /// CS is asserted for 3 baud-times before start of transmission
            THREE = 0x3,
            /// CS is asserted for 7 baud-times before start of transmission
            SEVEN = 0x4,
            /// CS is asserted before the start of transmission for TCMPVAL0 baud-times
            TCMP0 = 0x5,
            /// CS is asserted before the start of transmission for TCMPVAL1 baud-times
            TCMP1 = 0x6,
            /// CS is asserted before the start of transmission for TCMPVAL2 baud-times
            TCMP2 = 0x7,
        } = .ZERO,
        reserved24: u1 = 0,
        /// Inter-character spacing
        ICS: enum(u3) {
            /// There is no space between charcters
            ZERO = 0x0,
            /// Create a space of 1 baud-times before start of transmission
            ONE = 0x1,
            /// Create a space of 2 baud-times before start of transmission
            TWO = 0x2,
            /// Create a space of 3 baud-times before start of transmission
            THREE = 0x3,
            /// Create a space of 7 baud-times before start of transmission
            SEVEN = 0x4,
            /// Create a space of before the start of transmission for TCMPVAL0 baud-times
            TCMP0 = 0x5,
            /// Create a space of before the start of transmission for TCMPVAL1 baud-times
            TCMP1 = 0x6,
            /// Create a space of before the start of transmission for TCMPVAL2 baud-times
            TCMP2 = 0x7,
        } = .ZERO,
        reserved28: u1 = 0,
        /// Chip Select Hold
        CSHOLD: enum(u3) {
            /// Disable CS being asserted after the end of transmission
            ZERO = 0x0,
            /// CS is asserted for 1 baud-times after the end of transmission
            ONE = 0x1,
            /// CS is asserted for 2 baud-times after the end of transmission
            TWO = 0x2,
            /// CS is asserted for 3 baud-times after the end of transmission
            THREE = 0x3,
            /// CS is asserted for 7 baud-times after the end of transmission
            SEVEN = 0x4,
            /// CS is asserted after the end of transmission for TCMPVAL0 baud-times
            TCMP0 = 0x5,
            /// CS is asserted after the end of transmission for TCMPVAL1 baud-times
            TCMP1 = 0x6,
            /// CS is asserted after the end of transmission for TCMPVAL2 baud-times
            TCMP2 = 0x7,
        } = .ZERO,
        padding: u1 = 0,
    }),
    /// No Description
    /// offset: 0x5c
    CTRLX: mmio.Mmio(packed struct(u32) {
        /// Debug halt
        DBGHALT: enum(u1) {
            /// Continue to transmit until TX buffer is empty
            DISABLE = 0x0,
            /// Negate RTS to stop link partner's transmission during debug HALT. NOTE** The core clock should be equal to or faster than the peripheral clock; otherwise, each single step could transmit multiple frames instead of just transmitting one frame.
            ENABLE = 0x1,
        } = .DISABLE,
        /// CTS Pin Inversion
        CTSINV: enum(u1) {
            /// The USn_CTS pin is low true
            DISABLE = 0x0,
            /// The USn_CTS pin is high true
            ENABLE = 0x1,
        } = .DISABLE,
        /// CTS Function enabled
        CTSEN: enum(u1) {
            /// Ingore CTS
            DISABLE = 0x0,
            /// Stop transmitting when CTS is negated
            ENABLE = 0x1,
        } = .DISABLE,
        /// RTS Pin Inversion
        RTSINV: enum(u1) {
            /// The USn_RTS pin is low true
            DISABLE = 0x0,
            /// The USn_RTS pin is high true
            ENABLE = 0x1,
        } = .DISABLE,
        reserved7: u3 = 0,
        /// PRS RX Enable
        RXPRSEN: u1 = 0x0,
        reserved15: u7 = 0,
        /// PRS CLK Enable
        CLKPRSEN: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x60
    TIMECMP0: mmio.Mmio(packed struct(u32) {
        /// Timer comparator 0.
        TCMPVAL: u8 = 0x0,
        reserved16: u8 = 0,
        /// Timer start source
        TSTART: enum(u3) {
            /// Comparator 0 is disabled
            DISABLE = 0x0,
            /// Comparator 0 and timer are started at TX end of frame
            TXEOF = 0x1,
            /// Comparator 0 and timer are started at TX Complete
            TXC = 0x2,
            /// Comparator 0 and timer are started at RX going going Active (default: low)
            RXACT = 0x3,
            /// Comparator 0 and timer are started at RX end of frame
            RXEOF = 0x4,
            _,
        } = .DISABLE,
        reserved20: u1 = 0,
        /// Source used to disable comparator 0
        TSTOP: enum(u3) {
            /// Comparator 0 is disabled when the counter equals TCMPVAL and triggers a TCMP0 event
            TCMP0 = 0x0,
            /// Comparator 0 is disabled at TX start TX Engine
            TXST = 0x1,
            /// Comparator 0 is disabled on RX going going Active (default: low)
            RXACT = 0x2,
            /// Comparator 0 is disabled on RX going Inactive
            RXACTN = 0x3,
            _,
        } = .TCMP0,
        reserved24: u1 = 0,
        /// Restart Timer on TCMP0
        RESTARTEN: enum(u1) {
            /// Disable the timer restarting on TCMP0
            DISABLE = 0x0,
            /// Enable the timer restarting on TCMP0
            ENABLE = 0x1,
        } = .DISABLE,
        padding: u7 = 0,
    }),
    /// No Description
    /// offset: 0x64
    TIMECMP1: mmio.Mmio(packed struct(u32) {
        /// Timer comparator 1.
        TCMPVAL: u8 = 0x0,
        reserved16: u8 = 0,
        /// Timer start source
        TSTART: enum(u3) {
            /// Comparator 1 is disabled
            DISABLE = 0x0,
            /// Comparator 1 and timer are started at TX end of frame
            TXEOF = 0x1,
            /// Comparator 1 and timer are started at TX Complete
            TXC = 0x2,
            /// Comparator 1 and timer are started at RX going going Active (default: low)
            RXACT = 0x3,
            /// Comparator 1 and timer are started at RX end of frame
            RXEOF = 0x4,
            _,
        } = .DISABLE,
        reserved20: u1 = 0,
        /// Source used to disable comparator 1
        TSTOP: enum(u3) {
            /// Comparator 1 is disabled when the counter equals TCMPVAL and triggers a TCMP1 event
            TCMP1 = 0x0,
            /// Comparator 1 is disabled at TX start TX Engine
            TXST = 0x1,
            /// Comparator 1 is disabled on RX going going Active (default: low)
            RXACT = 0x2,
            /// Comparator 1 is disabled on RX going Inactive
            RXACTN = 0x3,
            _,
        } = .TCMP1,
        reserved24: u1 = 0,
        /// Restart Timer on TCMP1
        RESTARTEN: enum(u1) {
            /// Disable the timer restarting on TCMP1
            DISABLE = 0x0,
            /// Enable the timer restarting on TCMP1
            ENABLE = 0x1,
        } = .DISABLE,
        padding: u7 = 0,
    }),
    /// No Description
    /// offset: 0x68
    TIMECMP2: mmio.Mmio(packed struct(u32) {
        /// Timer comparator 2.
        TCMPVAL: u8 = 0x0,
        reserved16: u8 = 0,
        /// Timer start source
        TSTART: enum(u3) {
            /// Comparator 2 is disabled
            DISABLE = 0x0,
            /// Comparator 2 and timer are started at TX end of frame
            TXEOF = 0x1,
            /// Comparator 2 and timer are started at TX Complete
            TXC = 0x2,
            /// Comparator 2 and timer are started at RX going going Active (default: low)
            RXACT = 0x3,
            /// Comparator 2 and timer are started at RX end of frame
            RXEOF = 0x4,
            _,
        } = .DISABLE,
        reserved20: u1 = 0,
        /// Source used to disable comparator 2
        TSTOP: enum(u3) {
            /// Comparator 2 is disabled when the counter equals TCMPVAL and triggers a TCMP2 event
            TCMP2 = 0x0,
            /// Comparator 2 is disabled at TX start TX Engine
            TXST = 0x1,
            /// Comparator 2 is disabled on RX going going Active (default: low)
            RXACT = 0x2,
            /// Comparator 2 is disabled on RX going Inactive
            RXACTN = 0x3,
            _,
        } = .TCMP2,
        reserved24: u1 = 0,
        /// Restart Timer on TCMP2
        RESTARTEN: enum(u1) {
            /// Disable the timer restarting on TCMP2
            DISABLE = 0x0,
            /// Enable the timer restarting on TCMP2
            ENABLE = 0x1,
        } = .DISABLE,
        padding: u7 = 0,
    }),
};
