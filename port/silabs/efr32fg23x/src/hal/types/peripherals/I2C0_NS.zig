const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// I2C0_NS Registers
pub const I2C0_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP version ID
        IPVERSION: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// module enable
        EN: enum(u1) {
            /// Disable Peripheral Clock
            DISABLE = 0x0,
            /// Enable Peripheral Clock
            ENABLE = 0x1,
        } = .DISABLE,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Soft Reset the internal state registers
        CORERST: enum(u1) {
            /// No change to internal state registers
            DISABLE = 0x0,
            /// Reset the internal state registers
            ENABLE = 0x1,
        } = .DISABLE,
        /// Addressable as Follower
        SLAVE: enum(u1) {
            /// All addresses will be responded to with a NACK
            DISABLE = 0x0,
            /// Addresses matching the programmed follower address or the general call address (if enabled) require a response from software. Other addresses are automatically responded to with a NACK.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Automatic Acknowledge
        AUTOACK: enum(u1) {
            /// Software must give one ACK command for each ACK transmitted on the I2C bus.
            DISABLE = 0x0,
            /// Addresses that are not automatically NACK'ed, and all data is automatically acknowledged.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Automatic STOP when Empty
        AUTOSE: enum(u1) {
            /// A stop must be sent manually when no more data is to be transmitted.
            DISABLE = 0x0,
            /// The leader automatically sends a STOP when no more data is available for transmission.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Automatic STOP on NACK
        AUTOSN: enum(u1) {
            /// Stop is not automatically sent if a NACK is received from a follower.
            DISABLE = 0x0,
            /// The leader automatically sends a STOP if a NACK is received from a follower.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Arbitration Disable
        ARBDIS: enum(u1) {
            /// When a device loses arbitration, the ARBIF interrupt flag is set and the bus is released.
            DISABLE = 0x0,
            /// When a device loses arbitration, the ARBIF interrupt flag is set, but communication proceeds.
            ENABLE = 0x1,
        } = .DISABLE,
        /// General Call Address Match Enable
        GCAMEN: enum(u1) {
            /// General call address will be NACK'ed if it is not included by the follower address and address mask.
            DISABLE = 0x0,
            /// When a general call address is received, a software response is required
            ENABLE = 0x1,
        } = .DISABLE,
        /// TX Buffer Interrupt Level
        TXBIL: enum(u1) {
            /// TXBL status and the TXBL interrupt flag are set when the transmit buffer becomes empty. TXBL is cleared when the buffer becomes nonempty.
            EMPTY = 0x0,
            /// TXBL status and the TXBL interrupt flag are set when the transmit buffer goes from full to half-full or empty. TXBL is cleared when the buffer becomes full
            HALF_FULL = 0x1,
        } = .EMPTY,
        /// Clock Low High Ratio
        CLHR: enum(u2) {
            /// Nlow=4 and Nhigh=4, and the Nlow:Nhigh ratio is 4:4
            STANDARD = 0x0,
            /// Nlow=6 and Nhigh=3, and the Nlow:Nhigh ratio is 6:3
            ASYMMETRIC = 0x1,
            /// Nlow=11 and Nhigh=6, and the Nlow:Nhigh ratio is 11:6
            FAST = 0x2,
            _,
        } = .STANDARD,
        reserved12: u2 = 0,
        /// Bus Idle Timeout
        BITO: enum(u2) {
            /// Timeout disabled
            OFF = 0x0,
            /// Timeout after 40 prescaled clock cycles. In standard mode at 100 kHz, this results in a 50us timeout.
            I2C40PCC = 0x1,
            /// Timeout after 80 prescaled clock cycles. In standard mode at 100 kHz, this results in a 100us timeout.
            I2C80PCC = 0x2,
            /// Timeout after 160 prescaled clock cycles. In standard mode at 100 kHz, this results in a 200us timeout.
            I2C160PCC = 0x3,
        } = .OFF,
        reserved15: u1 = 0,
        /// Go Idle on Bus Idle Timeout
        GIBITO: enum(u1) {
            /// A bus idle timeout has no effect on the bus state.
            DISABLE = 0x0,
            /// A bus idle timeout tells the I2C module that the bus is idle, allowing new transfers to be initiated.
            ENABLE = 0x1,
        } = .DISABLE,
        /// Clock Low Timeout
        CLTO: enum(u3) {
            /// Timeout disabled
            OFF = 0x0,
            /// Timeout after 40 prescaled clock cycles. In standard mode at 100 kHz, this results in a 50us timeout.
            I2C40PCC = 0x1,
            /// Timeout after 80 prescaled clock cycles. In standard mode at 100 kHz, this results in a 100us timeout.
            I2C80PCC = 0x2,
            /// Timeout after 160 prescaled clock cycles. In standard mode at 100 kHz, this results in a 200us timeout.
            I2C160PCC = 0x3,
            /// Timeout after 320 prescaled clock cycles. In standard mode at 100 kHz, this results in a 400us timeout.
            I2C320PCC = 0x4,
            /// Timeout after 1024 prescaled clock cycles. In standard mode at 100 kHz, this results in a 1280us timeout.
            I2C1024PCC = 0x5,
            _,
        } = .OFF,
        reserved20: u1 = 0,
        /// SCL Monitor Enable
        SCLMONEN: enum(u1) {
            /// Disable SCL monitor
            DISABLE = 0x0,
            /// Enable SCL monitor
            ENABLE = 0x1,
        } = .DISABLE,
        /// SDA Monitor Enable
        SDAMONEN: enum(u1) {
            /// Disable SDA Monitor
            DISABLE = 0x0,
            /// Enable SDA Monitor
            ENABLE = 0x1,
        } = .DISABLE,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    CMD: mmio.Mmio(packed struct(u32) {
        /// Send start condition
        START: u1 = 0x0,
        /// Send stop condition
        STOP: u1 = 0x0,
        /// Send ACK
        ACK: u1 = 0x0,
        /// Send NACK
        NACK: u1 = 0x0,
        /// Continue transmission
        CONT: u1 = 0x0,
        /// Abort transmission
        ABORT: u1 = 0x0,
        /// Clear TX
        CLEARTX: u1 = 0x0,
        /// Clear Pending Commands
        CLEARPC: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x10
    STATE: mmio.Mmio(packed struct(u32) {
        /// Bus Busy
        BUSY: u1 = 0x1,
        /// Leader
        MASTER: u1 = 0x0,
        /// Transmitter
        TRANSMITTER: u1 = 0x0,
        /// Nack Received
        NACKED: u1 = 0x0,
        /// Bus Held
        BUSHOLD: u1 = 0x0,
        /// Transmission State
        STATE: enum(u3) {
            /// No transmission is being performed.
            IDLE = 0x0,
            /// Waiting for idle. Will send a start condition as soon as the bus is idle.
            WAIT = 0x1,
            /// Start transmit phase
            START = 0x2,
            /// Address transmit or receive phase
            ADDR = 0x3,
            /// Address ack/nack transmit or receive phase
            ADDRACK = 0x4,
            /// Data transmit or receive phase
            DATA = 0x5,
            /// Data ack/nack transmit or receive phase
            DATAACK = 0x6,
            _,
        } = .IDLE,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x14
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Pending START
        PSTART: u1 = 0x0,
        /// Pending STOP
        PSTOP: u1 = 0x0,
        /// Pending ACK
        PACK: u1 = 0x0,
        /// Pending NACK
        PNACK: u1 = 0x0,
        /// Pending continue
        PCONT: u1 = 0x0,
        /// Pending abort
        PABORT: u1 = 0x0,
        /// TX Complete
        TXC: u1 = 0x0,
        /// TX Buffer Level
        TXBL: u1 = 0x1,
        /// RX Data Valid
        RXDATAV: u1 = 0x0,
        /// RX FIFO Full
        RXFULL: u1 = 0x0,
        /// TX Buffer Count
        TXBUFCNT: u2 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x18
    CLKDIV: mmio.Mmio(packed struct(u32) {
        /// Clock Divider
        DIV: u9 = 0x0,
        padding: u23 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    SADDR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Follower address
        ADDR: u7 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x20
    SADDRMASK: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Follower Address Mask
        SADDRMASK: u7 = 0x0,
        padding: u24 = 0,
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
    RXDOUBLE: mmio.Mmio(packed struct(u32) {
        /// RX Data 0
        RXDATA0: u8 = 0x0,
        /// RX Data 1
        RXDATA1: u8 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x2c
    RXDATAP: mmio.Mmio(packed struct(u32) {
        /// RX Data Peek
        RXDATAP: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x30
    RXDOUBLEP: mmio.Mmio(packed struct(u32) {
        /// RX Data 0 Peek
        RXDATAP0: u8 = 0x0,
        /// RX Data 1 Peek
        RXDATAP1: u8 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x34
    TXDATA: mmio.Mmio(packed struct(u32) {
        /// TX Data
        TXDATA: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x38
    TXDOUBLE: mmio.Mmio(packed struct(u32) {
        /// TX Data
        TXDATA0: u8 = 0x0,
        /// TX Data
        TXDATA1: u8 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x3c
    IF: mmio.Mmio(packed struct(u32) {
        /// START condition Interrupt Flag
        START: u1 = 0x0,
        /// Repeated START condition Interrupt Flag
        RSTART: u1 = 0x0,
        /// Address Interrupt Flag
        ADDR: u1 = 0x0,
        /// Transfer Completed Interrupt Flag
        TXC: u1 = 0x0,
        /// Transmit Buffer Level Interrupt Flag
        TXBL: u1 = 0x0,
        /// Receive Data Valid Interrupt Flag
        RXDATAV: u1 = 0x0,
        /// Acknowledge Received Interrupt Flag
        ACK: u1 = 0x0,
        /// Not Acknowledge Received Interrupt Flag
        NACK: u1 = 0x0,
        /// Leader STOP Condition Interrupt Flag
        MSTOP: u1 = 0x0,
        /// Arbitration Lost Interrupt Flag
        ARBLOST: u1 = 0x0,
        /// Bus Error Interrupt Flag
        BUSERR: u1 = 0x0,
        /// Bus Held Interrupt Flag
        BUSHOLD: u1 = 0x0,
        /// Transmit Buffer Overflow Interrupt Flag
        TXOF: u1 = 0x0,
        /// Receive Buffer Underflow Interrupt Flag
        RXUF: u1 = 0x0,
        /// Bus Idle Timeout Interrupt Flag
        BITO: u1 = 0x0,
        /// Clock Low Timeout Interrupt Flag
        CLTO: u1 = 0x0,
        /// Follower STOP condition Interrupt Flag
        SSTOP: u1 = 0x0,
        /// Receive Buffer Full Interrupt Flag
        RXFULL: u1 = 0x0,
        /// Clock Low Error Interrupt Flag
        CLERR: u1 = 0x0,
        /// SCL Error Interrupt Flag
        SCLERR: u1 = 0x0,
        /// SDA Error Interrupt Flag
        SDAERR: u1 = 0x0,
        padding: u11 = 0,
    }),
    /// No Description
    /// offset: 0x40
    IEN: mmio.Mmio(packed struct(u32) {
        /// START condition Interrupt Flag
        START: u1 = 0x0,
        /// Repeated START condition Interrupt Flag
        RSTART: u1 = 0x0,
        /// Address Interrupt Flag
        ADDR: u1 = 0x0,
        /// Transfer Completed Interrupt Flag
        TXC: u1 = 0x0,
        /// Transmit Buffer Level Interrupt Flag
        TXBL: u1 = 0x0,
        /// Receive Data Valid Interrupt Flag
        RXDATAV: u1 = 0x0,
        /// Acknowledge Received Interrupt Flag
        ACK: u1 = 0x0,
        /// Not Acknowledge Received Interrupt Flag
        NACK: u1 = 0x0,
        /// Leader STOP Condition Interrupt Flag
        MSTOP: u1 = 0x0,
        /// Arbitration Lost Interrupt Flag
        ARBLOST: u1 = 0x0,
        /// Bus Error Interrupt Flag
        BUSERR: u1 = 0x0,
        /// Bus Held Interrupt Flag
        BUSHOLD: u1 = 0x0,
        /// Transmit Buffer Overflow Interrupt Flag
        TXOF: u1 = 0x0,
        /// Receive Buffer Underflow Interrupt Flag
        RXUF: u1 = 0x0,
        /// Bus Idle Timeout Interrupt Flag
        BITO: u1 = 0x0,
        /// Clock Low Timeout Interrupt Flag
        CLTO: u1 = 0x0,
        /// Follower STOP condition Interrupt Flag
        SSTOP: u1 = 0x0,
        /// Receive Buffer Full Interrupt Flag
        RXFULL: u1 = 0x0,
        /// Clock Low Error Interrupt Flag
        CLERR: u1 = 0x0,
        /// SCL Error Interrupt Flag
        SCLERR: u1 = 0x0,
        /// SDA Error Interrupt Flag
        SDAERR: u1 = 0x0,
        padding: u11 = 0,
    }),
};
