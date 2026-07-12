const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// MSC_S Registers
pub const MSC_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version ID
        IPVERSION: u32 = 0x2,
    }),
    /// No Description
    /// offset: 0x04
    READCTRL: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Read Mode
        MODE: enum(u2) {
            /// Zero wait-states inserted in fetch or read transfers
            WS0 = 0x0,
            /// One wait-state inserted for each fetch or read transfer. See Flash Wait-States table for details
            WS1 = 0x1,
            /// Two wait-states inserted for eatch fetch or read transfer. See Flash Wait-States table for details
            WS2 = 0x2,
            /// Three wait-states inserted for eatch fetch or read transfer. See Flash Wait-States table for details
            WS3 = 0x3,
        } = .WS2,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x08
    RDATACTRL: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Automatic Invalidate Disable
        AFDIS: u1 = 0x0,
        reserved12: u10 = 0,
        /// Flash dout pipeline buffer enable
        DOUTBUFEN: u1 = 0x1,
        padding: u19 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    WRITECTRL: mmio.Mmio(packed struct(u32) {
        /// Enable Write/Erase Controller
        WREN: u1 = 0x0,
        /// Abort Page Erase on Interrupt
        IRQERASEABORT: u1 = 0x0,
        reserved3: u1 = 0,
        /// Low-Power Write
        LPWRITE: u1 = 0x0,
        reserved16: u12 = 0,
        /// EraseRange Count
        RANGECOUNT: u8 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x10
    WRITECMD: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Erase Page
        ERASEPAGE: u1 = 0x0,
        /// End Write Mode
        WRITEEND: u1 = 0x0,
        reserved4: u1 = 0,
        /// Erase range of pages
        ERASERANGE: u1 = 0x0,
        /// Abort erase sequence
        ERASEABORT: u1 = 0x0,
        reserved8: u2 = 0,
        /// Mass erase region 0
        ERASEMAIN0: u1 = 0x0,
        reserved12: u3 = 0,
        /// Clear WDATA state
        CLEARWDATA: u1 = 0x0,
        padding: u19 = 0,
    }),
    /// No Description
    /// offset: 0x14
    ADDRB: mmio.Mmio(packed struct(u32) {
        /// Page Erase or Write Address Buffer
        ADDRB: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x18
    WDATA: mmio.Mmio(packed struct(u32) {
        /// Write Data
        DATAW: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x1c
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Erase/Write Busy
        BUSY: u1 = 0x0,
        /// Access Locked
        LOCKED: u1 = 0x0,
        /// Invalid Write Address or Erase Page
        INVADDR: u1 = 0x0,
        /// WDATA Write Ready
        WDATAREADY: u1 = 0x1,
        /// Erase Operation Aborted
        ERASEABORTED: u1 = 0x0,
        /// Write Command In Queue
        PENDING: u1 = 0x0,
        /// Write Command Timeout
        TIMEOUT: u1 = 0x0,
        /// EraseRange with skipped locked pages
        RANGEPARTIAL: u1 = 0x0,
        reserved16: u8 = 0,
        /// Register Lock Status
        REGLOCK: enum(u1) {
            /// UNLOCKED
            UNLOCKED = 0x0,
            /// LOCKED
            LOCKED = 0x1,
        } = .UNLOCKED,
        reserved24: u7 = 0,
        /// Flash power on status
        PWRON: u1 = 0x0,
        reserved27: u2 = 0,
        /// Flash Write Ready
        WREADY: u1 = 0x1,
        /// Flash power up checkerboard pattern chec
        PWRUPCKBDFAILCOUNT: u4 = 0x0,
    }),
    /// No Description
    /// offset: 0x20
    IF: mmio.Mmio(packed struct(u32) {
        /// Host Erase Done Interrupt Read Flag
        ERASE: u1 = 0x0,
        /// Host Write Done Interrupt Read Flag
        WRITE: u1 = 0x0,
        /// Host write buffer overflow
        WDATAOV: u1 = 0x0,
        reserved8: u5 = 0,
        /// Flash Power Up Sequence Complete Flag
        PWRUPF: u1 = 0x0,
        /// Flash Power Off Sequence Complete Flag
        PWROFF: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x24
    IEN: mmio.Mmio(packed struct(u32) {
        /// Erase Done Interrupt enable
        ERASE: u1 = 0x0,
        /// Write Done Interrupt enable
        WRITE: u1 = 0x0,
        /// write data buffer overflow irq enable
        WDATAOV: u1 = 0x0,
        reserved8: u5 = 0,
        /// Flash Power Up Seq done irq enable
        PWRUPF: u1 = 0x0,
        /// Flash Power Off Seq done irq enable
        PWROFF: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// offset: 0x28
    reserved40: [12]u8,
    /// No Description
    /// offset: 0x34
    USERDATASIZE: mmio.Mmio(packed struct(u32) {
        /// User Data Size
        USERDATASIZE: u6 = 0x4,
        padding: u26 = 0,
    }),
    /// No Description
    /// offset: 0x38
    CMD: mmio.Mmio(packed struct(u32) {
        /// Flash Power Up Command
        PWRUP: u1 = 0x0,
        reserved4: u3 = 0,
        /// Flash power off/sleep command
        PWROFF: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x3c
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock
        LOCKKEY: enum(u16) {
            /// LOCK
            LOCK = 0x0,
            /// UNLOCK
            UNLOCK = 0x1b71,
            _,
        } = .LOCK,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x40
    MISCLOCKWORD: mmio.Mmio(packed struct(u32) {
        /// Mass Erase Lock
        MELOCKBIT: u1 = 0x1,
        reserved4: u3 = 0,
        /// User Data Lock
        UDLOCKBIT: u1 = 0x1,
        padding: u27 = 0,
    }),
    /// offset: 0x44
    reserved68: [12]u8,
    /// No Description
    /// offset: 0x50
    PWRCTRL: mmio.Mmio(packed struct(u32) {
        /// Power down Flash macro when enter EM1
        PWROFFONEM1ENTRY: u1 = 0x0,
        /// Power down Flash macro when enter EM1P
        PWROFFONEM1PENTRY: u1 = 0x1,
        reserved4: u2 = 0,
        /// POWER down flash again in EM1/EM1p
        PWROFFENTRYAGAIN: u1 = 0x0,
        reserved16: u11 = 0,
        /// Power down delay
        PWROFFDLY: u8 = 0x10,
        padding: u8 = 0,
    }),
    /// offset: 0x54
    reserved84: [204]u8,
    /// No Description
    /// offset: 0x120
    PAGELOCK0: mmio.Mmio(packed struct(u32) {
        /// page lock bit
        LOCKBIT: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x124
    PAGELOCK1: mmio.Mmio(packed struct(u32) {
        /// page lock bit
        LOCKBIT: u32 = 0x0,
    }),
};
