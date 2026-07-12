const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// LDMA_S Registers
pub const LDMA_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IPVERSION
        IPVERSION: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// LDMA module enable and disable register
        EN: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CTRL: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// Number of Fixed Priority Channels
        NUMFIXED: u5 = 0x1E,
        reserved31: u2 = 0,
        /// Reset DMA controller
        CORERST: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x0c
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Any DMA Channel Busy
        ANYBUSY: u1 = 0x0,
        /// Any DMA Channel Request Pending
        ANYREQ: u1 = 0x0,
        reserved3: u1 = 0,
        /// Granted Channel Number
        CHGRANT: u5 = 0x0,
        /// Errant Channel Number
        CHERROR: u5 = 0x0,
        reserved16: u3 = 0,
        /// FIFO Level
        FIFOLEVEL: u5 = 0x10,
        reserved24: u3 = 0,
        /// Number of Channels
        CHNUM: u5 = 0x8,
        padding: u3 = 0,
    }),
    /// No Description
    /// offset: 0x10
    SYNCSWSET: mmio.Mmio(packed struct(u32) {
        /// DMA SYNC Software Trigger Set
        SYNCSWSET: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x14
    SYNCSWCLR: mmio.Mmio(packed struct(u32) {
        /// DMA SYNC Software Trigger Clear
        SYNCSWCLR: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x18
    SYNCHWEN: mmio.Mmio(packed struct(u32) {
        /// Hardware Sync Trigger Set Enable
        SYNCSETEN: u8 = 0x0,
        reserved16: u8 = 0,
        /// Hardware Sync Trigger Clear Enable
        SYNCCLREN: u8 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    SYNCHWSEL: mmio.Mmio(packed struct(u32) {
        /// Hardware Sync Trigger Set Edge Select
        SYNCSETEDGE: enum(u8) {
            /// Use rising edge detection
            RISE = 0x0,
            /// Use falling edge detection
            FALL = 0x1,
            _,
        } = .RISE,
        reserved16: u8 = 0,
        /// Hardware Sync Trigger Clear Edge Select
        SYNCCLREDGE: enum(u8) {
            /// Use rising edge detection
            RISE = 0x0,
            /// Use falling edge detection
            FALL = 0x1,
            _,
        } = .RISE,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x20
    SYNCSTATUS: mmio.Mmio(packed struct(u32) {
        /// sync trig status
        SYNCTRIG: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x24
    CHEN: mmio.Mmio(packed struct(u32) {
        /// Channel Enables
        CHEN: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x28
    CHDIS: mmio.Mmio(packed struct(u32) {
        /// DMA Channel disable
        CHDIS: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x2c
    CHSTATUS: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Status
        CHSTATUS: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x30
    CHBUSY: mmio.Mmio(packed struct(u32) {
        /// Channels Busy
        BUSY: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x34
    CHDONE: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Link done intr flag
        CHDONE0: u1 = 0x0,
        /// DMA Channel Link done intr flag
        CHDONE1: u1 = 0x0,
        /// DMA Channel Link done intr flag
        CHDONE2: u1 = 0x0,
        /// DMA Channel Link done intr flag
        CHDONE3: u1 = 0x0,
        /// DMA Channel Link done intr flag
        CHDONE4: u1 = 0x0,
        /// DMA Channel Link done intr flag
        CHDONE5: u1 = 0x0,
        /// DMA Channel Link done intr flag
        CHDONE6: u1 = 0x0,
        /// DMA Channel Link done intr flag
        CHDONE7: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x38
    DBGHALT: mmio.Mmio(packed struct(u32) {
        /// DMA Debug Halt
        DBGHALT: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x3c
    SWREQ: mmio.Mmio(packed struct(u32) {
        /// Software Transfer Requests
        SWREQ: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x40
    REQDIS: mmio.Mmio(packed struct(u32) {
        /// DMA Request Disables
        REQDIS: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x44
    REQPEND: mmio.Mmio(packed struct(u32) {
        /// DMA Requests Pending
        REQPEND: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x48
    LINKLOAD: mmio.Mmio(packed struct(u32) {
        /// DMA Link Loads
        LINKLOAD: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x4c
    REQCLEAR: mmio.Mmio(packed struct(u32) {
        /// DMA Request Clear
        REQCLEAR: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x50
    IF: mmio.Mmio(packed struct(u32) {
        /// DMA Structure Operation Done
        DONE0: u1 = 0x0,
        /// DMA Structure Operation Done
        DONE1: u1 = 0x0,
        /// DMA Structure Operation Done
        DONE2: u1 = 0x0,
        /// DMA Structure Operation Done
        DONE3: u1 = 0x0,
        /// DMA Structure Operation Done
        DONE4: u1 = 0x0,
        /// DMA Structure Operation Done
        DONE5: u1 = 0x0,
        /// DMA Structure Operation Done
        DONE6: u1 = 0x0,
        /// DMA Structure Operation Done
        DONE7: u1 = 0x0,
        reserved31: u23 = 0,
        /// Error Flag
        ERROR: u1 = 0x0,
    }),
    /// No Description
    /// offset: 0x54
    IEN: mmio.Mmio(packed struct(u32) {
        /// Enable or disable the done interrupt
        CHDONE: u8 = 0x0,
        reserved31: u23 = 0,
        /// Enable or disable the error interrupt
        ERROR: u1 = 0x0,
    }),
    /// offset: 0x58
    reserved88: [4]u8,
    /// No Description
    /// offset: 0x5c
    CH0_CFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Arbitration Slot Number Select
        ARBSLOTS: enum(u2) {
            /// One arbitration slot selected
            ONE = 0x0,
            /// Two arbitration slots selected
            TWO = 0x1,
            /// Four arbitration slots selected
            FOUR = 0x2,
            /// Eight arbitration slots selected
            EIGHT = 0x3,
        } = .ONE,
        reserved20: u2 = 0,
        /// Source Address Increment Sign
        SRCINCSIGN: enum(u1) {
            /// Increment source address
            POSITIVE = 0x0,
            /// Decrement source address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        /// Destination Address Increment Sign
        DSTINCSIGN: enum(u1) {
            /// Increment destination address
            POSITIVE = 0x0,
            /// Decrement destination address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x60
    CH0_LOOP: mmio.Mmio(packed struct(u32) {
        /// Linked Structure Sequence Loop Counter
        LOOPCNT: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x64
    CH0_CTRL: mmio.Mmio(packed struct(u32) {
        /// DMA Structure Type
        STRUCTTYPE: enum(u2) {
            /// DMA transfer structure type selected.
            TRANSFER = 0x0,
            /// Synchronization structure type selected.
            SYNCHRONIZE = 0x1,
            /// Write immediate value structure type selected.
            WRITE = 0x2,
            _,
        } = .TRANSFER,
        reserved3: u1 = 0,
        /// Structure DMA Transfer Request
        STRUCTREQ: u1 = 0x0,
        /// DMA Unit Data Transfer Count
        XFERCNT: u11 = 0x0,
        /// Endian Byte Swap
        BYTESWAP: u1 = 0x0,
        /// Block Transfer Size
        BLOCKSIZE: enum(u4) {
            /// One unit transfer per arbitration
            UNIT1 = 0x0,
            /// Two unit transfers per arbitration
            UNIT2 = 0x1,
            /// Three unit transfers per arbitration
            UNIT3 = 0x2,
            /// Four unit transfers per arbitration
            UNIT4 = 0x3,
            /// Six unit transfers per arbitration
            UNIT6 = 0x4,
            /// Eight unit transfers per arbitration
            UNIT8 = 0x5,
            /// Sixteen unit transfers per arbitration
            UNIT16 = 0x7,
            /// 32 unit transfers per arbitration
            UNIT32 = 0x9,
            /// 64 unit transfers per arbitration
            UNIT64 = 0xa,
            /// 128 unit transfers per arbitration
            UNIT128 = 0xb,
            /// 256 unit transfers per arbitration
            UNIT256 = 0xc,
            /// 512 unit transfers per arbitration
            UNIT512 = 0xd,
            /// 1024 unit transfers per arbitration
            UNIT1024 = 0xe,
            /// Transfer all units as specified by the XFRCNT field
            ALL = 0xf,
            _,
        } = .UNIT1,
        /// DMA Operation Done Interrupt Flag Set En
        DONEIEN: u1 = 0x0,
        /// DMA Request Transfer Mode Select
        REQMODE: enum(u1) {
            /// The LDMA transfers one BLOCKSIZE per transfer request.
            BLOCK = 0x0,
            /// One transfer request transfers all units as defined by the XFRCNT field.
            ALL = 0x1,
        } = .BLOCK,
        /// Decrement Loop Count
        DECLOOPCNT: u1 = 0x0,
        /// Ignore Sreq
        IGNORESREQ: u1 = 0x0,
        /// Source Address Increment Size
        SRCINC: enum(u2) {
            /// Increment source address by one unit data size after each read
            ONE = 0x0,
            /// Increment source address by two unit data sizes after each read
            TWO = 0x1,
            /// Increment source address by four unit data sizes after each read
            FOUR = 0x2,
            /// Do not increment the source address. In this mode reads are made from a fixed source address, for example reading FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Unit Data Transfer Size
        SIZE: enum(u2) {
            /// Each unit transfer is a byte
            BYTE = 0x0,
            /// Each unit transfer is a half-word
            HALFWORD = 0x1,
            /// Each unit transfer is a word
            WORD = 0x2,
            _,
        } = .BYTE,
        /// Destination Address Increment Size
        DSTINC: enum(u2) {
            /// Increment destination address by one unit data size after each write
            ONE = 0x0,
            /// Increment destination address by two unit data sizes after each write
            TWO = 0x1,
            /// Increment destination address by four unit data sizes after each write
            FOUR = 0x2,
            /// Do not increment the destination address. Writes are made to a fixed destination address, for example writing to a FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Source Addressing Mode
        SRCMODE: enum(u1) {
            /// The SRCADDR field of LDMA_CHx_SRC contains the absolute address of the source data.
            ABSOLUTE = 0x0,
            /// The SRCADDR field of LDMA_CHx_SRC contains the relative offset of the source data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Destination Addressing Mode
        DSTMODE: enum(u1) {
            /// The DSTADDR field of LDMA_CHx_DST contains the absolute address of the destination data.
            ABSOLUTE = 0x0,
            /// The DSTADDR field of LDMA_CHx_DST contains the relative offset of the destination data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
    }),
    /// No Description
    /// offset: 0x68
    CH0_SRC: mmio.Mmio(packed struct(u32) {
        /// Source Data Address
        SRCADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x6c
    CH0_DST: mmio.Mmio(packed struct(u32) {
        /// Destination Data Address
        DSTADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x70
    CH0_LINK: mmio.Mmio(packed struct(u32) {
        /// Link Structure Addressing Mode
        LINKMODE: enum(u1) {
            /// The LINKADDR field of LDMA_CHx_LINK contains the absolute address of the linked descriptor.
            ABSOLUTE = 0x0,
            /// The LINKADDR field of LDMA_CHx_LINK contains the relative offset of the linked descriptor.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Link Next Structure
        LINK: u1 = 0x0,
        /// Link Structure Address
        LINKADDR: u30 = 0x0,
    }),
    /// offset: 0x74
    reserved116: [24]u8,
    /// No Description
    /// offset: 0x8c
    CH1_CFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Arbitration Slot Number Select
        ARBSLOTS: enum(u2) {
            /// One arbitration slot selected
            ONE = 0x0,
            /// Two arbitration slots selected
            TWO = 0x1,
            /// Four arbitration slots selected
            FOUR = 0x2,
            /// Eight arbitration slots selected
            EIGHT = 0x3,
        } = .ONE,
        reserved20: u2 = 0,
        /// Source Address Increment Sign
        SRCINCSIGN: enum(u1) {
            /// Increment source address
            POSITIVE = 0x0,
            /// Decrement source address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        /// Destination Address Increment Sign
        DSTINCSIGN: enum(u1) {
            /// Increment destination address
            POSITIVE = 0x0,
            /// Decrement destination address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x90
    CH1_LOOP: mmio.Mmio(packed struct(u32) {
        /// Linked Structure Sequence Loop Counter
        LOOPCNT: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x94
    CH1_CTRL: mmio.Mmio(packed struct(u32) {
        /// DMA Structure Type
        STRUCTTYPE: enum(u2) {
            /// DMA transfer structure type selected.
            TRANSFER = 0x0,
            /// Synchronization structure type selected.
            SYNCHRONIZE = 0x1,
            /// Write immediate value structure type selected.
            WRITE = 0x2,
            _,
        } = .TRANSFER,
        reserved3: u1 = 0,
        /// Structure DMA Transfer Request
        STRUCTREQ: u1 = 0x0,
        /// DMA Unit Data Transfer Count
        XFERCNT: u11 = 0x0,
        /// Endian Byte Swap
        BYTESWAP: u1 = 0x0,
        /// Block Transfer Size
        BLOCKSIZE: enum(u4) {
            /// One unit transfer per arbitration
            UNIT1 = 0x0,
            /// Two unit transfers per arbitration
            UNIT2 = 0x1,
            /// Three unit transfers per arbitration
            UNIT3 = 0x2,
            /// Four unit transfers per arbitration
            UNIT4 = 0x3,
            /// Six unit transfers per arbitration
            UNIT6 = 0x4,
            /// Eight unit transfers per arbitration
            UNIT8 = 0x5,
            /// Sixteen unit transfers per arbitration
            UNIT16 = 0x7,
            /// 32 unit transfers per arbitration
            UNIT32 = 0x9,
            /// 64 unit transfers per arbitration
            UNIT64 = 0xa,
            /// 128 unit transfers per arbitration
            UNIT128 = 0xb,
            /// 256 unit transfers per arbitration
            UNIT256 = 0xc,
            /// 512 unit transfers per arbitration
            UNIT512 = 0xd,
            /// 1024 unit transfers per arbitration
            UNIT1024 = 0xe,
            /// Transfer all units as specified by the XFRCNT field
            ALL = 0xf,
            _,
        } = .UNIT1,
        /// DMA Operation Done Interrupt Flag Set En
        DONEIEN: u1 = 0x0,
        /// DMA Request Transfer Mode Select
        REQMODE: enum(u1) {
            /// The LDMA transfers one BLOCKSIZE per transfer request.
            BLOCK = 0x0,
            /// One transfer request transfers all units as defined by the XFRCNT field.
            ALL = 0x1,
        } = .BLOCK,
        /// Decrement Loop Count
        DECLOOPCNT: u1 = 0x0,
        /// Ignore Sreq
        IGNORESREQ: u1 = 0x0,
        /// Source Address Increment Size
        SRCINC: enum(u2) {
            /// Increment source address by one unit data size after each read
            ONE = 0x0,
            /// Increment source address by two unit data sizes after each read
            TWO = 0x1,
            /// Increment source address by four unit data sizes after each read
            FOUR = 0x2,
            /// Do not increment the source address. In this mode reads are made from a fixed source address, for example reading FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Unit Data Transfer Size
        SIZE: enum(u2) {
            /// Each unit transfer is a byte
            BYTE = 0x0,
            /// Each unit transfer is a half-word
            HALFWORD = 0x1,
            /// Each unit transfer is a word
            WORD = 0x2,
            _,
        } = .BYTE,
        /// Destination Address Increment Size
        DSTINC: enum(u2) {
            /// Increment destination address by one unit data size after each write
            ONE = 0x0,
            /// Increment destination address by two unit data sizes after each write
            TWO = 0x1,
            /// Increment destination address by four unit data sizes after each write
            FOUR = 0x2,
            /// Do not increment the destination address. Writes are made to a fixed destination address, for example writing to a FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Source Addressing Mode
        SRCMODE: enum(u1) {
            /// The SRCADDR field of LDMA_CHx_SRC contains the absolute address of the source data.
            ABSOLUTE = 0x0,
            /// The SRCADDR field of LDMA_CHx_SRC contains the relative offset of the source data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Destination Addressing Mode
        DSTMODE: enum(u1) {
            /// The DSTADDR field of LDMA_CHx_DST contains the absolute address of the destination data.
            ABSOLUTE = 0x0,
            /// The DSTADDR field of LDMA_CHx_DST contains the relative offset of the destination data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
    }),
    /// No Description
    /// offset: 0x98
    CH1_SRC: mmio.Mmio(packed struct(u32) {
        /// Source Data Address
        SRCADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x9c
    CH1_DST: mmio.Mmio(packed struct(u32) {
        /// Destination Data Address
        DSTADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0xa0
    CH1_LINK: mmio.Mmio(packed struct(u32) {
        /// Link Structure Addressing Mode
        LINKMODE: enum(u1) {
            /// The LINKADDR field of LDMA_CHx_LINK contains the absolute address of the linked descriptor.
            ABSOLUTE = 0x0,
            /// The LINKADDR field of LDMA_CHx_LINK contains the relative offset of the linked descriptor.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Link Next Structure
        LINK: u1 = 0x0,
        /// Link Structure Address
        LINKADDR: u30 = 0x0,
    }),
    /// offset: 0xa4
    reserved164: [24]u8,
    /// No Description
    /// offset: 0xbc
    CH2_CFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Arbitration Slot Number Select
        ARBSLOTS: enum(u2) {
            /// One arbitration slot selected
            ONE = 0x0,
            /// Two arbitration slots selected
            TWO = 0x1,
            /// Four arbitration slots selected
            FOUR = 0x2,
            /// Eight arbitration slots selected
            EIGHT = 0x3,
        } = .ONE,
        reserved20: u2 = 0,
        /// Source Address Increment Sign
        SRCINCSIGN: enum(u1) {
            /// Increment source address
            POSITIVE = 0x0,
            /// Decrement source address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        /// Destination Address Increment Sign
        DSTINCSIGN: enum(u1) {
            /// Increment destination address
            POSITIVE = 0x0,
            /// Decrement destination address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0xc0
    CH2_LOOP: mmio.Mmio(packed struct(u32) {
        /// Linked Structure Sequence Loop Counter
        LOOPCNT: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0xc4
    CH2_CTRL: mmio.Mmio(packed struct(u32) {
        /// DMA Structure Type
        STRUCTTYPE: enum(u2) {
            /// DMA transfer structure type selected.
            TRANSFER = 0x0,
            /// Synchronization structure type selected.
            SYNCHRONIZE = 0x1,
            /// Write immediate value structure type selected.
            WRITE = 0x2,
            _,
        } = .TRANSFER,
        reserved3: u1 = 0,
        /// Structure DMA Transfer Request
        STRUCTREQ: u1 = 0x0,
        /// DMA Unit Data Transfer Count
        XFERCNT: u11 = 0x0,
        /// Endian Byte Swap
        BYTESWAP: u1 = 0x0,
        /// Block Transfer Size
        BLOCKSIZE: enum(u4) {
            /// One unit transfer per arbitration
            UNIT1 = 0x0,
            /// Two unit transfers per arbitration
            UNIT2 = 0x1,
            /// Three unit transfers per arbitration
            UNIT3 = 0x2,
            /// Four unit transfers per arbitration
            UNIT4 = 0x3,
            /// Six unit transfers per arbitration
            UNIT6 = 0x4,
            /// Eight unit transfers per arbitration
            UNIT8 = 0x5,
            /// Sixteen unit transfers per arbitration
            UNIT16 = 0x7,
            /// 32 unit transfers per arbitration
            UNIT32 = 0x9,
            /// 64 unit transfers per arbitration
            UNIT64 = 0xa,
            /// 128 unit transfers per arbitration
            UNIT128 = 0xb,
            /// 256 unit transfers per arbitration
            UNIT256 = 0xc,
            /// 512 unit transfers per arbitration
            UNIT512 = 0xd,
            /// 1024 unit transfers per arbitration
            UNIT1024 = 0xe,
            /// Transfer all units as specified by the XFRCNT field
            ALL = 0xf,
            _,
        } = .UNIT1,
        /// DMA Operation Done Interrupt Flag Set En
        DONEIEN: u1 = 0x0,
        /// DMA Request Transfer Mode Select
        REQMODE: enum(u1) {
            /// The LDMA transfers one BLOCKSIZE per transfer request.
            BLOCK = 0x0,
            /// One transfer request transfers all units as defined by the XFRCNT field.
            ALL = 0x1,
        } = .BLOCK,
        /// Decrement Loop Count
        DECLOOPCNT: u1 = 0x0,
        /// Ignore Sreq
        IGNORESREQ: u1 = 0x0,
        /// Source Address Increment Size
        SRCINC: enum(u2) {
            /// Increment source address by one unit data size after each read
            ONE = 0x0,
            /// Increment source address by two unit data sizes after each read
            TWO = 0x1,
            /// Increment source address by four unit data sizes after each read
            FOUR = 0x2,
            /// Do not increment the source address. In this mode reads are made from a fixed source address, for example reading FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Unit Data Transfer Size
        SIZE: enum(u2) {
            /// Each unit transfer is a byte
            BYTE = 0x0,
            /// Each unit transfer is a half-word
            HALFWORD = 0x1,
            /// Each unit transfer is a word
            WORD = 0x2,
            _,
        } = .BYTE,
        /// Destination Address Increment Size
        DSTINC: enum(u2) {
            /// Increment destination address by one unit data size after each write
            ONE = 0x0,
            /// Increment destination address by two unit data sizes after each write
            TWO = 0x1,
            /// Increment destination address by four unit data sizes after each write
            FOUR = 0x2,
            /// Do not increment the destination address. Writes are made to a fixed destination address, for example writing to a FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Source Addressing Mode
        SRCMODE: enum(u1) {
            /// The SRCADDR field of LDMA_CHx_SRC contains the absolute address of the source data.
            ABSOLUTE = 0x0,
            /// The SRCADDR field of LDMA_CHx_SRC contains the relative offset of the source data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Destination Addressing Mode
        DSTMODE: enum(u1) {
            /// The DSTADDR field of LDMA_CHx_DST contains the absolute address of the destination data.
            ABSOLUTE = 0x0,
            /// The DSTADDR field of LDMA_CHx_DST contains the relative offset of the destination data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
    }),
    /// No Description
    /// offset: 0xc8
    CH2_SRC: mmio.Mmio(packed struct(u32) {
        /// Source Data Address
        SRCADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0xcc
    CH2_DST: mmio.Mmio(packed struct(u32) {
        /// Destination Data Address
        DSTADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0xd0
    CH2_LINK: mmio.Mmio(packed struct(u32) {
        /// Link Structure Addressing Mode
        LINKMODE: enum(u1) {
            /// The LINKADDR field of LDMA_CHx_LINK contains the absolute address of the linked descriptor.
            ABSOLUTE = 0x0,
            /// The LINKADDR field of LDMA_CHx_LINK contains the relative offset of the linked descriptor.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Link Next Structure
        LINK: u1 = 0x0,
        /// Link Structure Address
        LINKADDR: u30 = 0x0,
    }),
    /// offset: 0xd4
    reserved212: [24]u8,
    /// No Description
    /// offset: 0xec
    CH3_CFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Arbitration Slot Number Select
        ARBSLOTS: enum(u2) {
            /// One arbitration slot selected
            ONE = 0x0,
            /// Two arbitration slots selected
            TWO = 0x1,
            /// Four arbitration slots selected
            FOUR = 0x2,
            /// Eight arbitration slots selected
            EIGHT = 0x3,
        } = .ONE,
        reserved20: u2 = 0,
        /// Source Address Increment Sign
        SRCINCSIGN: enum(u1) {
            /// Increment source address
            POSITIVE = 0x0,
            /// Decrement source address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        /// Destination Address Increment Sign
        DSTINCSIGN: enum(u1) {
            /// Increment destination address
            POSITIVE = 0x0,
            /// Decrement destination address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0xf0
    CH3_LOOP: mmio.Mmio(packed struct(u32) {
        /// Linked Structure Sequence Loop Counter
        LOOPCNT: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0xf4
    CH3_CTRL: mmio.Mmio(packed struct(u32) {
        /// DMA Structure Type
        STRUCTTYPE: enum(u2) {
            /// DMA transfer structure type selected.
            TRANSFER = 0x0,
            /// Synchronization structure type selected.
            SYNCHRONIZE = 0x1,
            /// Write immediate value structure type selected.
            WRITE = 0x2,
            _,
        } = .TRANSFER,
        reserved3: u1 = 0,
        /// Structure DMA Transfer Request
        STRUCTREQ: u1 = 0x0,
        /// DMA Unit Data Transfer Count
        XFERCNT: u11 = 0x0,
        /// Endian Byte Swap
        BYTESWAP: u1 = 0x0,
        /// Block Transfer Size
        BLOCKSIZE: enum(u4) {
            /// One unit transfer per arbitration
            UNIT1 = 0x0,
            /// Two unit transfers per arbitration
            UNIT2 = 0x1,
            /// Three unit transfers per arbitration
            UNIT3 = 0x2,
            /// Four unit transfers per arbitration
            UNIT4 = 0x3,
            /// Six unit transfers per arbitration
            UNIT6 = 0x4,
            /// Eight unit transfers per arbitration
            UNIT8 = 0x5,
            /// Sixteen unit transfers per arbitration
            UNIT16 = 0x7,
            /// 32 unit transfers per arbitration
            UNIT32 = 0x9,
            /// 64 unit transfers per arbitration
            UNIT64 = 0xa,
            /// 128 unit transfers per arbitration
            UNIT128 = 0xb,
            /// 256 unit transfers per arbitration
            UNIT256 = 0xc,
            /// 512 unit transfers per arbitration
            UNIT512 = 0xd,
            /// 1024 unit transfers per arbitration
            UNIT1024 = 0xe,
            /// Transfer all units as specified by the XFRCNT field
            ALL = 0xf,
            _,
        } = .UNIT1,
        /// DMA Operation Done Interrupt Flag Set En
        DONEIEN: u1 = 0x0,
        /// DMA Request Transfer Mode Select
        REQMODE: enum(u1) {
            /// The LDMA transfers one BLOCKSIZE per transfer request.
            BLOCK = 0x0,
            /// One transfer request transfers all units as defined by the XFRCNT field.
            ALL = 0x1,
        } = .BLOCK,
        /// Decrement Loop Count
        DECLOOPCNT: u1 = 0x0,
        /// Ignore Sreq
        IGNORESREQ: u1 = 0x0,
        /// Source Address Increment Size
        SRCINC: enum(u2) {
            /// Increment source address by one unit data size after each read
            ONE = 0x0,
            /// Increment source address by two unit data sizes after each read
            TWO = 0x1,
            /// Increment source address by four unit data sizes after each read
            FOUR = 0x2,
            /// Do not increment the source address. In this mode reads are made from a fixed source address, for example reading FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Unit Data Transfer Size
        SIZE: enum(u2) {
            /// Each unit transfer is a byte
            BYTE = 0x0,
            /// Each unit transfer is a half-word
            HALFWORD = 0x1,
            /// Each unit transfer is a word
            WORD = 0x2,
            _,
        } = .BYTE,
        /// Destination Address Increment Size
        DSTINC: enum(u2) {
            /// Increment destination address by one unit data size after each write
            ONE = 0x0,
            /// Increment destination address by two unit data sizes after each write
            TWO = 0x1,
            /// Increment destination address by four unit data sizes after each write
            FOUR = 0x2,
            /// Do not increment the destination address. Writes are made to a fixed destination address, for example writing to a FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Source Addressing Mode
        SRCMODE: enum(u1) {
            /// The SRCADDR field of LDMA_CHx_SRC contains the absolute address of the source data.
            ABSOLUTE = 0x0,
            /// The SRCADDR field of LDMA_CHx_SRC contains the relative offset of the source data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Destination Addressing Mode
        DSTMODE: enum(u1) {
            /// The DSTADDR field of LDMA_CHx_DST contains the absolute address of the destination data.
            ABSOLUTE = 0x0,
            /// The DSTADDR field of LDMA_CHx_DST contains the relative offset of the destination data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
    }),
    /// No Description
    /// offset: 0xf8
    CH3_SRC: mmio.Mmio(packed struct(u32) {
        /// Source Data Address
        SRCADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0xfc
    CH3_DST: mmio.Mmio(packed struct(u32) {
        /// Destination Data Address
        DSTADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x100
    CH3_LINK: mmio.Mmio(packed struct(u32) {
        /// Link Structure Addressing Mode
        LINKMODE: enum(u1) {
            /// The LINKADDR field of LDMA_CHx_LINK contains the absolute address of the linked descriptor.
            ABSOLUTE = 0x0,
            /// The LINKADDR field of LDMA_CHx_LINK contains the relative offset of the linked descriptor.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Link Next Structure
        LINK: u1 = 0x0,
        /// Link Structure Address
        LINKADDR: u30 = 0x0,
    }),
    /// offset: 0x104
    reserved260: [24]u8,
    /// No Description
    /// offset: 0x11c
    CH4_CFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Arbitration Slot Number Select
        ARBSLOTS: enum(u2) {
            /// One arbitration slot selected
            ONE = 0x0,
            /// Two arbitration slots selected
            TWO = 0x1,
            /// Four arbitration slots selected
            FOUR = 0x2,
            /// Eight arbitration slots selected
            EIGHT = 0x3,
        } = .ONE,
        reserved20: u2 = 0,
        /// Source Address Increment Sign
        SRCINCSIGN: enum(u1) {
            /// Increment source address
            POSITIVE = 0x0,
            /// Decrement source address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        /// Destination Address Increment Sign
        DSTINCSIGN: enum(u1) {
            /// Increment destination address
            POSITIVE = 0x0,
            /// Decrement destination address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x120
    CH4_LOOP: mmio.Mmio(packed struct(u32) {
        /// Linked Structure Sequence Loop Counter
        LOOPCNT: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x124
    CH4_CTRL: mmio.Mmio(packed struct(u32) {
        /// DMA Structure Type
        STRUCTTYPE: enum(u2) {
            /// DMA transfer structure type selected.
            TRANSFER = 0x0,
            /// Synchronization structure type selected.
            SYNCHRONIZE = 0x1,
            /// Write immediate value structure type selected.
            WRITE = 0x2,
            _,
        } = .TRANSFER,
        reserved3: u1 = 0,
        /// Structure DMA Transfer Request
        STRUCTREQ: u1 = 0x0,
        /// DMA Unit Data Transfer Count
        XFERCNT: u11 = 0x0,
        /// Endian Byte Swap
        BYTESWAP: u1 = 0x0,
        /// Block Transfer Size
        BLOCKSIZE: enum(u4) {
            /// One unit transfer per arbitration
            UNIT1 = 0x0,
            /// Two unit transfers per arbitration
            UNIT2 = 0x1,
            /// Three unit transfers per arbitration
            UNIT3 = 0x2,
            /// Four unit transfers per arbitration
            UNIT4 = 0x3,
            /// Six unit transfers per arbitration
            UNIT6 = 0x4,
            /// Eight unit transfers per arbitration
            UNIT8 = 0x5,
            /// Sixteen unit transfers per arbitration
            UNIT16 = 0x7,
            /// 32 unit transfers per arbitration
            UNIT32 = 0x9,
            /// 64 unit transfers per arbitration
            UNIT64 = 0xa,
            /// 128 unit transfers per arbitration
            UNIT128 = 0xb,
            /// 256 unit transfers per arbitration
            UNIT256 = 0xc,
            /// 512 unit transfers per arbitration
            UNIT512 = 0xd,
            /// 1024 unit transfers per arbitration
            UNIT1024 = 0xe,
            /// Transfer all units as specified by the XFRCNT field
            ALL = 0xf,
            _,
        } = .UNIT1,
        /// DMA Operation Done Interrupt Flag Set En
        DONEIEN: u1 = 0x0,
        /// DMA Request Transfer Mode Select
        REQMODE: enum(u1) {
            /// The LDMA transfers one BLOCKSIZE per transfer request.
            BLOCK = 0x0,
            /// One transfer request transfers all units as defined by the XFRCNT field.
            ALL = 0x1,
        } = .BLOCK,
        /// Decrement Loop Count
        DECLOOPCNT: u1 = 0x0,
        /// Ignore Sreq
        IGNORESREQ: u1 = 0x0,
        /// Source Address Increment Size
        SRCINC: enum(u2) {
            /// Increment source address by one unit data size after each read
            ONE = 0x0,
            /// Increment source address by two unit data sizes after each read
            TWO = 0x1,
            /// Increment source address by four unit data sizes after each read
            FOUR = 0x2,
            /// Do not increment the source address. In this mode reads are made from a fixed source address, for example reading FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Unit Data Transfer Size
        SIZE: enum(u2) {
            /// Each unit transfer is a byte
            BYTE = 0x0,
            /// Each unit transfer is a half-word
            HALFWORD = 0x1,
            /// Each unit transfer is a word
            WORD = 0x2,
            _,
        } = .BYTE,
        /// Destination Address Increment Size
        DSTINC: enum(u2) {
            /// Increment destination address by one unit data size after each write
            ONE = 0x0,
            /// Increment destination address by two unit data sizes after each write
            TWO = 0x1,
            /// Increment destination address by four unit data sizes after each write
            FOUR = 0x2,
            /// Do not increment the destination address. Writes are made to a fixed destination address, for example writing to a FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Source Addressing Mode
        SRCMODE: enum(u1) {
            /// The SRCADDR field of LDMA_CHx_SRC contains the absolute address of the source data.
            ABSOLUTE = 0x0,
            /// The SRCADDR field of LDMA_CHx_SRC contains the relative offset of the source data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Destination Addressing Mode
        DSTMODE: enum(u1) {
            /// The DSTADDR field of LDMA_CHx_DST contains the absolute address of the destination data.
            ABSOLUTE = 0x0,
            /// The DSTADDR field of LDMA_CHx_DST contains the relative offset of the destination data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
    }),
    /// No Description
    /// offset: 0x128
    CH4_SRC: mmio.Mmio(packed struct(u32) {
        /// Source Data Address
        SRCADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x12c
    CH4_DST: mmio.Mmio(packed struct(u32) {
        /// Destination Data Address
        DSTADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x130
    CH4_LINK: mmio.Mmio(packed struct(u32) {
        /// Link Structure Addressing Mode
        LINKMODE: enum(u1) {
            /// The LINKADDR field of LDMA_CHx_LINK contains the absolute address of the linked descriptor.
            ABSOLUTE = 0x0,
            /// The LINKADDR field of LDMA_CHx_LINK contains the relative offset of the linked descriptor.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Link Next Structure
        LINK: u1 = 0x0,
        /// Link Structure Address
        LINKADDR: u30 = 0x0,
    }),
    /// offset: 0x134
    reserved308: [24]u8,
    /// No Description
    /// offset: 0x14c
    CH5_CFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Arbitration Slot Number Select
        ARBSLOTS: enum(u2) {
            /// One arbitration slot selected
            ONE = 0x0,
            /// Two arbitration slots selected
            TWO = 0x1,
            /// Four arbitration slots selected
            FOUR = 0x2,
            /// Eight arbitration slots selected
            EIGHT = 0x3,
        } = .ONE,
        reserved20: u2 = 0,
        /// Source Address Increment Sign
        SRCINCSIGN: enum(u1) {
            /// Increment source address
            POSITIVE = 0x0,
            /// Decrement source address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        /// Destination Address Increment Sign
        DSTINCSIGN: enum(u1) {
            /// Increment destination address
            POSITIVE = 0x0,
            /// Decrement destination address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x150
    CH5_LOOP: mmio.Mmio(packed struct(u32) {
        /// Linked Structure Sequence Loop Counter
        LOOPCNT: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x154
    CH5_CTRL: mmio.Mmio(packed struct(u32) {
        /// DMA Structure Type
        STRUCTTYPE: enum(u2) {
            /// DMA transfer structure type selected.
            TRANSFER = 0x0,
            /// Synchronization structure type selected.
            SYNCHRONIZE = 0x1,
            /// Write immediate value structure type selected.
            WRITE = 0x2,
            _,
        } = .TRANSFER,
        reserved3: u1 = 0,
        /// Structure DMA Transfer Request
        STRUCTREQ: u1 = 0x0,
        /// DMA Unit Data Transfer Count
        XFERCNT: u11 = 0x0,
        /// Endian Byte Swap
        BYTESWAP: u1 = 0x0,
        /// Block Transfer Size
        BLOCKSIZE: enum(u4) {
            /// One unit transfer per arbitration
            UNIT1 = 0x0,
            /// Two unit transfers per arbitration
            UNIT2 = 0x1,
            /// Three unit transfers per arbitration
            UNIT3 = 0x2,
            /// Four unit transfers per arbitration
            UNIT4 = 0x3,
            /// Six unit transfers per arbitration
            UNIT6 = 0x4,
            /// Eight unit transfers per arbitration
            UNIT8 = 0x5,
            /// Sixteen unit transfers per arbitration
            UNIT16 = 0x7,
            /// 32 unit transfers per arbitration
            UNIT32 = 0x9,
            /// 64 unit transfers per arbitration
            UNIT64 = 0xa,
            /// 128 unit transfers per arbitration
            UNIT128 = 0xb,
            /// 256 unit transfers per arbitration
            UNIT256 = 0xc,
            /// 512 unit transfers per arbitration
            UNIT512 = 0xd,
            /// 1024 unit transfers per arbitration
            UNIT1024 = 0xe,
            /// Transfer all units as specified by the XFRCNT field
            ALL = 0xf,
            _,
        } = .UNIT1,
        /// DMA Operation Done Interrupt Flag Set En
        DONEIEN: u1 = 0x0,
        /// DMA Request Transfer Mode Select
        REQMODE: enum(u1) {
            /// The LDMA transfers one BLOCKSIZE per transfer request.
            BLOCK = 0x0,
            /// One transfer request transfers all units as defined by the XFRCNT field.
            ALL = 0x1,
        } = .BLOCK,
        /// Decrement Loop Count
        DECLOOPCNT: u1 = 0x0,
        /// Ignore Sreq
        IGNORESREQ: u1 = 0x0,
        /// Source Address Increment Size
        SRCINC: enum(u2) {
            /// Increment source address by one unit data size after each read
            ONE = 0x0,
            /// Increment source address by two unit data sizes after each read
            TWO = 0x1,
            /// Increment source address by four unit data sizes after each read
            FOUR = 0x2,
            /// Do not increment the source address. In this mode reads are made from a fixed source address, for example reading FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Unit Data Transfer Size
        SIZE: enum(u2) {
            /// Each unit transfer is a byte
            BYTE = 0x0,
            /// Each unit transfer is a half-word
            HALFWORD = 0x1,
            /// Each unit transfer is a word
            WORD = 0x2,
            _,
        } = .BYTE,
        /// Destination Address Increment Size
        DSTINC: enum(u2) {
            /// Increment destination address by one unit data size after each write
            ONE = 0x0,
            /// Increment destination address by two unit data sizes after each write
            TWO = 0x1,
            /// Increment destination address by four unit data sizes after each write
            FOUR = 0x2,
            /// Do not increment the destination address. Writes are made to a fixed destination address, for example writing to a FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Source Addressing Mode
        SRCMODE: enum(u1) {
            /// The SRCADDR field of LDMA_CHx_SRC contains the absolute address of the source data.
            ABSOLUTE = 0x0,
            /// The SRCADDR field of LDMA_CHx_SRC contains the relative offset of the source data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Destination Addressing Mode
        DSTMODE: enum(u1) {
            /// The DSTADDR field of LDMA_CHx_DST contains the absolute address of the destination data.
            ABSOLUTE = 0x0,
            /// The DSTADDR field of LDMA_CHx_DST contains the relative offset of the destination data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
    }),
    /// No Description
    /// offset: 0x158
    CH5_SRC: mmio.Mmio(packed struct(u32) {
        /// Source Data Address
        SRCADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x15c
    CH5_DST: mmio.Mmio(packed struct(u32) {
        /// Destination Data Address
        DSTADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x160
    CH5_LINK: mmio.Mmio(packed struct(u32) {
        /// Link Structure Addressing Mode
        LINKMODE: enum(u1) {
            /// The LINKADDR field of LDMA_CHx_LINK contains the absolute address of the linked descriptor.
            ABSOLUTE = 0x0,
            /// The LINKADDR field of LDMA_CHx_LINK contains the relative offset of the linked descriptor.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Link Next Structure
        LINK: u1 = 0x0,
        /// Link Structure Address
        LINKADDR: u30 = 0x0,
    }),
    /// offset: 0x164
    reserved356: [24]u8,
    /// No Description
    /// offset: 0x17c
    CH6_CFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Arbitration Slot Number Select
        ARBSLOTS: enum(u2) {
            /// One arbitration slot selected
            ONE = 0x0,
            /// Two arbitration slots selected
            TWO = 0x1,
            /// Four arbitration slots selected
            FOUR = 0x2,
            /// Eight arbitration slots selected
            EIGHT = 0x3,
        } = .ONE,
        reserved20: u2 = 0,
        /// Source Address Increment Sign
        SRCINCSIGN: enum(u1) {
            /// Increment source address
            POSITIVE = 0x0,
            /// Decrement source address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        /// Destination Address Increment Sign
        DSTINCSIGN: enum(u1) {
            /// Increment destination address
            POSITIVE = 0x0,
            /// Decrement destination address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x180
    CH6_LOOP: mmio.Mmio(packed struct(u32) {
        /// Linked Structure Sequence Loop Counter
        LOOPCNT: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x184
    CH6_CTRL: mmio.Mmio(packed struct(u32) {
        /// DMA Structure Type
        STRUCTTYPE: enum(u2) {
            /// DMA transfer structure type selected.
            TRANSFER = 0x0,
            /// Synchronization structure type selected.
            SYNCHRONIZE = 0x1,
            /// Write immediate value structure type selected.
            WRITE = 0x2,
            _,
        } = .TRANSFER,
        reserved3: u1 = 0,
        /// Structure DMA Transfer Request
        STRUCTREQ: u1 = 0x0,
        /// DMA Unit Data Transfer Count
        XFERCNT: u11 = 0x0,
        /// Endian Byte Swap
        BYTESWAP: u1 = 0x0,
        /// Block Transfer Size
        BLOCKSIZE: enum(u4) {
            /// One unit transfer per arbitration
            UNIT1 = 0x0,
            /// Two unit transfers per arbitration
            UNIT2 = 0x1,
            /// Three unit transfers per arbitration
            UNIT3 = 0x2,
            /// Four unit transfers per arbitration
            UNIT4 = 0x3,
            /// Six unit transfers per arbitration
            UNIT6 = 0x4,
            /// Eight unit transfers per arbitration
            UNIT8 = 0x5,
            /// Sixteen unit transfers per arbitration
            UNIT16 = 0x7,
            /// 32 unit transfers per arbitration
            UNIT32 = 0x9,
            /// 64 unit transfers per arbitration
            UNIT64 = 0xa,
            /// 128 unit transfers per arbitration
            UNIT128 = 0xb,
            /// 256 unit transfers per arbitration
            UNIT256 = 0xc,
            /// 512 unit transfers per arbitration
            UNIT512 = 0xd,
            /// 1024 unit transfers per arbitration
            UNIT1024 = 0xe,
            /// Transfer all units as specified by the XFRCNT field
            ALL = 0xf,
            _,
        } = .UNIT1,
        /// DMA Operation Done Interrupt Flag Set En
        DONEIEN: u1 = 0x0,
        /// DMA Request Transfer Mode Select
        REQMODE: enum(u1) {
            /// The LDMA transfers one BLOCKSIZE per transfer request.
            BLOCK = 0x0,
            /// One transfer request transfers all units as defined by the XFRCNT field.
            ALL = 0x1,
        } = .BLOCK,
        /// Decrement Loop Count
        DECLOOPCNT: u1 = 0x0,
        /// Ignore Sreq
        IGNORESREQ: u1 = 0x0,
        /// Source Address Increment Size
        SRCINC: enum(u2) {
            /// Increment source address by one unit data size after each read
            ONE = 0x0,
            /// Increment source address by two unit data sizes after each read
            TWO = 0x1,
            /// Increment source address by four unit data sizes after each read
            FOUR = 0x2,
            /// Do not increment the source address. In this mode reads are made from a fixed source address, for example reading FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Unit Data Transfer Size
        SIZE: enum(u2) {
            /// Each unit transfer is a byte
            BYTE = 0x0,
            /// Each unit transfer is a half-word
            HALFWORD = 0x1,
            /// Each unit transfer is a word
            WORD = 0x2,
            _,
        } = .BYTE,
        /// Destination Address Increment Size
        DSTINC: enum(u2) {
            /// Increment destination address by one unit data size after each write
            ONE = 0x0,
            /// Increment destination address by two unit data sizes after each write
            TWO = 0x1,
            /// Increment destination address by four unit data sizes after each write
            FOUR = 0x2,
            /// Do not increment the destination address. Writes are made to a fixed destination address, for example writing to a FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Source Addressing Mode
        SRCMODE: enum(u1) {
            /// The SRCADDR field of LDMA_CHx_SRC contains the absolute address of the source data.
            ABSOLUTE = 0x0,
            /// The SRCADDR field of LDMA_CHx_SRC contains the relative offset of the source data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Destination Addressing Mode
        DSTMODE: enum(u1) {
            /// The DSTADDR field of LDMA_CHx_DST contains the absolute address of the destination data.
            ABSOLUTE = 0x0,
            /// The DSTADDR field of LDMA_CHx_DST contains the relative offset of the destination data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
    }),
    /// No Description
    /// offset: 0x188
    CH6_SRC: mmio.Mmio(packed struct(u32) {
        /// Source Data Address
        SRCADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x18c
    CH6_DST: mmio.Mmio(packed struct(u32) {
        /// Destination Data Address
        DSTADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x190
    CH6_LINK: mmio.Mmio(packed struct(u32) {
        /// Link Structure Addressing Mode
        LINKMODE: enum(u1) {
            /// The LINKADDR field of LDMA_CHx_LINK contains the absolute address of the linked descriptor.
            ABSOLUTE = 0x0,
            /// The LINKADDR field of LDMA_CHx_LINK contains the relative offset of the linked descriptor.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Link Next Structure
        LINK: u1 = 0x0,
        /// Link Structure Address
        LINKADDR: u30 = 0x0,
    }),
    /// offset: 0x194
    reserved404: [24]u8,
    /// No Description
    /// offset: 0x1ac
    CH7_CFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Arbitration Slot Number Select
        ARBSLOTS: enum(u2) {
            /// One arbitration slot selected
            ONE = 0x0,
            /// Two arbitration slots selected
            TWO = 0x1,
            /// Four arbitration slots selected
            FOUR = 0x2,
            /// Eight arbitration slots selected
            EIGHT = 0x3,
        } = .ONE,
        reserved20: u2 = 0,
        /// Source Address Increment Sign
        SRCINCSIGN: enum(u1) {
            /// Increment source address
            POSITIVE = 0x0,
            /// Decrement source address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        /// Destination Address Increment Sign
        DSTINCSIGN: enum(u1) {
            /// Increment destination address
            POSITIVE = 0x0,
            /// Decrement destination address
            NEGATIVE = 0x1,
        } = .POSITIVE,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x1b0
    CH7_LOOP: mmio.Mmio(packed struct(u32) {
        /// Linked Structure Sequence Loop Counter
        LOOPCNT: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x1b4
    CH7_CTRL: mmio.Mmio(packed struct(u32) {
        /// DMA Structure Type
        STRUCTTYPE: enum(u2) {
            /// DMA transfer structure type selected.
            TRANSFER = 0x0,
            /// Synchronization structure type selected.
            SYNCHRONIZE = 0x1,
            /// Write immediate value structure type selected.
            WRITE = 0x2,
            _,
        } = .TRANSFER,
        reserved3: u1 = 0,
        /// Structure DMA Transfer Request
        STRUCTREQ: u1 = 0x0,
        /// DMA Unit Data Transfer Count
        XFERCNT: u11 = 0x0,
        /// Endian Byte Swap
        BYTESWAP: u1 = 0x0,
        /// Block Transfer Size
        BLOCKSIZE: enum(u4) {
            /// One unit transfer per arbitration
            UNIT1 = 0x0,
            /// Two unit transfers per arbitration
            UNIT2 = 0x1,
            /// Three unit transfers per arbitration
            UNIT3 = 0x2,
            /// Four unit transfers per arbitration
            UNIT4 = 0x3,
            /// Six unit transfers per arbitration
            UNIT6 = 0x4,
            /// Eight unit transfers per arbitration
            UNIT8 = 0x5,
            /// Sixteen unit transfers per arbitration
            UNIT16 = 0x7,
            /// 32 unit transfers per arbitration
            UNIT32 = 0x9,
            /// 64 unit transfers per arbitration
            UNIT64 = 0xa,
            /// 128 unit transfers per arbitration
            UNIT128 = 0xb,
            /// 256 unit transfers per arbitration
            UNIT256 = 0xc,
            /// 512 unit transfers per arbitration
            UNIT512 = 0xd,
            /// 1024 unit transfers per arbitration
            UNIT1024 = 0xe,
            /// Transfer all units as specified by the XFRCNT field
            ALL = 0xf,
            _,
        } = .UNIT1,
        /// DMA Operation Done Interrupt Flag Set En
        DONEIEN: u1 = 0x0,
        /// DMA Request Transfer Mode Select
        REQMODE: enum(u1) {
            /// The LDMA transfers one BLOCKSIZE per transfer request.
            BLOCK = 0x0,
            /// One transfer request transfers all units as defined by the XFRCNT field.
            ALL = 0x1,
        } = .BLOCK,
        /// Decrement Loop Count
        DECLOOPCNT: u1 = 0x0,
        /// Ignore Sreq
        IGNORESREQ: u1 = 0x0,
        /// Source Address Increment Size
        SRCINC: enum(u2) {
            /// Increment source address by one unit data size after each read
            ONE = 0x0,
            /// Increment source address by two unit data sizes after each read
            TWO = 0x1,
            /// Increment source address by four unit data sizes after each read
            FOUR = 0x2,
            /// Do not increment the source address. In this mode reads are made from a fixed source address, for example reading FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Unit Data Transfer Size
        SIZE: enum(u2) {
            /// Each unit transfer is a byte
            BYTE = 0x0,
            /// Each unit transfer is a half-word
            HALFWORD = 0x1,
            /// Each unit transfer is a word
            WORD = 0x2,
            _,
        } = .BYTE,
        /// Destination Address Increment Size
        DSTINC: enum(u2) {
            /// Increment destination address by one unit data size after each write
            ONE = 0x0,
            /// Increment destination address by two unit data sizes after each write
            TWO = 0x1,
            /// Increment destination address by four unit data sizes after each write
            FOUR = 0x2,
            /// Do not increment the destination address. Writes are made to a fixed destination address, for example writing to a FIFO.
            NONE = 0x3,
        } = .ONE,
        /// Source Addressing Mode
        SRCMODE: enum(u1) {
            /// The SRCADDR field of LDMA_CHx_SRC contains the absolute address of the source data.
            ABSOLUTE = 0x0,
            /// The SRCADDR field of LDMA_CHx_SRC contains the relative offset of the source data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Destination Addressing Mode
        DSTMODE: enum(u1) {
            /// The DSTADDR field of LDMA_CHx_DST contains the absolute address of the destination data.
            ABSOLUTE = 0x0,
            /// The DSTADDR field of LDMA_CHx_DST contains the relative offset of the destination data.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
    }),
    /// No Description
    /// offset: 0x1b8
    CH7_SRC: mmio.Mmio(packed struct(u32) {
        /// Source Data Address
        SRCADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x1bc
    CH7_DST: mmio.Mmio(packed struct(u32) {
        /// Destination Data Address
        DSTADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x1c0
    CH7_LINK: mmio.Mmio(packed struct(u32) {
        /// Link Structure Addressing Mode
        LINKMODE: enum(u1) {
            /// The LINKADDR field of LDMA_CHx_LINK contains the absolute address of the linked descriptor.
            ABSOLUTE = 0x0,
            /// The LINKADDR field of LDMA_CHx_LINK contains the relative offset of the linked descriptor.
            RELATIVE = 0x1,
        } = .ABSOLUTE,
        /// Link Next Structure
        LINK: u1 = 0x0,
        /// Link Structure Address
        LINKADDR: u30 = 0x0,
    }),
};
