const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// RADIOAES_NS Registers
pub const RADIOAES_NS = extern struct {
    /// Fetcher: Start address of data block. In direct mode, this register is written by the software. In scatter-gather mode, this register is updated after each processed descriptor.
    /// offset: 0x00
    FETCHADDR: mmio.Mmio(packed struct(u32) {
        /// Start address of data block
        ADDR: u32 = 0x0,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// Fetcher: Length of data block. In direct mode, this register is written by the software. In scatter-gather mode, this register is not used.
    /// offset: 0x08
    FETCHLEN: mmio.Mmio(packed struct(u32) {
        /// Length of data block
        LENGTH: u28 = 0x0,
        /// Constant address
        CONSTADDR: u1 = 0x0,
        /// Realign lengh
        REALIGN: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// Fetcher: User tag. In direct mode, this register is written by the software. In scatter-gather mode, this register is not used.
    /// offset: 0x0c
    FETCHTAG: mmio.Mmio(packed struct(u32) {
        /// User tag
        TAG: u32 = 0x0,
    }),
    /// Pusher: Start address of data block (LSB). In direct mode, this register is written by the software. In scatter-gather mode, this register is updated after each processed descriptor.
    /// offset: 0x10
    PUSHADDR: mmio.Mmio(packed struct(u32) {
        /// Start address of data block
        ADDR: u32 = 0x0,
    }),
    /// offset: 0x14
    reserved20: [4]u8,
    /// Pusher: Length of data block. In direct mode, this register is written by the software. In scatter-gather mode, this register is not used.
    /// offset: 0x18
    PUSHLEN: mmio.Mmio(packed struct(u32) {
        /// Start address of data block
        LENGTH: u28 = 0x0,
        /// Constant address
        CONSTADDR: u1 = 0x0,
        /// Realign length
        REALIGN: u1 = 0x0,
        /// Discard data
        DISCARD: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Interrupt enable
    /// offset: 0x1c
    IEN: mmio.Mmio(packed struct(u32) {
        /// End of block interrupt enable
        FETCHERENDOFBLOCK: u1 = 0x0,
        /// Stopped interrupt enable
        FETCHERSTOPPED: u1 = 0x0,
        /// Error interrupt enable
        FETCHERERROR: u1 = 0x0,
        /// End of block interrupt enable
        PUSHERENDOFBLOCK: u1 = 0x0,
        /// Stopped interrupt enable
        PUSHERSTOPPED: u1 = 0x0,
        /// Error interrupt enable
        PUSHERERROR: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// offset: 0x20
    reserved32: [8]u8,
    /// Interrupt flag register
    /// offset: 0x28
    IF: mmio.Mmio(packed struct(u32) {
        /// End of block interrupt flag
        FETCHERENDOFBLOCK: u1 = 0x0,
        /// Stopped interrupt flag
        FETCHERSTOPPED: u1 = 0x0,
        /// Error interrupt flag
        FETCHERERROR: u1 = 0x0,
        /// End of block interrupt flag
        PUSHERENDOFBLOCK: u1 = 0x0,
        /// Stopped interrupt flag
        PUSHERSTOPPED: u1 = 0x0,
        /// Error interrupt flag
        PUSHERERROR: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// offset: 0x2c
    reserved44: [4]u8,
    /// Writing a '1' clears the interrupt status. Writing a '0' has no effect.
    /// offset: 0x30
    IF_CLR: mmio.Mmio(packed struct(u32) {
        /// End of block interrupt flag clear
        FETCHERENDOFBLOCK: u1 = 0x0,
        /// Stopped interrupt flag clear
        FETCHERSTOPPED: u1 = 0x0,
        /// Error interrupt flag clear
        FETCHERERROR: u1 = 0x0,
        /// FETCHERENDOFBLOCKIFC
        PUSHERENDOFBLOCK: u1 = 0x0,
        /// FETCHERSTOPPEDIFC
        PUSHERSTOPPED: u1 = 0x0,
        /// FETCHERERRORIFC
        PUSHERERROR: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// Control register, called CONFIG in Barco datasheet.
    /// offset: 0x34
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Fetcher scatter/gather
        FETCHERSCATTERGATHER: u1 = 0x0,
        /// Pusher scatter/gather
        PUSHERSCATTERGATHER: u1 = 0x0,
        /// Stop fetcher
        STOPFETCHER: u1 = 0x0,
        /// Stop pusher
        STOPPUSHER: u1 = 0x0,
        /// Software reset
        SWRESET: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// Command register for starting the fetcher and pusher
    /// offset: 0x38
    CMD: mmio.Mmio(packed struct(u32) {
        /// Start fetch
        STARTFETCHER: u1 = 0x0,
        /// Start push
        STARTPUSHER: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// Status register
    /// offset: 0x3c
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Fetcher busy
        FETCHERBSY: u1 = 0x0,
        /// Pusher busy
        PUSHERBSY: u1 = 0x0,
        reserved4: u2 = 0,
        /// Not empty flag from input FIFO (fetcher)
        NOTEMPTY: u1 = 0x0,
        /// Pusher waiting for FIFO
        WAITING: u1 = 0x0,
        /// Software reset busy
        SOFTRSTBSY: u1 = 0x0,
        reserved16: u9 = 0,
        /// Number of data in output FIFO
        FIFODATANUM: u16 = 0x0,
    }),
    /// offset: 0x40
    reserved64: [960]u8,
    /// No Description
    /// offset: 0x400
    INCL_IPS_HW_CFG: mmio.Mmio(packed struct(u32) {
        /// Generic g_IncludeAES value
        g_IncludeAES: u1 = 0x1,
        /// Generic g_IncludeAESGCM value
        g_IncludeAESGCM: u1 = 0x0,
        /// Generic g_IncludeAESXTS value
        g_IncludeAESXTS: u1 = 0x0,
        /// Generic g_IncludeDES value
        g_IncludeDES: u1 = 0x0,
        /// Generic g_IncludeHASH value
        g_IncludeHASH: u1 = 0x0,
        /// Generic g_IncludeChachaPoly value
        g_IncludeChachaPoly: u1 = 0x0,
        /// Generic g_IncludeSHA3 value
        g_IncludeSHA3: u1 = 0x0,
        /// Generic g_IncludeZUC value
        g_IncludeZUC: u1 = 0x0,
        /// Generic g_IncludeSM4 value
        g_IncludeSM4: u1 = 0x0,
        /// Generic g_IncludePKE value
        g_IncludePKE: u1 = 0x0,
        /// Generic g_IncludeNDRNG value
        g_IncludeNDRNG: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// No Description
    /// offset: 0x404
    BA411E_HW_CFG_1: mmio.Mmio(packed struct(u32) {
        /// AES Modes Supported
        g_AesModesPoss: u9 = 0x127,
        reserved16: u7 = 0,
        /// Generic g_CS value
        g_CS: u1 = 0x1,
        /// Generic g_UseMasking value
        g_UseMasking: u1 = 0x0,
        reserved24: u6 = 0,
        /// Generic g_Keysize value
        g_Keysize: u3 = 0x5,
        padding: u5 = 0,
    }),
    /// No Description
    /// offset: 0x408
    BA411E_HW_CFG_2: mmio.Mmio(packed struct(u32) {
        /// Generic g_CtrSize value
        g_CtrSize: u16 = 0x80,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x40c
    BA413_HW_CFG: mmio.Mmio(packed struct(u32) {
        /// Generic g_HashMaskFunc value
        g_HashMaskFunc: u7 = 0x0,
        reserved16: u9 = 0,
        /// Generic g_HashPadding value
        g_HashPadding: u1 = 0x0,
        /// Generic g_HMAC_enabled value
        g_HMAC_enabled: u1 = 0x0,
        /// Generic g_HashVerifyDigest value
        g_HashVerifyDigest: u1 = 0x0,
        padding: u13 = 0,
    }),
    /// No Description
    /// offset: 0x410
    BA418_HW_CFG: mmio.Mmio(packed struct(u32) {
        /// Generic g_Sha3CtxtEn value
        g_Sha3CtxtEn: u1 = 0x1,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x414
    BA419_HW_CFG: mmio.Mmio(packed struct(u32) {
        /// Generic g_SM4ModesPoss value
        g_SM4ModesPoss: u7 = 0x0,
        padding: u25 = 0,
    }),
};
