const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// SMU_S Registers
pub const SMU_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP Version
        IPVERSION: u32 = 0x2,
    }),
    /// No Description
    /// offset: 0x04
    STATUS: mmio.Mmio(packed struct(u32) {
        /// SMU Lock
        SMULOCK: enum(u1) {
            /// UNLOCKED
            UNLOCKED = 0x0,
            /// LOCKED
            LOCKED = 0x1,
        } = .UNLOCKED,
        /// SMU Programming Error
        SMUPRGERR: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x08
    LOCK: mmio.Mmio(packed struct(u32) {
        /// No Description
        SMULOCKKEY: enum(u24) {
            /// Unlocks Registers
            UNLOCK = 0xacce55,
            _,
        } = @enumFromInt(0x0),
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    IF: mmio.Mmio(packed struct(u32) {
        /// PPU Privilege Interrupt Flag
        PPUPRIV: u1 = 0x0,
        reserved2: u1 = 0,
        /// PPU Instruction Interrupt Flag
        PPUINST: u1 = 0x0,
        reserved16: u13 = 0,
        /// PPU Security Interrupt Flag
        PPUSEC: u1 = 0x0,
        /// BMPU Security Interrupt Flag
        BMPUSEC: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0x10
    IEN: mmio.Mmio(packed struct(u32) {
        /// PPU Privilege Interrupt Enable
        PPUPRIV: u1 = 0x0,
        reserved2: u1 = 0,
        /// PPU Instruction Interrupt Enable
        PPUINST: u1 = 0x0,
        reserved16: u13 = 0,
        /// PPU Security Interrupt Enable
        PPUSEC: u1 = 0x0,
        /// BMPU Security Interrupt Enable
        BMPUSEC: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// offset: 0x14
    reserved20: [12]u8,
    /// Holds the M33 control settings
    /// offset: 0x20
    M33CTRL: mmio.Mmio(packed struct(u32) {
        /// New BitField
        LOCKSVTAIRCR: u1 = 0x0,
        /// New BitField
        LOCKNSVTOR: u1 = 0x0,
        /// New BitField
        LOCKSMPU: u1 = 0x0,
        /// New BitField
        LOCKNSMPU: u1 = 0x0,
        /// New BitField
        LOCKSAU: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// offset: 0x24
    reserved36: [28]u8,
    /// Set peripheral bits to 1 to mark as privileged access only
    /// offset: 0x40
    PPUPATD0: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// EMU Privileged Access
        EMU: u1 = 0x1,
        /// CMU Privileged Access
        CMU: u1 = 0x1,
        /// HFRCO0 Privileged Access
        HFRCO0: u1 = 0x1,
        /// FSRCO Privileged Access
        FSRCO: u1 = 0x1,
        /// DPLL0 Privileged Access
        DPLL0: u1 = 0x1,
        /// LFXO Privileged Access
        LFXO: u1 = 0x1,
        /// LFRCO Privileged Access
        LFRCO: u1 = 0x1,
        /// ULFRCO Privileged Access
        ULFRCO: u1 = 0x1,
        /// MSC Privileged Access
        MSC: u1 = 0x1,
        /// ICACHE0 Privileged Access
        ICACHE0: u1 = 0x1,
        /// PRS Privileged Access
        PRS: u1 = 0x1,
        /// GPIO Privileged Access
        GPIO: u1 = 0x1,
        /// LDMA Privileged Access
        LDMA: u1 = 0x1,
        /// LDMAXBAR Privileged Access
        LDMAXBAR: u1 = 0x1,
        /// TIMER0 Privileged Access
        TIMER0: u1 = 0x1,
        /// TIMER1 Privileged Access
        TIMER1: u1 = 0x1,
        /// TIMER2 Privileged Access
        TIMER2: u1 = 0x1,
        /// TIMER3 Privileged Access
        TIMER3: u1 = 0x1,
        /// TIMER4 Privileged Access
        TIMER4: u1 = 0x1,
        /// USART0 Privileged Access
        USART0: u1 = 0x1,
        /// BURTC Privileged Access
        BURTC: u1 = 0x1,
        /// I2C1 Privileged Access
        I2C1: u1 = 0x1,
        /// CHIPTESTCTRL Privileged Access
        CHIPTESTCTRL: u1 = 0x1,
        /// SYSCFGCFGNS Privileged Access
        SYSCFGCFGNS: u1 = 0x1,
        /// SYSCFG Privileged Access
        SYSCFG: u1 = 0x1,
        /// BURAM Privileged Access
        BURAM: u1 = 0x1,
        /// GPCRC Privileged Access
        GPCRC: u1 = 0x1,
        /// DCDC Privileged Access
        DCDC: u1 = 0x1,
        /// HOSTMAILBOX Privileged Access
        HOSTMAILBOX: u1 = 0x1,
        /// EUSART1 Privileged Access
        EUSART1: u1 = 0x1,
        /// EUSART2 Privileged Access
        EUSART2: u1 = 0x1,
    }),
    /// Set peripheral bits to 1 to mark as privileged access only
    /// offset: 0x44
    PPUPATD1: mmio.Mmio(packed struct(u32) {
        /// SYSRTC Privileged Access
        SYSRTC: u1 = 0x1,
        /// LCD Privileged Access
        LCD: u1 = 0x1,
        /// KEYSCAN Privileged Access
        KEYSCAN: u1 = 0x1,
        /// DMEM Privileged Access
        DMEM: u1 = 0x1,
        /// LCDRF Privileged Access
        LCDRF: u1 = 0x1,
        /// PFMXPPRF Privileged Access
        PFMXPPRF: u1 = 0x1,
        /// RADIOAES Privileged Access
        RADIOAES: u1 = 0x1,
        /// SMU Privileged Access
        SMU: u1 = 0x1,
        /// SMUCFGNS Privileged Access
        SMUCFGNS: u1 = 0x1,
        /// LETIMER0 Privileged Access
        LETIMER0: u1 = 0x1,
        /// IADC0 Privileged Access
        IADC0: u1 = 0x1,
        /// ACMP0 Privileged Access
        ACMP0: u1 = 0x1,
        /// ACMP1 Privileged Access
        ACMP1: u1 = 0x1,
        /// AMUXCP0 Privileged Access
        AMUXCP0: u1 = 0x1,
        /// VDAC0 Privileged Access
        VDAC0: u1 = 0x1,
        /// PCNT Privileged Access
        PCNT: u1 = 0x1,
        /// LESENSE Privileged Access
        LESENSE: u1 = 0x1,
        /// HFRCO1 Privileged Access
        HFRCO1: u1 = 0x1,
        /// HFXO0 Privileged Access
        HFXO0: u1 = 0x1,
        /// I2C0 Privileged Access
        I2C0: u1 = 0x1,
        /// WDOG0 Privileged Access
        WDOG0: u1 = 0x1,
        /// WDOG1 Privileged Access
        WDOG1: u1 = 0x1,
        /// EUSART0 Privileged Access
        EUSART0: u1 = 0x1,
        /// SEMAILBOX Privileged Access
        SEMAILBOX: u1 = 0x1,
        /// AHBRADIO Privileged Access
        AHBRADIO: u1 = 0x1,
        padding: u7 = 0,
    }),
    /// offset: 0x48
    reserved72: [24]u8,
    /// Set peripheral bits to 1 to mark as secure access only
    /// offset: 0x60
    PPUSATD0: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// EMU Secure Access
        EMU: u1 = 0x1,
        /// CMU Secure Access
        CMU: u1 = 0x1,
        /// HFRCO0 Secure Access
        HFRCO0: u1 = 0x1,
        /// FSRCO Secure Access
        FSRCO: u1 = 0x1,
        /// DPLL0 Secure Access
        DPLL0: u1 = 0x1,
        /// LFXO Secure Access
        LFXO: u1 = 0x1,
        /// LFRCO Secure Access
        LFRCO: u1 = 0x1,
        /// ULFRCO Secure Access
        ULFRCO: u1 = 0x1,
        /// MSC Secure Access
        MSC: u1 = 0x1,
        /// ICACHE0 Secure Access
        ICACHE0: u1 = 0x1,
        /// PRS Secure Access
        PRS: u1 = 0x1,
        /// GPIO Secure Access
        GPIO: u1 = 0x1,
        /// LDMA Secure Access
        LDMA: u1 = 0x1,
        /// LDMAXBAR Secure Access
        LDMAXBAR: u1 = 0x1,
        /// TIMER0 Secure Access
        TIMER0: u1 = 0x1,
        /// TIMER1 Secure Access
        TIMER1: u1 = 0x1,
        /// TIMER2 Secure Access
        TIMER2: u1 = 0x1,
        /// TIMER3 Secure Access
        TIMER3: u1 = 0x1,
        /// TIMER4 Secure Access
        TIMER4: u1 = 0x1,
        /// USART0 Secure Access
        USART0: u1 = 0x1,
        /// BURTC Secure Access
        BURTC: u1 = 0x1,
        /// I2C1 Secure Access
        I2C1: u1 = 0x1,
        /// CHIPTESTCTRL Secure Access
        CHIPTESTCTRL: u1 = 0x1,
        /// SYSCFGCFGNS Secure Access
        SYSCFGCFGNS: u1 = 0x1,
        /// SYSCFG Secure Access
        SYSCFG: u1 = 0x1,
        /// BURAM Secure Access
        BURAM: u1 = 0x1,
        /// GPCRC Secure Access
        GPCRC: u1 = 0x1,
        /// DCDC Secure Access
        DCDC: u1 = 0x1,
        /// HOSTMAILBOX Secure Access
        HOSTMAILBOX: u1 = 0x1,
        /// EUSART1 Secure Access
        EUSART1: u1 = 0x1,
        /// EUSART2 Secure Access
        EUSART2: u1 = 0x1,
    }),
    /// Set peripheral bits to 1 to mark as secure access only
    /// offset: 0x64
    PPUSATD1: mmio.Mmio(packed struct(u32) {
        /// SYSRTC Secure Access
        SYSRTC: u1 = 0x1,
        /// LCD Secure Access
        LCD: u1 = 0x1,
        /// KEYSCAN Secure Access
        KEYSCAN: u1 = 0x1,
        /// DMEM Secure Access
        DMEM: u1 = 0x1,
        /// LCDRF Secure Access
        LCDRF: u1 = 0x1,
        /// PFMXPPRF Secure Access
        PFMXPPRF: u1 = 0x1,
        /// RADIOAES Secure Access
        RADIOAES: u1 = 0x1,
        /// SMU Secure Access
        SMU: u1 = 0x1,
        /// SMUCFGNS Secure Access
        SMUCFGNS: u1 = 0x1,
        /// LETIMER0 Secure Access
        LETIMER0: u1 = 0x1,
        /// IADC0 Secure Access
        IADC0: u1 = 0x1,
        /// ACMP0 Secure Access
        ACMP0: u1 = 0x1,
        /// ACMP1 Secure Access
        ACMP1: u1 = 0x1,
        /// AMUXCP0 Secure Access
        AMUXCP0: u1 = 0x1,
        /// VDAC0 Secure Access
        VDAC0: u1 = 0x1,
        /// PCNT Secure Access
        PCNT: u1 = 0x1,
        /// LESENSE Secure Access
        LESENSE: u1 = 0x1,
        /// HFRCO1 Secure Access
        HFRCO1: u1 = 0x1,
        /// HFXO0 Secure Access
        HFXO0: u1 = 0x1,
        /// I2C0 Secure Access
        I2C0: u1 = 0x1,
        /// WDOG0 Secure Access
        WDOG0: u1 = 0x1,
        /// WDOG1 Secure Access
        WDOG1: u1 = 0x1,
        /// EUSART0 Secure Access
        EUSART0: u1 = 0x1,
        /// SEMAILBOX Secure Access
        SEMAILBOX: u1 = 0x1,
        /// AHBRADIO Secure Access
        AHBRADIO: u1 = 0x1,
        padding: u7 = 0,
    }),
    /// offset: 0x68
    reserved104: [216]u8,
    /// No Description
    /// offset: 0x140
    PPUFS: mmio.Mmio(packed struct(u32) {
        /// Peripheral ID
        PPUFSPERIPHID: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// offset: 0x144
    reserved324: [12]u8,
    /// Set master bits to 1 to mark as a privileged master
    /// offset: 0x150
    BMPUPATD0: mmio.Mmio(packed struct(u32) {
        /// RADIO AES DMA privileged mode
        RADIOAES: u1 = 0x1,
        /// RADIO subsystem manager privileged mode
        RADIOSUBSYSTEM: u1 = 0x1,
        /// MCU LDMA privileged mode
        LDMA: u1 = 0x1,
        /// RFECA0 privileged mode
        RFECA0: u1 = 0x1,
        /// RFECA1 privileged mode
        RFECA1: u1 = 0x1,
        /// SEEXTDMA privileged mode
        SEEXTDMA: u1 = 0x1,
        padding: u26 = 0,
    }),
    /// offset: 0x154
    reserved340: [28]u8,
    /// Set master bits to 1 to mark as a secure master
    /// offset: 0x170
    BMPUSATD0: mmio.Mmio(packed struct(u32) {
        /// RADIOAES DMA secure mode
        RADIOAES: u1 = 0x1,
        /// RADIO subsystem manager secure mode
        RADIOSUBSYSTEM: u1 = 0x1,
        /// MCU LDMA secure mode
        LDMA: u1 = 0x1,
        /// RFECA0 secure mode
        RFECA0: u1 = 0x1,
        /// RFECA1 secure mode
        RFECA1: u1 = 0x1,
        /// SEEXTDMA secure mode
        SEEXTDMA: u1 = 0x1,
        padding: u26 = 0,
    }),
    /// offset: 0x174
    reserved372: [220]u8,
    /// No Description
    /// offset: 0x250
    BMPUFS: mmio.Mmio(packed struct(u32) {
        /// Bus Manager ID
        BMPUFSMASTERID: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// No Description
    /// offset: 0x254
    BMPUFSADDR: mmio.Mmio(packed struct(u32) {
        /// Fault Address
        BMPUFSADDR: u32 = 0x0,
    }),
    /// offset: 0x258
    reserved600: [8]u8,
    /// No Description
    /// offset: 0x260
    ESAURTYPES0: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Region 3 Non-Secure
        ESAUR3NS: u1 = 0x0,
        padding: u19 = 0,
    }),
    /// No Description
    /// offset: 0x264
    ESAURTYPES1: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Region 11 Non-Secure
        ESAUR11NS: u1 = 0x0,
        padding: u19 = 0,
    }),
    /// offset: 0x268
    reserved616: [8]u8,
    /// No Description
    /// offset: 0x270
    ESAUMRB01: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Moveable Region Boundary
        ESAUMRB01: u16 = 0xA000,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x274
    ESAUMRB12: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Moveable Region Boundary
        ESAUMRB12: u16 = 0xC000,
        padding: u4 = 0,
    }),
    /// offset: 0x278
    reserved632: [8]u8,
    /// No Description
    /// offset: 0x280
    ESAUMRB45: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Moveable Region Boundary
        ESAUMRB45: u16 = 0x2000,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x284
    ESAUMRB56: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Moveable Region Boundary
        ESAUMRB56: u16 = 0x4000,
        padding: u4 = 0,
    }),
};
