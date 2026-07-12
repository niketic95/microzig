const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// DEVINFO Registers
pub const DEVINFO = extern struct {
    /// Version of the device info structure being used
    /// offset: 0x00
    INFO: mmio.Mmio(packed struct(u32) {
        /// CRC
        CRC: u16 = 0x0,
        /// Production Revision
        PRODREV: u8 = 0x0,
        /// DI Page Version
        DEVINFOREV: u8 = 0xC,
    }),
    /// Part description
    /// offset: 0x04
    PART: mmio.Mmio(packed struct(u32) {
        /// Device Number
        DEVICENUM: u16 = 0x0,
        /// Device Family
        FAMILYNUM: u6 = 0x0,
        reserved24: u2 = 0,
        /// Device Family
        FAMILY: enum(u6) {
            /// Flex Gecko
            FG = 0x0,
            /// Z-Wave Gecko
            ZG = 0x3,
            /// Pearl Gecko
            PG = 0x5,
            /// Sidewalk Gecko
            SG = 0x8,
            _,
        } = .FG,
        padding: u2 = 0,
    }),
    /// Flash page size and misc. chip information
    /// offset: 0x08
    MEMINFO: mmio.Mmio(packed struct(u32) {
        /// Flash Page Size
        FLASHPAGESIZE: u8 = 0x0,
        /// User Data Page Size
        UDPAGESIZE: u8 = 0x0,
        /// Length of DI Page
        DILEN: u16 = 0x0,
    }),
    /// Flash and SRAM Memory size in kB
    /// offset: 0x0c
    MSIZE: mmio.Mmio(packed struct(u32) {
        /// Flash Size
        FLASH: u16 = 0x0,
        /// Sram Size
        SRAM: u11 = 0x0,
        padding: u5 = 0,
    }),
    /// Miscellaneous device information
    /// offset: 0x10
    PKGINFO: mmio.Mmio(packed struct(u32) {
        /// Temperature Grade
        TEMPGRADE: enum(u8) {
            /// -40 to 85 degC
            N40TO85 = 0x0,
            /// -40 to 125 degC
            N40TO125 = 0x1,
            /// -40 to 105 degC
            N40TO105 = 0x2,
            /// 0 to 70 degC
            N0TO70 = 0x3,
            _,
        } = .N40TO85,
        /// Package Type
        PKGTYPE: enum(u8) {
            /// WLCSP package
            WLCSP = 0x4a,
            /// BGA package
            BGA = 0x4c,
            /// QFN package
            QFN = 0x4d,
            /// QFP package
            QFP = 0x51,
            _,
        } = @enumFromInt(0x0),
        /// Pin Count
        PINCOUNT: u8 = 0x0,
        padding: u8 = 0,
    }),
    /// Custom information
    /// offset: 0x14
    CUSTOMINFO: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Part Number
        PARTNO: u16 = 0x0,
    }),
    /// Used to track s/w workaround info
    /// offset: 0x18
    SWFIX: mmio.Mmio(packed struct(u32) {
        /// Reserved
        RSV: u32 = 0xFFFFFFFF,
    }),
    /// Software Capability Vector 0
    /// offset: 0x1c
    SWCAPA0: mmio.Mmio(packed struct(u32) {
        /// Zigbee Capability
        ZIGBEE: enum(u2) {
            /// ZigBee stack capability not available
            LEVEL0 = 0x0,
            /// GreenPower only
            LEVEL1 = 0x1,
            /// ZigBee and GreenPower
            LEVEL2 = 0x2,
            /// ZigBee Only
            LEVEL3 = 0x3,
        } = .LEVEL0,
        reserved4: u2 = 0,
        /// Thread Capability
        THREAD: enum(u2) {
            /// RF4CE stack capability not available
            LEVEL0 = 0x0,
            /// RF4CE stack enabled
            LEVEL1 = 0x1,
            /// N/A
            LEVEL2 = 0x2,
            /// N/A
            LEVEL3 = 0x3,
        } = .LEVEL0,
        reserved8: u2 = 0,
        /// RF4CE Capability
        RF4CE: enum(u2) {
            /// Thread stack capability not available
            LEVEL0 = 0x0,
            /// Thread stack enabled
            LEVEL1 = 0x1,
            /// N/A
            LEVEL2 = 0x2,
            /// N/A
            LEVEL3 = 0x3,
        } = .LEVEL0,
        reserved12: u2 = 0,
        /// Bluetooth Smart Capability
        BTSMART: enum(u2) {
            /// Bluetooth SMART stack capability not available
            LEVEL0 = 0x0,
            /// Bluetooth SMART enabled
            LEVEL1 = 0x1,
            /// N/A
            LEVEL2 = 0x2,
            /// N/A
            LEVEL3 = 0x3,
        } = .LEVEL0,
        reserved16: u2 = 0,
        /// Connect Capability
        CONNECT: enum(u2) {
            /// Connect stack capability not available
            LEVEL0 = 0x0,
            /// Connect enabled
            LEVEL1 = 0x1,
            /// N/A
            LEVEL2 = 0x2,
            /// N/A
            LEVEL3 = 0x3,
        } = .LEVEL0,
        reserved20: u2 = 0,
        /// RAIL Capability
        SRI: enum(u2) {
            /// RAIL capability not available
            LEVEL0 = 0x0,
            /// RAIL enabled
            LEVEL1 = 0x1,
            /// N/A
            LEVEL2 = 0x2,
            /// N/A
            LEVEL3 = 0x3,
        } = .LEVEL0,
        reserved24: u2 = 0,
        /// Z-Wave Capability
        ZWAVE: enum(u3) {
            /// Z-Wave stack capability not available
            LEVEL0 = 0x0,
            /// Z-Wave Gateway
            LEVEL1 = 0x1,
            /// Z-Wave End Device
            LEVEL2 = 0x2,
            /// Z-Wave Sensor
            LEVEL3 = 0x3,
            /// Z-Wave Lighting
            LEVEL4 = 0x4,
            _,
        } = .LEVEL0,
        padding: u5 = 0,
    }),
    /// Software Capability Vector 1
    /// offset: 0x20
    SWCAPA1: mmio.Mmio(packed struct(u32) {
        /// RF-MCU
        RFMCUEN: u1 = 0x0,
        /// NCP
        NCPEN: u1 = 0x0,
        /// Gateway
        GWEN: u1 = 0x0,
        /// XOUT
        XOUT: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// offset: 0x24
    reserved36: [4]u8,
    /// External component description
    /// offset: 0x28
    EXTINFO: mmio.Mmio(packed struct(u32) {
        /// Type
        TYPE: enum(u8) {
            /// NONE
            NONE = 0xff,
            _,
        } = @enumFromInt(0x0),
        /// Connection
        CONNECTION: enum(u8) {
            /// SPI control interface
            SPI = 0x0,
            /// No interface
            NONE = 0xff,
            _,
        } = .SPI,
        /// Revision
        REV: u8 = 0x0,
        padding: u8 = 0,
    }),
    /// offset: 0x2c
    reserved44: [20]u8,
    /// MA-L compliant EUI48 OUI (low bits) and Unique Identifier (24-bit)
    /// offset: 0x40
    EUI48L: mmio.Mmio(packed struct(u32) {
        /// Unique ID
        UNIQUEID: u24 = 0x0,
        /// OUI48L
        OUI48L: u8 = 0x0,
    }),
    /// MA-L compliant EUI48 OUI (high bits)
    /// offset: 0x44
    EUI48H: mmio.Mmio(packed struct(u32) {
        /// OUI48H
        OUI48H: u16 = 0x0,
        /// RESERVED
        RESERVED: u16 = 0xFFFF,
    }),
    /// MA-L compliant EUI64 Unique Identifier (low bits)
    /// offset: 0x48
    EUI64L: mmio.Mmio(packed struct(u32) {
        /// UNIQUEL
        UNIQUEL: u32 = 0x0,
    }),
    /// MA-L compliant EUI64 OUI and Unique Identifier (high bits)
    /// offset: 0x4c
    EUI64H: mmio.Mmio(packed struct(u32) {
        /// UNIQUEH
        UNIQUEH: u8 = 0x0,
        /// OUI64
        OUI64: u24 = 0x0,
    }),
    /// Calibration Temperature Information
    /// offset: 0x50
    CALTEMP: mmio.Mmio(packed struct(u32) {
        /// Cal Temp
        TEMP: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// EMU Temperature Sensor Calibration
    /// offset: 0x54
    EMUTEMP: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Emu Room Temperature
        EMUTEMPROOM: u9 = 0x0,
        padding: u21 = 0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x58
    HFRCODPLLCAL0: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x5c
    HFRCODPLLCAL1: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x60
    HFRCODPLLCAL2: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x64
    HFRCODPLLCAL3: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x68
    HFRCODPLLCAL4: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x6c
    HFRCODPLLCAL5: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x70
    HFRCODPLLCAL6: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x74
    HFRCODPLLCAL7: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x78
    HFRCODPLLCAL8: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x7c
    HFRCODPLLCAL9: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x80
    HFRCODPLLCAL10: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x84
    HFRCODPLLCAL11: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x88
    HFRCODPLLCAL12: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x8c
    HFRCODPLLCAL13: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x90
    HFRCODPLLCAL14: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x94
    HFRCODPLLCAL15: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x98
    HFRCODPLLCAL16: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCODPLL Calibration
    /// offset: 0x9c
    HFRCODPLLCAL17: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xa0
    HFRCOEM23CAL0: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xa4
    HFRCOEM23CAL1: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xa8
    HFRCOEM23CAL2: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xac
    HFRCOEM23CAL3: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xb0
    HFRCOEM23CAL4: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xb4
    HFRCOEM23CAL5: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xb8
    HFRCOEM23CAL6: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xbc
    HFRCOEM23CAL7: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xc0
    HFRCOEM23CAL8: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xc4
    HFRCOEM23CAL9: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xc8
    HFRCOEM23CAL10: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xcc
    HFRCOEM23CAL11: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xd0
    HFRCOEM23CAL12: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xd4
    HFRCOEM23CAL13: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xd8
    HFRCOEM23CAL14: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xdc
    HFRCOEM23CAL15: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xe0
    HFRCOEM23CAL16: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// HFRCOEM23 Calibration
    /// offset: 0xe4
    HFRCOEM23CAL17: mmio.Mmio(packed struct(u32) {
        /// No Description
        TUNING: u7 = 0x0,
        reserved8: u1 = 0,
        /// No Description
        FINETUNING: u6 = 0x0,
        reserved15: u1 = 0,
        /// No Description
        LDOHP: u1 = 0x0,
        /// No Description
        FREQRANGE: u5 = 0x0,
        /// No Description
        CMPBIAS: u3 = 0x0,
        /// No Description
        CLKDIV: u2 = 0x0,
        /// No Description
        CMPSEL: u2 = 0x0,
        /// No Description
        IREFTC: u4 = 0x0,
    }),
    /// offset: 0xe8
    reserved232: [72]u8,
    /// Characters 1-4 of Module Name stored as a null terminated string
    /// offset: 0x130
    MODULENAME0: mmio.Mmio(packed struct(u32) {
        /// No Description
        MODCHAR1: u8 = 0xFF,
        /// No Description
        MODCHAR2: u8 = 0xFF,
        /// No Description
        MODCHAR3: u8 = 0xFF,
        /// No Description
        MODCHAR4: u8 = 0xFF,
    }),
    /// Characters 5-8 of Module Name stored as a null terminated string
    /// offset: 0x134
    MODULENAME1: mmio.Mmio(packed struct(u32) {
        /// No Description
        MODCHAR5: u8 = 0xFF,
        /// No Description
        MODCHAR6: u8 = 0xFF,
        /// No Description
        MODCHAR7: u8 = 0xFF,
        /// No Description
        MODCHAR8: u8 = 0xFF,
    }),
    /// Characters 9-12 of Module Name stored as a null terminated string
    /// offset: 0x138
    MODULENAME2: mmio.Mmio(packed struct(u32) {
        /// No Description
        MODCHAR9: u8 = 0xFF,
        /// No Description
        MODCHAR10: u8 = 0xFF,
        /// No Description
        MODCHAR11: u8 = 0xFF,
        /// No Description
        MODCHAR12: u8 = 0xFF,
    }),
    /// Characters 13-16 of Module Name stored as a null terminated string
    /// offset: 0x13c
    MODULENAME3: mmio.Mmio(packed struct(u32) {
        /// No Description
        MODCHAR13: u8 = 0xFF,
        /// No Description
        MODCHAR14: u8 = 0xFF,
        /// No Description
        MODCHAR15: u8 = 0xFF,
        /// No Description
        MODCHAR16: u8 = 0xFF,
    }),
    /// Characters 17-20 of Module Name stored as a null terminated string
    /// offset: 0x140
    MODULENAME4: mmio.Mmio(packed struct(u32) {
        /// No Description
        MODCHAR17: u8 = 0xFF,
        /// No Description
        MODCHAR18: u8 = 0xFF,
        /// No Description
        MODCHAR19: u8 = 0xFF,
        /// No Description
        MODCHAR20: u8 = 0xFF,
    }),
    /// Characters 21-24 of Module Name stored as a null terminated string
    /// offset: 0x144
    MODULENAME5: mmio.Mmio(packed struct(u32) {
        /// No Description
        MODCHAR21: u8 = 0xFF,
        /// No Description
        MODCHAR22: u8 = 0xFF,
        /// No Description
        MODCHAR23: u8 = 0xFF,
        /// No Description
        MODCHAR24: u8 = 0xFF,
    }),
    /// Characters 25-26 of Module Name stored as a null terminated string
    /// offset: 0x148
    MODULENAME6: mmio.Mmio(packed struct(u32) {
        /// No Description
        MODCHAR25: u8 = 0xFF,
        /// No Description
        MODCHAR26: u8 = 0xFF,
        /// No Description
        RSV: u16 = 0xFFFF,
    }),
    /// Module Information
    /// offset: 0x14c
    MODULEINFO: mmio.Mmio(packed struct(u32) {
        /// No Description
        HWREV: u5 = 0x1F,
        /// No Description
        ANTENNA: enum(u3) {
            /// BUILTIN
            BUILTIN = 0x0,
            /// CONNECTOR
            CONNECTOR = 0x1,
            /// RFPAD
            RFPAD = 0x2,
            /// INVERTEDF
            INVERTEDF = 0x3,
            _,
        } = @enumFromInt(0x7),
        /// No Description
        MODNUMBER: u7 = 0x7F,
        /// No Description
        TYPE: enum(u1) {
            /// PCB
            PCB = 0x0,
            /// SIP
            SIP = 0x1,
        } = .SIP,
        /// No Description
        LFXO: enum(u1) {
            /// NONE
            NONE = 0x0,
            /// PRESENT
            PRESENT = 0x1,
        } = .PRESENT,
        /// No Description
        EXPRESS: enum(u1) {
            /// SUPPORTED
            SUPPORTED = 0x0,
            /// NONE
            NONE = 0x1,
        } = .NONE,
        /// No Description
        LFXOCALVAL: enum(u1) {
            /// VALID
            VALID = 0x0,
            /// NOTVALID
            NOTVALID = 0x1,
        } = .NOTVALID,
        /// No Description
        HFXOCALVAL: enum(u1) {
            /// VALID
            VALID = 0x0,
            /// NOTVALID
            NOTVALID = 0x1,
        } = .NOTVALID,
        /// No Description
        MODNUMBERMSB: u9 = 0x1FF,
        /// No Description
        PADCDC: enum(u1) {
            /// VDCDC
            VDCDC = 0x0,
            /// OTHER
            OTHER = 0x1,
        } = .OTHER,
        /// No Description
        PHYLIMITED: enum(u1) {
            /// LIMITED
            LIMITED = 0x0,
            /// UNLIMITED
            UNLIMITED = 0x1,
        } = .UNLIMITED,
        /// No Description
        EXTVALID: enum(u1) {
            /// EXTUSED
            EXTUSED = 0x0,
            /// EXTUNUSED
            EXTUNUSED = 0x1,
        } = .EXTUNUSED,
    }),
    /// Module Crystal Oscillator Calibration
    /// offset: 0x150
    MODXOCAL: mmio.Mmio(packed struct(u32) {
        /// No Description
        HFXOCTUNEXIANA: u8 = 0xFF,
        /// No Description
        HFXOCTUNEXOANA: u8 = 0xFF,
        /// No Description
        LFXOCAPTUNE: u7 = 0x7F,
        padding: u9 = 0,
    }),
    /// offset: 0x154
    reserved340: [40]u8,
    /// High Frequency Crystal Oscillator Calibration data
    /// offset: 0x17c
    HFXOCAL: mmio.Mmio(packed struct(u32) {
        /// No Description
        SHUNTBIASANA: enum(u4) {
            /// I20UA
            I20UA = 0x0,
            /// I30UA
            I30UA = 0x1,
            /// I40UA
            I40UA = 0x2,
            /// I50UA
            I50UA = 0x3,
            /// I60UA
            I60UA = 0x4,
            /// I70UA
            I70UA = 0x5,
            /// I80UA
            I80UA = 0x6,
            /// I90UA
            I90UA = 0x7,
            /// I100UA
            I100UA = 0x8,
            /// I110UA
            I110UA = 0x9,
            /// I120UA
            I120UA = 0xa,
            /// I130UA
            I130UA = 0xb,
            /// I140UA
            I140UA = 0xc,
            /// I150UA
            I150UA = 0xd,
            /// I160UA
            I160UA = 0xe,
            /// I170UA
            I170UA = 0xf,
        } = .I20UA,
        /// No Description
        VTRTRIMANA: u4 = 0x0,
        /// New BitField
        RESERVED: u24 = 0xFFFFFF,
    }),
    /// IADC0 Gain Calibration Info
    /// offset: 0x180
    IADC0GAIN0: mmio.Mmio(packed struct(u32) {
        /// No Description
        GAINCANA1: u16 = 0x0,
        /// No Description
        GAINCANA2: u16 = 0x0,
    }),
    /// IADC0 Gain Calibration Info
    /// offset: 0x184
    IADC0GAIN1: mmio.Mmio(packed struct(u32) {
        /// No Description
        GAINCANA3: u16 = 0x0,
        /// No Description
        GAINCANA4: u16 = 0x0,
    }),
    /// IADC0 Offset Calibration Info
    /// offset: 0x188
    IADC0OFFSETCAL0: mmio.Mmio(packed struct(u32) {
        /// No Description
        OFFSETANABASE: u16 = 0x0,
        /// No Description
        OFFSETANA1HIACC: u16 = 0x0,
    }),
    /// IADC0 Normal Offset Calibration Info
    /// offset: 0x18c
    IADC0NORMALOFFSETCAL0: mmio.Mmio(packed struct(u32) {
        /// No Description
        OFFSETANA1NORM: u16 = 0x0,
        /// No Description
        OFFSETANA2NORM: u16 = 0x0,
    }),
    /// IADC0 Normal Offset Calibration Info
    /// offset: 0x190
    IADC0NORMALOFFSETCAL1: mmio.Mmio(packed struct(u32) {
        /// No Description
        OFFSETANA3NORM: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// IADC High Speed Offset Calibration Info
    /// offset: 0x194
    IADC0HISPDOFFSETCAL0: mmio.Mmio(packed struct(u32) {
        /// No Description
        OFFSETANA1HISPD: u16 = 0x0,
        /// No Description
        OFFSETANA2HISPD: u16 = 0x0,
    }),
    /// IADC High Speed Offset Calibration Info
    /// offset: 0x198
    IADC0HISPDOFFSETCAL1: mmio.Mmio(packed struct(u32) {
        /// No Description
        OFFSETANA3HISPD: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x19c
    reserved412: [96]u8,
    /// This is the legacy device detection information for tools compatability
    /// offset: 0x1fc
    LEGACY: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Device Family
        DEVICEFAMILY: enum(u8) {
            /// EFR32 Mighty Gecko Family Series 1 Device Config 1
            EFR32MG1P = 0x10,
            /// EFR32 Mighty Gecko Family Series 1 Device Config 1
            EFR32MG1B = 0x11,
            /// EFR32 Mighty Gecko Family Series 1 Device Config 1
            EFR32MG1V = 0x12,
            /// EFR32 Blue Gecko Family Series 1 Device Config 1
            EFR32BG1P = 0x13,
            /// EFR32 Blue Gecko Family Series 1 Device Config 1
            EFR32BG1B = 0x14,
            /// EFR32 Blue Gecko Family Series 1 Device Config 1
            EFR32BG1V = 0x15,
            /// EFR32 Flex Gecko Family Series 1 Device Config 1
            EFR32FG1P = 0x19,
            /// EFR32 Flex Gecko Family Series 1 Device Config 1
            EFR32FG1B = 0x1a,
            /// EFR32 Flex Gecko Family Series 1 Device Config 1
            EFR32FG1V = 0x1b,
            /// EFR32 Mighty Gecko Family Series 1 Device Config 2
            EFR32MG12P = 0x1c,
            /// EFR32 Mighty Gecko Family Series 1 Device Config 2
            EFR32MG12B = 0x1d,
            /// EFR32 Mighty Gecko Family Series 1 Device Config 2
            EFR32MG12V = 0x1e,
            /// EFR32 Blue Gecko Family Series 1 Device Config 2
            EFR32BG12P = 0x1f,
            /// EFR32 Blue Gecko Family Series 1 Device Config 2
            EFR32BG12B = 0x20,
            /// EFR32 Blue Gecko Family Series 1 Device Config 2
            EFR32BG12V = 0x21,
            /// EFR32 Flex Gecko Family Series 1 Device Config 2
            EFR32FG12P = 0x25,
            /// EFR32 Flex Gecko Family Series 1 Device Config 2
            EFR32FG12B = 0x26,
            /// EFR32 Flex Gecko Family Series 1 Device Config 2
            EFR32FG12V = 0x27,
            /// EFR32 Mighty Gecko Family Series 13 Device Config 3
            EFR32MG13P = 0x28,
            /// EFR32 Mighty Gecko Family Series 13 Device Config 3
            EFR32MG13B = 0x29,
            /// EFR32 Mighty Gecko Family Series 1 Device Config 3
            EFR32MG13V = 0x2a,
            /// EFR32 Blue Gecko Family Series 1 Device Config 3
            EFR32BG13P = 0x2b,
            /// EFR32 Blue Gecko Family Series 1 Device Config 3
            EFR32BG13B = 0x2c,
            /// EFR32 Blue Gecko Family Series 1 Device Config 3
            EFR32BG13V = 0x2d,
            /// EFR32 Flex Gecko Family Series 1 Device Config 3
            EFR32FG13P = 0x31,
            /// EFR32 Flex Gecko Family Series 1 Device Config 3
            EFR32FG13B = 0x32,
            /// EFR32 Flex Gecko Family Series 1 Device Config 3
            EFR32FG13V = 0x33,
            /// EFR32 Mighty Gecko Family Series 1 Device Config 4
            EFR32MG14P = 0x34,
            /// EFR32 Mighty Gecko Family Series 1 Device Config 4
            EFR32MG14B = 0x35,
            /// EFR32 Mighty Gecko Family Series 1 Device Config 4
            EFR32MG14V = 0x36,
            /// EFR32 Blue Gecko Family Series 1 Device Config 4
            EFR32BG14P = 0x37,
            /// EFR32 Blue Gecko Family Series 1 Device Config 4
            EFR32BG14B = 0x38,
            /// EFR32 Blue Gecko Family Series 1 Device Config 4
            EFR32BG14V = 0x39,
            /// EFR32 Flex Gecko Family Series 1 Device Config 4
            EFR32FG14P = 0x3d,
            /// EFR32 Flex Gecko Family Series 1 Device Config 4
            EFR32FG14B = 0x3e,
            /// EFR32 Flex Gecko Family Series 1 Device Config 4
            EFR32FG14V = 0x3f,
            /// EFM32 Gecko Device Family
            EFM32G = 0x47,
            /// EFM32 Giant Gecko Device Family
            EFM32GG = 0x48,
            /// EFM32 Tiny Gecko Device Family
            EFM32TG = 0x49,
            /// EFM32 Leopard Gecko Device Family
            EFM32LG = 0x4a,
            /// EFM32 Wonder Gecko Device Family
            EFM32WG = 0x4b,
            /// EFM32 Zero Gecko Device Family
            EFM32ZG = 0x4c,
            /// EFM32 Happy Gecko Device Family
            EFM32HG = 0x4d,
            /// EFM32 Pearl Gecko Device Family Series 1 Device Config 1
            EFM32PG1B = 0x51,
            /// EFM32 Jade Gecko Device Family Series 1 Device Config 1
            EFM32JG1B = 0x53,
            /// EFM32 Pearl Gecko Device Family Series 1 Device Config 2
            EFM32PG12B = 0x55,
            /// EFM32 Jade Gecko Device Family Series 1 Device Config 2
            EFM32JG12B = 0x57,
            /// EFM32 Pearl Gecko Device Family Series 1 Device Config 3
            EFM32PG13B = 0x59,
            /// EFM32 Jade Gecko Device Family Series 1 Device Config 3
            EFM32JG13B = 0x5b,
            /// EFM32 Giant Gecko Device Family Series 1 Device Config 1
            EFM32GG11B = 0x64,
            /// EFM32 Giant Gecko Device Family Series 1 Device Config 1
            EFM32TG11B = 0x67,
            /// EZR32 Leopard Gecko Device Family
            EZR32LG = 0x78,
            /// EZR32 Wonder Gecko Device Family
            EZR32WG = 0x79,
            /// EZR32 Happy Gecko Device Family
            EZR32HG = 0x7a,
            /// DI page is encoded with the series 2 layout. Check alternate location.
            SERIES2V0 = 0x80,
            _,
        } = .SERIES2V0,
        padding: u8 = 0,
    }),
    /// offset: 0x200
    reserved512: [92]u8,
    /// RTHERM
    /// offset: 0x25c
    RTHERM: mmio.Mmio(packed struct(u32) {
        /// No Description
        RTHERM: u16 = 0x0,
        padding: u16 = 0,
    }),
};
