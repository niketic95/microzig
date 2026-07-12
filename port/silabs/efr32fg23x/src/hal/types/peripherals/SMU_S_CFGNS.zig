const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// SMU_S_CFGNS Registers
pub const SMU_S_CFGNS = extern struct {
    /// offset: 0x00
    reserved0: [4]u8,
    /// No Description
    /// offset: 0x04
    NSSTATUS: mmio.Mmio(packed struct(u32) {
        /// SMUNS Lock
        SMUNSLOCK: enum(u1) {
            /// UNLOCKED
            UNLOCKED = 0x0,
            /// LOCKED
            LOCKED = 0x1,
        } = .UNLOCKED,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x08
    NSLOCK: mmio.Mmio(packed struct(u32) {
        /// No Description
        SMUNSLOCKKEY: enum(u24) {
            /// Unlocks Registers
            UNLOCK = 0xacce55,
            _,
        } = @enumFromInt(0x0),
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    NSIF: mmio.Mmio(packed struct(u32) {
        /// PPUNS Privilege Interrupt Flag
        PPUNSPRIV: u1 = 0x0,
        reserved2: u1 = 0,
        /// PPUNS Instruction Interrupt Flag
        PPUNSINST: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// No Description
    /// offset: 0x10
    NSIEN: mmio.Mmio(packed struct(u32) {
        /// PPUNS Privilege Interrupt Enable
        PPUNSPRIV: u1 = 0x0,
        reserved2: u1 = 0,
        /// PPUNS Instruction Interrupt Enable
        PPUNSINST: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// offset: 0x14
    reserved20: [44]u8,
    /// Set peripheral bits to 1 to mark as privileged access only
    /// offset: 0x40
    PPUNSPATD0: mmio.Mmio(packed struct(u32) {
        /// SCRATCHPAD Privileged Access
        SCRATCHPAD: u1 = 0x0,
        /// EMU Privileged Access
        EMU: u1 = 0x0,
        /// CMU Privileged Access
        CMU: u1 = 0x0,
        /// HFRCO0 Privileged Access
        HFRCO0: u1 = 0x0,
        /// FSRCO Privileged Access
        FSRCO: u1 = 0x0,
        /// DPLL0 Privileged Access
        DPLL0: u1 = 0x0,
        /// LFXO Privileged Access
        LFXO: u1 = 0x0,
        /// LFRCO Privileged Access
        LFRCO: u1 = 0x0,
        /// ULFRCO Privileged Access
        ULFRCO: u1 = 0x0,
        /// MSC Privileged Access
        MSC: u1 = 0x0,
        /// ICACHE0 Privileged Access
        ICACHE0: u1 = 0x0,
        /// PRS Privileged Access
        PRS: u1 = 0x0,
        /// GPIO Privileged Access
        GPIO: u1 = 0x0,
        /// LDMA Privileged Access
        LDMA: u1 = 0x0,
        /// LDMAXBAR Privileged Access
        LDMAXBAR: u1 = 0x0,
        /// TIMER0 Privileged Access
        TIMER0: u1 = 0x0,
        /// TIMER1 Privileged Access
        TIMER1: u1 = 0x0,
        /// TIMER2 Privileged Access
        TIMER2: u1 = 0x0,
        /// TIMER3 Privileged Access
        TIMER3: u1 = 0x0,
        /// TIMER4 Privileged Access
        TIMER4: u1 = 0x0,
        /// USART0 Privileged Access
        USART0: u1 = 0x0,
        /// BURTC Privileged Access
        BURTC: u1 = 0x0,
        /// I2C1 Privileged Access
        I2C1: u1 = 0x0,
        /// CHIPTESTCTRL Privileged Access
        CHIPTESTCTRL: u1 = 0x0,
        /// SYSCFGCFGNS Privileged Access
        SYSCFGCFGNS: u1 = 0x0,
        /// SYSCFG Privileged Access
        SYSCFG: u1 = 0x0,
        /// BURAM Privileged Access
        BURAM: u1 = 0x0,
        /// GPCRC Privileged Access
        GPCRC: u1 = 0x0,
        /// DCDC Privileged Access
        DCDC: u1 = 0x0,
        /// HOSTMAILBOX Privileged Access
        HOSTMAILBOX: u1 = 0x0,
        /// EUSART1 Privileged Access
        EUSART1: u1 = 0x0,
        /// EUSART2 Privileged Access
        EUSART2: u1 = 0x0,
    }),
    /// Set peripheral bits to 1 to mark as privileged access only
    /// offset: 0x44
    PPUNSPATD1: mmio.Mmio(packed struct(u32) {
        /// SYSRTC Privileged Access
        SYSRTC: u1 = 0x0,
        /// LCD Privileged Access
        LCD: u1 = 0x0,
        /// KEYSCAN Privileged Access
        KEYSCAN: u1 = 0x0,
        /// DMEM Privileged Access
        DMEM: u1 = 0x0,
        /// LCDRF Privileged Access
        LCDRF: u1 = 0x0,
        /// PFMXPPRF Privileged Access
        PFMXPPRF: u1 = 0x0,
        /// RADIOAES Privileged Access
        RADIOAES: u1 = 0x0,
        /// SMU Privileged Access
        SMU: u1 = 0x0,
        /// SMUCFGNS Privileged Access
        SMUCFGNS: u1 = 0x0,
        /// LETIMER0 Privileged Access
        LETIMER0: u1 = 0x0,
        /// IADC0 Privileged Access
        IADC0: u1 = 0x0,
        /// ACMP0 Privileged Access
        ACMP0: u1 = 0x0,
        /// ACMP1 Privileged Access
        ACMP1: u1 = 0x0,
        /// AMUXCP0 Privileged Access
        AMUXCP0: u1 = 0x0,
        /// VDAC0 Privileged Access
        VDAC0: u1 = 0x0,
        /// PCNT Privileged Access
        PCNT: u1 = 0x0,
        /// LESENSE Privileged Access
        LESENSE: u1 = 0x0,
        /// HFRCO1 Privileged Access
        HFRCO1: u1 = 0x0,
        /// HFXO0 Privileged Access
        HFXO0: u1 = 0x0,
        /// I2C0 Privileged Access
        I2C0: u1 = 0x0,
        /// WDOG0 Privileged Access
        WDOG0: u1 = 0x0,
        /// WDOG1 Privileged Access
        WDOG1: u1 = 0x0,
        /// EUSART0 Privileged Access
        EUSART0: u1 = 0x0,
        /// SEMAILBOX Privileged Access
        SEMAILBOX: u1 = 0x0,
        /// AHBRADIO Privileged Access
        AHBRADIO: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x48
    reserved72: [248]u8,
    /// No Description
    /// offset: 0x140
    PPUNSFS: mmio.Mmio(packed struct(u32) {
        /// Peripheral I
        PPUFSPERIPHID: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// offset: 0x144
    reserved324: [12]u8,
    /// No Description
    /// offset: 0x150
    BMPUNSPATD0: mmio.Mmio(packed struct(u32) {
        /// RADIO AES DMA privileged mode
        RADIOAES: u1 = 0x0,
        /// RADIO subsystem manager privileged mode
        RADIOSUBSYSTEM: u1 = 0x0,
        /// MCU LDMA privileged mode
        LDMA: u1 = 0x0,
        /// RFECA0 privileged mode
        RFECA0: u1 = 0x0,
        /// RFECA1 privileged mode
        RFECA1: u1 = 0x0,
        /// SEEXTDMA privileged mode
        SEEXTDMA: u1 = 0x0,
        padding: u26 = 0,
    }),
};
