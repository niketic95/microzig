const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// SEMAILBOX_S_HOST Registers
pub const SEMAILBOX_S_HOST = extern struct {
    /// A write access to any address in this area will be mapped to the TX FIFO (only for the payload). A read access to any address in this area will be mapped to the RX FIFO (only for the payload). Using an address range (16 x 32-bit) rather than one single address mapped to the FIFO allows using incremental bursts.
    /// offset: 0x00
    FIFO: mmio.Mmio(packed struct(u32) {
        /// FIFO
        FIFO: u32 = 0x0,
    }),
    /// offset: 0x04
    reserved4: [60]u8,
    /// TX Status register.
    /// offset: 0x40
    TX_STATUS: mmio.Mmio(packed struct(u32) {
        /// REMBYTES
        REMBYTES: u16 = 0x0,
        /// MSGINFO
        MSGINFO: u4 = 0x0,
        /// TXINT
        TXINT: u1 = 0x0,
        /// TXFULL
        TXFULL: u1 = 0x0,
        reserved23: u1 = 0,
        /// TXERROR
        TXERROR: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// RX Status register.
    /// offset: 0x44
    RX_STATUS: mmio.Mmio(packed struct(u32) {
        /// REMBYTES
        REMBYTES: u16 = 0x0,
        /// MSGINFO
        MSGINFO: u4 = 0x0,
        /// RXINT
        RXINT: u1 = 0x0,
        /// RXEMPTY
        RXEMPTY: u1 = 0x0,
        /// RXHDR
        RXHDR: u1 = 0x0,
        /// RXERROR
        RXERROR: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// TX Protection register.
    /// offset: 0x48
    TX_PROT: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// UNPROTECTED
        UNPROTECTED: u1 = 0x0,
        /// PRIVILEGED
        PRIVILEGED: u1 = 0x0,
        /// NONSECURE
        NONSECURE: u1 = 0x0,
        /// USER
        USER: u8 = 0x0,
    }),
    /// RX Protection register.
    /// offset: 0x4c
    RX_PROT: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// UNPROTECTED
        UNPROTECTED: u1 = 0x0,
        /// PRIVILEGED
        PRIVILEGED: u1 = 0x0,
        /// NONSECURE
        NONSECURE: u1 = 0x0,
        /// USER
        USER: u8 = 0x0,
    }),
    /// A write access to this register will be mapped to the TX FIFO (only for header).
    /// offset: 0x50
    TX_HEADER: mmio.Mmio(packed struct(u32) {
        /// TXHEADER
        TXHEADER: u32 = 0x0,
    }),
    /// A read access to this register will be mapped to the RX FIFO (only for the header).
    /// offset: 0x54
    RX_HEADER: mmio.Mmio(packed struct(u32) {
        /// RXHEADER
        RXHEADER: u32 = 0x0,
    }),
    /// Configuration register.
    /// offset: 0x58
    CONFIGURATION: mmio.Mmio(packed struct(u32) {
        /// TXINTEN
        TXINTEN: u1 = 0x0,
        /// RXINTEN
        RXINTEN: u1 = 0x0,
        padding: u30 = 0,
    }),
};
