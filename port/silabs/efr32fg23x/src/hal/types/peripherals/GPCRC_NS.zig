const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// GPCRC_NS Registers
pub const GPCRC_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version ID
        IPVERSION: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// CRC Enable
        EN: enum(u1) {
            /// Disable CRC function. Reordering functions are still available. Only BITREVERSE and BYTEREVERSE bits are configurable in this mode.
            DISABLE = 0x0,
            /// Writes to INPUTDATA registers will result in CRC operations.
            ENABLE = 0x1,
        } = .DISABLE,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CTRL: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// Polynomial Select
        POLYSEL: enum(u1) {
            /// CRC-32 (0x04C11DB7) polynomial selected
            CRC32 = 0x0,
            /// 16-bit CRC programmable polynomial selected
            CRC16 = 0x1,
        } = .CRC32,
        reserved8: u3 = 0,
        /// Byte Mode Enable
        BYTEMODE: u1 = 0x0,
        /// Byte-level Bit Reverse Enable
        BITREVERSE: enum(u1) {
            /// No reverse
            NORMAL = 0x0,
            /// Reverse bit order in each byte
            REVERSED = 0x1,
        } = .NORMAL,
        /// Byte Reverse Mode
        BYTEREVERSE: enum(u1) {
            /// No reverse: B3, B2, B1, B0
            NORMAL = 0x0,
            /// Reverse byte order. For 32-bit: B0, B1, B2, B3; For 16-bit: 0, 0, B0, B1
            REVERSED = 0x1,
        } = .NORMAL,
        reserved13: u2 = 0,
        /// Auto Init Enable
        AUTOINIT: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    CMD: mmio.Mmio(packed struct(u32) {
        /// Initialization Enable
        INIT: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x10
    INIT: mmio.Mmio(packed struct(u32) {
        /// CRC Initialization Value
        INIT: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x14
    POLY: mmio.Mmio(packed struct(u32) {
        /// CRC Polynomial Value
        POLY: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x18
    INPUTDATA: mmio.Mmio(packed struct(u32) {
        /// Input Data for 32-bit
        INPUTDATA: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x1c
    INPUTDATAHWORD: mmio.Mmio(packed struct(u32) {
        /// Input Data for 16-bit
        INPUTDATAHWORD: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x20
    INPUTDATABYTE: mmio.Mmio(packed struct(u32) {
        /// Input Data for 8-bit
        INPUTDATABYTE: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x24
    DATA: mmio.Mmio(packed struct(u32) {
        /// CRC Data Register
        DATA: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x28
    DATAREV: mmio.Mmio(packed struct(u32) {
        /// Data Reverse Value
        DATAREV: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x2c
    DATABYTEREV: mmio.Mmio(packed struct(u32) {
        /// Data Byte Reverse Value
        DATABYTEREV: u32 = 0x0,
    }),
};
