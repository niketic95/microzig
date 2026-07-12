const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// SYSCFG_S Registers
pub const SYSCFG_S = extern struct {
    /// offset: 0x00
    reserved0: [4]u8,
    /// No Description
    /// offset: 0x04
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// New BitField
        IPVERSION: u32 = 0x2,
    }),
    /// Read to get system status.
    /// offset: 0x08
    IF: mmio.Mmio(packed struct(u32) {
        /// Software Interrupt Flag
        SW0: u1 = 0x0,
        /// Software Interrupt Flag
        SW1: u1 = 0x0,
        /// Software Interrupt Flag
        SW2: u1 = 0x0,
        /// Software Interrupt Flag
        SW3: u1 = 0x0,
        reserved8: u4 = 0,
        /// FPU Invalid Operation interrupt flag
        FPIOC: u1 = 0x0,
        /// FPU Divide by zero interrupt flag
        FPDZC: u1 = 0x0,
        /// FPU Underflow interrupt flag
        FPUFC: u1 = 0x0,
        /// FPU Overflow interrupt flag
        FPOFC: u1 = 0x0,
        /// FPU Input denormal interrupt flag
        FPIDC: u1 = 0x0,
        /// FPU Inexact interrupt flag
        FPIXC: u1 = 0x0,
        reserved24: u10 = 0,
        /// SEQRAM Error 1-bit Interrupt Flag
        SEQRAMERR1B: u1 = 0x0,
        /// SEQRAM Error 2-bit Interrupt Flag
        SEQRAMERR2B: u1 = 0x0,
        reserved28: u2 = 0,
        /// FRCRAM Error 1-bit Interrupt Flag
        FRCRAMERR1B: u1 = 0x0,
        /// FRCRAM Error 2-bit Interrupt Flag
        FRCRAMERR2B: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// Write to enable interrupts.
    /// offset: 0x0c
    IEN: mmio.Mmio(packed struct(u32) {
        /// Software Interrupt Enable
        SW0: u1 = 0x0,
        /// Software Interrupt Enable
        SW1: u1 = 0x0,
        /// Software Interrupt Enable
        SW2: u1 = 0x0,
        /// Software Interrupt Enable
        SW3: u1 = 0x0,
        reserved8: u4 = 0,
        /// FPU Invalid Operation Interrupt Enable
        FPIOC: u1 = 0x0,
        /// FPU Divide by zero Interrupt Enable
        FPDZC: u1 = 0x0,
        /// FPU Underflow Interrupt Enable
        FPUFC: u1 = 0x0,
        /// FPU Overflow Interrupt Enable
        FPOFC: u1 = 0x0,
        /// FPU Input denormal Interrupt Enable
        FPIDC: u1 = 0x0,
        /// FPU Inexact Interrupt Enable
        FPIXC: u1 = 0x0,
        reserved24: u10 = 0,
        /// SEQRAM Error 1-bit Interrupt Enable
        SEQRAMERR1B: u1 = 0x0,
        /// SEQRAM Error 2-bit Interrupt Enable
        SEQRAMERR2B: u1 = 0x0,
        reserved28: u2 = 0,
        /// FRCRAM Error 1-bit Interrupt Enable
        FRCRAMERR1B: u1 = 0x0,
        /// FRCRAM Error 2-bit Interrupt Enable
        FRCRAMERR2B: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// offset: 0x10
    reserved16: [4]u8,
    /// Read to get the hard-wired chip revision.
    /// offset: 0x14
    CHIPREVHW: mmio.Mmio(packed struct(u32) {
        /// Hardwired Chip Revision Major value
        MAJOR: u6 = 0x1,
        /// Hardwired Chip Family value
        FAMILY: u6 = 0x38,
        /// Hardwired Chip Revision Minor value
        MINOR: u8 = 0x0,
        padding: u12 = 0,
    }),
    /// Read to get the chip revision programmed by feature configuration.
    /// offset: 0x18
    CHIPREV: mmio.Mmio(packed struct(u32) {
        /// Chip Revision Major value
        MAJOR: u6 = 0x0,
        /// Chip Family value
        FAMILY: enum(u6) {
            /// Product is in PG23 family
            PG23 = 0x1a,
            /// Product is in FG23 family
            FG23 = 0x38,
            /// Product is in ZG23 family
            ZG23 = 0x39,
            /// Product is in SG23 family
            SG23 = 0x3a,
            _,
        } = @enumFromInt(0x0),
        /// Chip Revision Minor value
        MINOR: u8 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x1c
    reserved28: [8]u8,
    /// Configure the source of the system tick for the M33.
    /// offset: 0x24
    CFGSYSTIC: mmio.Mmio(packed struct(u32) {
        /// SysTick External Clock Enable
        SYSTICEXTCLKEN: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// offset: 0x28
    reserved40: [472]u8,
    /// Configure to provide general RAM configuration.
    /// offset: 0x200
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Invalid Address Bus Fault Response Enabl
        ADDRFAULTEN: u1 = 0x1,
        /// Disabled Clkbus Bus Fault Enable
        CLKDISFAULTEN: u1 = 0x1,
        reserved5: u3 = 0,
        /// Two bit ECC error bus fault response ena
        RAMECCERRFAULTEN: u1 = 0x1,
        padding: u26 = 0,
    }),
    /// offset: 0x204
    reserved516: [4]u8,
    /// Configure to provide general RAM retention configuration.
    /// offset: 0x208
    DMEM0RETNCTRL: mmio.Mmio(packed struct(u32) {
        /// DMEM0 blockset retention control
        RAMRETNCTRL: enum(u3) {
            /// None of the RAM blocks powered down
            ALLON = 0x0,
            /// Power down RAM block 3 (address range 0x2000C000-0x20010000)
            BLK3 = 0x4,
            /// Power down RAM blocks 2 and above (address range 0x20008000-0x20010000)
            BLK2TO3 = 0x6,
            /// Power down RAM blocks 1 and above (address range 0x20004000-0x20010000)
            BLK1TO3 = 0x7,
            _,
        } = .ALLON,
        padding: u29 = 0,
    }),
    /// offset: 0x20c
    reserved524: [256]u8,
    /// Configure RAM bias configure bits.
    /// offset: 0x30c
    RAMBIASCONF: mmio.Mmio(packed struct(u32) {
        /// RAM Bias Control
        RAMBIASCTRL: enum(u4) {
            /// None
            No = 0x0,
            /// Voltage Source Bias 100mV
            VSB100 = 0x1,
            /// Voltage Source Bias 200mV
            VSB200 = 0x2,
            /// Voltage Source Bias 300mV
            VSB300 = 0x4,
            /// Voltage Source Bias 400mV
            VSB400 = 0x8,
            _,
        } = .VSB200,
        padding: u28 = 0,
    }),
    /// offset: 0x310
    reserved784: [240]u8,
    /// Configure SEQRAM Retention controls.
    /// offset: 0x400
    RADIORAMRETNCTRL: mmio.Mmio(packed struct(u32) {
        /// SEQRAM Retention Control
        SEQRAMRETNCTRL: enum(u2) {
            /// SEQRAM not powered down
            ALLON = 0x0,
            /// Power down SEQRAM block 0
            BLK0 = 0x1,
            /// Power down SEQRAM block 1
            BLK1 = 0x2,
            /// Power down all SEQRAM blocks
            ALLOFF = 0x3,
        } = .ALLON,
        reserved8: u6 = 0,
        /// FRCRAM Retention Control
        FRCRAMRETNCTRL: enum(u1) {
            /// FRCRAM not powered down
            ALLON = 0x0,
            /// Power down FRCRAM
            ALLOFF = 0x1,
        } = .ALLON,
        padding: u23 = 0,
    }),
    /// offset: 0x404
    reserved1028: [4]u8,
    /// Configure to set RAM ECC control.
    /// offset: 0x408
    RADIOECCCTRL: mmio.Mmio(packed struct(u32) {
        /// SEQRAM ECC Enable
        SEQRAMECCEN: u1 = 0x0,
        /// SEQRAM ECC Error Writeback Enable
        SEQRAMECCEWEN: u1 = 0x0,
        reserved8: u6 = 0,
        /// FRCRAM ECC Enable
        FRCRAMECCEN: u1 = 0x0,
        /// FRCRAM ECC Error Writeback Enable
        FRCRAMECCEWEN: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// offset: 0x40c
    reserved1036: [4]u8,
    /// Read to get status of the SEQRAM ECC error address.
    /// offset: 0x410
    SEQRAMECCADDR: mmio.Mmio(packed struct(u32) {
        /// SEQRAM ECC Address
        SEQRAMECCADDR: u32 = 0x0,
    }),
    /// Read to get status of the FRCRAM ECC error address.
    /// offset: 0x414
    FRCRAMECCADDR: mmio.Mmio(packed struct(u32) {
        /// FRCRAM ECC Error Address
        FRCRAMECCADDR: u32 = 0x0,
    }),
    /// Configure Host ICACHERAM retention configuration.
    /// offset: 0x418
    ICACHERAMRETNCTRL: mmio.Mmio(packed struct(u32) {
        /// ICACHERAM Retention control
        RAMRETNCTRL: enum(u1) {
            /// None of the Host ICACHE RAM blocks powered down
            ALLON = 0x0,
            /// Power down all Host ICACHE RAM blocks
            ALLOFF = 0x1,
        } = .ALLON,
        padding: u31 = 0,
    }),
    /// Configure DMEM0 port remap selection.
    /// offset: 0x41c
    DMEM0PORTMAPSEL: mmio.Mmio(packed struct(u32) {
        /// LDMA portmap selection
        LDMAPORTSEL: u1 = 0x1,
        /// SRWAES portmap selection
        SRWAESPORTSEL: u1 = 0x1,
        /// AHBSRW portmap selection
        AHBSRWPORTSEL: u1 = 0x0,
        /// SRWECA0 portmap selection
        SRWECA0PORTSEL: u1 = 0x0,
        /// SRWECA1 portmap selection
        SRWECA1PORTSEL: u1 = 0x1,
        padding: u27 = 0,
    }),
    /// offset: 0x420
    reserved1056: [480]u8,
    /// Generic data space for user to pass to root, e.g., address of struct in mem
    /// offset: 0x600
    ROOTDATA0: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// Generic data space for user to pass to root, e.g., address of struct in mem
    /// offset: 0x604
    ROOTDATA1: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// This register returns the status of the SE managed locks.
    /// offset: 0x608
    ROOTLOCKSTATUS: mmio.Mmio(packed struct(u32) {
        /// Bus Lock
        BUSLOCK: u1 = 0x1,
        /// Register Lock
        REGLOCK: u1 = 0x1,
        /// Manufacture Lock
        MFRLOCK: u1 = 0x1,
        reserved8: u5 = 0,
        /// Root Debug Lock
        ROOTDBGLOCK: u1 = 0x1,
        reserved16: u7 = 0,
        /// User Debug Access Port Lock
        USERDBGAPLOCK: u1 = 0x1,
        /// User Invasive Debug Lock
        USERDBGLOCK: u1 = 0x1,
        /// User Non-invasive Debug Lock
        USERNIDLOCK: u1 = 0x1,
        /// User Secure Invasive Debug Lock
        USERSPIDLOCK: u1 = 0x1,
        /// User Secure Non-invasive Debug Lock
        USERSPNIDLOCK: u1 = 0x1,
        /// Radio Invasive Debug Lock
        RADIOIDBGLOCK: u1 = 0x1,
        /// Radio Non-invasive Debug Lock
        RADIONIDBGLOCK: u1 = 0x1,
        reserved31: u8 = 0,
        /// E-Fuse Unlocked
        EFUSEUNLOCKED: u1 = 0x0,
    }),
    /// SE Software version
    /// offset: 0x60c
    ROOTSESWVERSION: mmio.Mmio(packed struct(u32) {
        /// SW Version
        SWVERSION: u32 = 0x0,
    }),
};
