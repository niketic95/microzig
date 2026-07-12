const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// PRS_S Registers
pub const PRS_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// New BitField
        IPVERSION: u32 = 0x2,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// No Description
    /// offset: 0x08
    ASYNC_SWPULSE: mmio.Mmio(packed struct(u32) {
        /// Channel pulse
        CH0PULSE: u1 = 0x0,
        /// Channel pulse
        CH1PULSE: u1 = 0x0,
        /// Channel pulse
        CH2PULSE: u1 = 0x0,
        /// Channel pulse
        CH3PULSE: u1 = 0x0,
        /// Channel pulse
        CH4PULSE: u1 = 0x0,
        /// Channel pulse
        CH5PULSE: u1 = 0x0,
        /// Channel pulse
        CH6PULSE: u1 = 0x0,
        /// Channel pulse
        CH7PULSE: u1 = 0x0,
        /// Channel pulse
        CH8PULSE: u1 = 0x0,
        /// Channel pulse
        CH9PULSE: u1 = 0x0,
        /// Channel pulse
        CH10PULSE: u1 = 0x0,
        /// Channel pulse
        CH11PULSE: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    ASYNC_SWLEVEL: mmio.Mmio(packed struct(u32) {
        /// Channel Level
        CH0LEVEL: u1 = 0x0,
        /// Channel Level
        CH1LEVEL: u1 = 0x0,
        /// Channel Level
        CH2LEVEL: u1 = 0x0,
        /// Channel Level
        CH3LEVEL: u1 = 0x0,
        /// Channel Level
        CH4LEVEL: u1 = 0x0,
        /// Channel Level
        CH5LEVEL: u1 = 0x0,
        /// Channel Level
        CH6LEVEL: u1 = 0x0,
        /// Channel Level
        CH7LEVEL: u1 = 0x0,
        /// Channel Level
        CH8LEVEL: u1 = 0x0,
        /// Channel Level
        CH9LEVEL: u1 = 0x0,
        /// Channel Level
        CH10LEVEL: u1 = 0x0,
        /// Channel Level
        CH11LEVEL: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x10
    ASYNC_PEEK: mmio.Mmio(packed struct(u32) {
        /// Channel 0 Current Value
        CH0VAL: u1 = 0x0,
        /// Channel 1 Current Value
        CH1VAL: u1 = 0x0,
        /// Channel 2 Current Value
        CH2VAL: u1 = 0x0,
        /// Channel 3 Current Value
        CH3VAL: u1 = 0x0,
        /// Channel 4 Current Value
        CH4VAL: u1 = 0x0,
        /// Channel 5 Current Value
        CH5VAL: u1 = 0x0,
        /// Channel 6 Current Value
        CH6VAL: u1 = 0x0,
        /// Channel 7 Current Value
        CH7VAL: u1 = 0x0,
        /// Channel 8 Current Value
        CH8VAL: u1 = 0x0,
        /// Channel 9 Current Value
        CH9VAL: u1 = 0x0,
        /// Channel 10 Current Value
        CH10VAL: u1 = 0x0,
        /// Channel 11 Current Value
        CH11VAL: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// No Description
    /// offset: 0x14
    SYNC_PEEK: mmio.Mmio(packed struct(u32) {
        /// Channel Value
        CH0VAL: u1 = 0x0,
        /// Channel Value
        CH1VAL: u1 = 0x0,
        /// Channel Value
        CH2VAL: u1 = 0x0,
        /// Channel Value
        CH3VAL: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// No Description
    /// offset: 0x18
    ASYNC_CH0_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    ASYNC_CH1_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x20
    ASYNC_CH2_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x24
    ASYNC_CH3_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x28
    ASYNC_CH4_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x2c
    ASYNC_CH5_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x30
    ASYNC_CH6_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x34
    ASYNC_CH7_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x38
    ASYNC_CH8_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x3c
    ASYNC_CH9_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x40
    ASYNC_CH10_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x44
    ASYNC_CH11_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Function Select
        FNSEL: enum(u4) {
            /// Logical 0
            LOGICAL_ZERO = 0x0,
            /// A NOR B
            A_NOR_B = 0x1,
            /// (!A) AND B
            NOT_A_AND_B = 0x2,
            /// !A
            NOT_A = 0x3,
            /// A AND (!B)
            A_AND_NOT_B = 0x4,
            /// !B
            NOT_B = 0x5,
            /// A XOR B
            A_XOR_B = 0x6,
            /// A NAND B
            A_NAND_B = 0x7,
            /// A AND B
            A_AND_B = 0x8,
            /// A XNOR B
            A_XNOR_B = 0x9,
            /// B
            B = 0xa,
            /// (!A) OR B
            NOT_A_OR_B = 0xb,
            /// A
            A = 0xc,
            /// A OR (!B)
            A_OR_NOT_B = 0xd,
            /// A OR B
            A_OR_B = 0xe,
            /// Logical 1
            LOGICAL_ONE = 0xf,
        } = .A,
        reserved24: u4 = 0,
        /// Aux Select
        AUXSEL: u4 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x48
    SYNC_CH0_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        padding: u17 = 0,
    }),
    /// No Description
    /// offset: 0x4c
    SYNC_CH1_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        padding: u17 = 0,
    }),
    /// No Description
    /// offset: 0x50
    SYNC_CH2_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        padding: u17 = 0,
    }),
    /// No Description
    /// offset: 0x54
    SYNC_CH3_CTRL: mmio.Mmio(packed struct(u32) {
        /// Signal Select
        SIGSEL: enum(u3) {
            /// NONE
            NONE = 0x0,
            _,
        } = .NONE,
        reserved8: u5 = 0,
        /// Source Select
        SOURCESEL: u7 = 0x0,
        padding: u17 = 0,
    }),
    /// CALDN consumer register
    /// offset: 0x58
    CONSUMER_CMU_CALDN: mmio.Mmio(packed struct(u32) {
        /// CALDN async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CALUP Consumer register
    /// offset: 0x5c
    CONSUMER_CMU_CALUP: mmio.Mmio(packed struct(u32) {
        /// CALUP async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CLK consumer register
    /// offset: 0x60
    CONSUMER_EUSART0_CLK: mmio.Mmio(packed struct(u32) {
        /// CLK async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// RX Consumer register
    /// offset: 0x64
    CONSUMER_EUSART0_RX: mmio.Mmio(packed struct(u32) {
        /// RX async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TRIGGER Consumer register
    /// offset: 0x68
    CONSUMER_EUSART0_TRIGGER: mmio.Mmio(packed struct(u32) {
        /// TRIGGER async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CLK consumer register
    /// offset: 0x6c
    CONSUMER_EUSART1_CLK: mmio.Mmio(packed struct(u32) {
        /// CLK async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// RX Consumer register
    /// offset: 0x70
    CONSUMER_EUSART1_RX: mmio.Mmio(packed struct(u32) {
        /// RX async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TRIGGER Consumer register
    /// offset: 0x74
    CONSUMER_EUSART1_TRIGGER: mmio.Mmio(packed struct(u32) {
        /// TRIGGER async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CLK consumer register
    /// offset: 0x78
    CONSUMER_EUSART2_CLK: mmio.Mmio(packed struct(u32) {
        /// CLK async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// RX Consumer register
    /// offset: 0x7c
    CONSUMER_EUSART2_RX: mmio.Mmio(packed struct(u32) {
        /// RX async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TRIGGER Consumer register
    /// offset: 0x80
    CONSUMER_EUSART2_TRIGGER: mmio.Mmio(packed struct(u32) {
        /// TRIGGER async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// offset: 0x84
    reserved132: [4]u8,
    /// SCAN consumer register
    /// offset: 0x88
    CONSUMER_IADC0_SCANTRIGGER: mmio.Mmio(packed struct(u32) {
        /// SCAN async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// SCAN sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// SINGLE Consumer register
    /// offset: 0x8c
    CONSUMER_IADC0_SINGLETRIGGER: mmio.Mmio(packed struct(u32) {
        /// SINGLE async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// SINGLE sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// DMAREQ0 consumer register
    /// offset: 0x90
    CONSUMER_LDMAXBAR_DMAREQ0: mmio.Mmio(packed struct(u32) {
        /// DMAREQ0 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DMAREQ1 Consumer register
    /// offset: 0x94
    CONSUMER_LDMAXBAR_DMAREQ1: mmio.Mmio(packed struct(u32) {
        /// DMAREQ1 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// offset: 0x98
    reserved152: [16]u8,
    /// START Consumer register
    /// offset: 0xa8
    CONSUMER_LESENSE_START: mmio.Mmio(packed struct(u32) {
        /// START async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CLEAR consumer register
    /// offset: 0xac
    CONSUMER_LETIMER0_CLEAR: mmio.Mmio(packed struct(u32) {
        /// CLEAR async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// START Consumer register
    /// offset: 0xb0
    CONSUMER_LETIMER0_START: mmio.Mmio(packed struct(u32) {
        /// START async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// STOP Consumer register
    /// offset: 0xb4
    CONSUMER_LETIMER0_STOP: mmio.Mmio(packed struct(u32) {
        /// STOP async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// MODEM DIN consumer register
    /// offset: 0xb8
    CONSUMER_MODEM_DIN: mmio.Mmio(packed struct(u32) {
        /// DIN async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// S0IN consumer register
    /// offset: 0xbc
    CONSUMER_PCNT0_S0IN: mmio.Mmio(packed struct(u32) {
        /// S0IN async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// S1IN Consumer register
    /// offset: 0xc0
    CONSUMER_PCNT0_S1IN: mmio.Mmio(packed struct(u32) {
        /// S1IN async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// offset: 0xc4
    reserved196: [44]u8,
    /// CLR consumer register
    /// offset: 0xf0
    CONSUMER_RAC_CLR: mmio.Mmio(packed struct(u32) {
        /// CLR async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CTI Consumer register
    /// offset: 0xf4
    CONSUMER_RAC_CTIIN0: mmio.Mmio(packed struct(u32) {
        /// CTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CTI Consumer register
    /// offset: 0xf8
    CONSUMER_RAC_CTIIN1: mmio.Mmio(packed struct(u32) {
        /// CTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CTI Consumer register
    /// offset: 0xfc
    CONSUMER_RAC_CTIIN2: mmio.Mmio(packed struct(u32) {
        /// CTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CTI Consumer register
    /// offset: 0x100
    CONSUMER_RAC_CTIIN3: mmio.Mmio(packed struct(u32) {
        /// CTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// FORCETX Consumer register
    /// offset: 0x104
    CONSUMER_RAC_FORCETX: mmio.Mmio(packed struct(u32) {
        /// FORCETX async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// RXDIS Consumer register
    /// offset: 0x108
    CONSUMER_RAC_RXDIS: mmio.Mmio(packed struct(u32) {
        /// RXDIS async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// RXEN Consumer register
    /// offset: 0x10c
    CONSUMER_RAC_RXEN: mmio.Mmio(packed struct(u32) {
        /// RXEN async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TXEN Consumer register
    /// offset: 0x110
    CONSUMER_RAC_TXEN: mmio.Mmio(packed struct(u32) {
        /// TXEN async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TAMPERSRC25 consumer register
    /// offset: 0x114
    CONSUMER_SETAMPER_TAMPERSRC25: mmio.Mmio(packed struct(u32) {
        /// TAMPERSRC25 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TAMPERSRC26 Consumer register
    /// offset: 0x118
    CONSUMER_SETAMPER_TAMPERSRC26: mmio.Mmio(packed struct(u32) {
        /// TAMPERSRC26 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TAMPERSRC27 Consumer register
    /// offset: 0x11c
    CONSUMER_SETAMPER_TAMPERSRC27: mmio.Mmio(packed struct(u32) {
        /// TAMPERSRC27 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TAMPERSRC28 Consumer register
    /// offset: 0x120
    CONSUMER_SETAMPER_TAMPERSRC28: mmio.Mmio(packed struct(u32) {
        /// TAMPERSRC28 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TAMPERSRC29 Consumer register
    /// offset: 0x124
    CONSUMER_SETAMPER_TAMPERSRC29: mmio.Mmio(packed struct(u32) {
        /// TAMPERSRC29 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TAMPERSRC30 Consumer register
    /// offset: 0x128
    CONSUMER_SETAMPER_TAMPERSRC30: mmio.Mmio(packed struct(u32) {
        /// TAMPERSRC30 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TAMPERSRC31 Consumer register
    /// offset: 0x12c
    CONSUMER_SETAMPER_TAMPERSRC31: mmio.Mmio(packed struct(u32) {
        /// TAMPERSRC31 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// IN0 consumer register
    /// offset: 0x130
    CONSUMER_SYSRTC0_IN0: mmio.Mmio(packed struct(u32) {
        /// IN0 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// IN1 Consumer register
    /// offset: 0x134
    CONSUMER_SYSRTC0_IN1: mmio.Mmio(packed struct(u32) {
        /// IN1 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// OSCREQ consumer register
    /// offset: 0x138
    CONSUMER_HFXO0_OSCREQ: mmio.Mmio(packed struct(u32) {
        /// OSC async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TIMEOUT Consumer register
    /// offset: 0x13c
    CONSUMER_HFXO0_TIMEOUT: mmio.Mmio(packed struct(u32) {
        /// TIMEOUT async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CTI Consumer Register
    /// offset: 0x140
    CONSUMER_CORE_CTIIN0: mmio.Mmio(packed struct(u32) {
        /// CTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CTI Consumer Register
    /// offset: 0x144
    CONSUMER_CORE_CTIIN1: mmio.Mmio(packed struct(u32) {
        /// CTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CTI Consumer Register
    /// offset: 0x148
    CONSUMER_CORE_CTIIN2: mmio.Mmio(packed struct(u32) {
        /// CTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CTI Consumer Register
    /// offset: 0x14c
    CONSUMER_CORE_CTIIN3: mmio.Mmio(packed struct(u32) {
        /// CTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// M33 Consumer Register
    /// offset: 0x150
    CONSUMER_CORE_M33RXEV: mmio.Mmio(packed struct(u32) {
        /// M33 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CC0 consumer register
    /// offset: 0x154
    CONSUMER_TIMER0_CC0: mmio.Mmio(packed struct(u32) {
        /// CC0 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC0 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC1 Consumer register
    /// offset: 0x158
    CONSUMER_TIMER0_CC1: mmio.Mmio(packed struct(u32) {
        /// CC1 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC1 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC2 Consumer register
    /// offset: 0x15c
    CONSUMER_TIMER0_CC2: mmio.Mmio(packed struct(u32) {
        /// CC2 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC2 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x160
    CONSUMER_TIMER0_DTI: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x164
    CONSUMER_TIMER0_DTIFS1: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x168
    CONSUMER_TIMER0_DTIFS2: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CC0 consumer register
    /// offset: 0x16c
    CONSUMER_TIMER1_CC0: mmio.Mmio(packed struct(u32) {
        /// CC0 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC0 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC1 Consumer register
    /// offset: 0x170
    CONSUMER_TIMER1_CC1: mmio.Mmio(packed struct(u32) {
        /// CC1 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC1 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC2 Consumer register
    /// offset: 0x174
    CONSUMER_TIMER1_CC2: mmio.Mmio(packed struct(u32) {
        /// CC2 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC2 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x178
    CONSUMER_TIMER1_DTI: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x17c
    CONSUMER_TIMER1_DTIFS1: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x180
    CONSUMER_TIMER1_DTIFS2: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CC0 consumer register
    /// offset: 0x184
    CONSUMER_TIMER2_CC0: mmio.Mmio(packed struct(u32) {
        /// CC0 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC0 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC1 Consumer register
    /// offset: 0x188
    CONSUMER_TIMER2_CC1: mmio.Mmio(packed struct(u32) {
        /// CC1 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC1 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC2 Consumer register
    /// offset: 0x18c
    CONSUMER_TIMER2_CC2: mmio.Mmio(packed struct(u32) {
        /// CC2 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC2 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x190
    CONSUMER_TIMER2_DTI: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x194
    CONSUMER_TIMER2_DTIFS1: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x198
    CONSUMER_TIMER2_DTIFS2: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CC0 consumer register
    /// offset: 0x19c
    CONSUMER_TIMER3_CC0: mmio.Mmio(packed struct(u32) {
        /// CC0 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC0 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC1 Consumer register
    /// offset: 0x1a0
    CONSUMER_TIMER3_CC1: mmio.Mmio(packed struct(u32) {
        /// CC1 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC1 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC2 Consumer register
    /// offset: 0x1a4
    CONSUMER_TIMER3_CC2: mmio.Mmio(packed struct(u32) {
        /// CC2 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC2 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x1a8
    CONSUMER_TIMER3_DTI: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x1ac
    CONSUMER_TIMER3_DTIFS1: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x1b0
    CONSUMER_TIMER3_DTIFS2: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CC0 consumer register
    /// offset: 0x1b4
    CONSUMER_TIMER4_CC0: mmio.Mmio(packed struct(u32) {
        /// CC0 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC0 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC1 Consumer register
    /// offset: 0x1b8
    CONSUMER_TIMER4_CC1: mmio.Mmio(packed struct(u32) {
        /// CC1 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC1 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// CC2 Consumer register
    /// offset: 0x1bc
    CONSUMER_TIMER4_CC2: mmio.Mmio(packed struct(u32) {
        /// CC2 async channel select
        PRSSEL: u4 = 0x0,
        reserved8: u4 = 0,
        /// CC2 sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x1c0
    CONSUMER_TIMER4_DTI: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x1c4
    CONSUMER_TIMER4_DTIFS1: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// DTI Consumer register
    /// offset: 0x1c8
    CONSUMER_TIMER4_DTIFS2: mmio.Mmio(packed struct(u32) {
        /// DTI async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// CLK consumer register
    /// offset: 0x1cc
    CONSUMER_USART0_CLK: mmio.Mmio(packed struct(u32) {
        /// CLK async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// IR Consumer register
    /// offset: 0x1d0
    CONSUMER_USART0_IR: mmio.Mmio(packed struct(u32) {
        /// IR async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// RX Consumer register
    /// offset: 0x1d4
    CONSUMER_USART0_RX: mmio.Mmio(packed struct(u32) {
        /// RX async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// TRIGGER Consumer register
    /// offset: 0x1d8
    CONSUMER_USART0_TRIGGER: mmio.Mmio(packed struct(u32) {
        /// TRIGGER async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// offset: 0x1dc
    reserved476: [12]u8,
    /// ASYNCTRIG consumer register
    /// offset: 0x1e8
    CONSUMER_VDAC0_ASYNCTRIGCH0: mmio.Mmio(packed struct(u32) {
        /// ASYNCTRIG async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// ASYNCTRIG Consumer register
    /// offset: 0x1ec
    CONSUMER_VDAC0_ASYNCTRIGCH1: mmio.Mmio(packed struct(u32) {
        /// ASYNCTRIG async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// SYNCTRIG Consumer register
    /// offset: 0x1f0
    CONSUMER_VDAC0_SYNCTRIGCH0: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// SYNCTRIG sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// SYNCTRIG Consumer register
    /// offset: 0x1f4
    CONSUMER_VDAC0_SYNCTRIGCH1: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// SYNCTRIG sync channel select
        SPRSSEL: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// SRC0 consumer register
    /// offset: 0x1f8
    CONSUMER_WDOG0_SRC0: mmio.Mmio(packed struct(u32) {
        /// SRC0 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// SRC1 Consumer register
    /// offset: 0x1fc
    CONSUMER_WDOG0_SRC1: mmio.Mmio(packed struct(u32) {
        /// SRC1 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// SRC0 consumer register
    /// offset: 0x200
    CONSUMER_WDOG1_SRC0: mmio.Mmio(packed struct(u32) {
        /// SRC0 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// SRC1 Consumer register
    /// offset: 0x204
    CONSUMER_WDOG1_SRC1: mmio.Mmio(packed struct(u32) {
        /// SRC1 async channel select
        PRSSEL: u4 = 0x0,
        padding: u28 = 0,
    }),
};
