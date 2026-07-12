//! No description
const microzig = @import("microzig");
const mmio = microzig.mmio;

pub const types = @import("types.zig");

pub const Properties = struct {
    has_vtor: ?bool = null,
    has_mpu: ?bool = null,
    has_fpu: ?bool = null,
    interrupt_priority_bits: ?u8 = null,
    dma_channel_count: ?u32 = null,
};

pub const Interrupt = struct {
    name: [:0]const u8,
    index: i16,
    description: ?[:0]const u8,
};

pub const properties: Properties = .{
    .has_vtor = true,
    .has_mpu = true,
    .has_fpu = true,
    .interrupt_priority_bits = 4,
    .dma_channel_count = null,
};

pub const raw_properties = struct {
    pub const @"cpu.dspPresent" = "1";
    pub const @"cpu.endian" = "little";
    pub const @"cpu.fpuPresent" = "1";
    pub const @"cpu.mpuPresent" = "1";
    pub const @"cpu.name" = "CM33";
    pub const @"cpu.nvicPrioBits" = "4";
    pub const @"cpu.revision" = "r0p4";
    pub const @"cpu.sauNumRegions" = "8";
    pub const @"cpu.vendorSystickConfig" = "false";
    pub const @"cpu.vtorPresent" = "1";
};

pub const interrupts: []const Interrupt = &.{
    .{ .name = "NMI", .index = -14, .description = null },
    .{ .name = "HardFault", .index = -13, .description = null },
    .{ .name = "MemManageFault", .index = -12, .description = null },
    .{ .name = "BusFault", .index = -11, .description = null },
    .{ .name = "UsageFault", .index = -10, .description = null },
    .{ .name = "SecureFault", .index = -9, .description = null },
    .{ .name = "SVCall", .index = -5, .description = null },
    .{ .name = "DebugMonitor", .index = -4, .description = null },
    .{ .name = "PendSV", .index = -2, .description = null },
    .{ .name = "SysTick", .index = -1, .description = null },
    .{ .name = "SMU_SECURE", .index = 0, .description = null },
    .{ .name = "SMU_S_PRIVILEGED", .index = 1, .description = null },
    .{ .name = "EMU", .index = 3, .description = null },
    .{ .name = "TIMER0", .index = 4, .description = null },
    .{ .name = "TIMER1", .index = 5, .description = null },
    .{ .name = "TIMER2", .index = 6, .description = null },
    .{ .name = "TIMER3", .index = 7, .description = null },
    .{ .name = "TIMER4", .index = 8, .description = null },
    .{ .name = "USART0_RX", .index = 9, .description = null },
    .{ .name = "USART0_TX", .index = 10, .description = null },
    .{ .name = "EUSART0_RX", .index = 11, .description = null },
    .{ .name = "EUSART0_TX", .index = 12, .description = null },
    .{ .name = "EUSART1_RX", .index = 13, .description = null },
    .{ .name = "EUSART1_TX", .index = 14, .description = null },
    .{ .name = "EUSART2_RX", .index = 15, .description = null },
    .{ .name = "EUSART2_TX", .index = 16, .description = null },
    .{ .name = "ICACHE0", .index = 17, .description = null },
    .{ .name = "BURTC", .index = 18, .description = null },
    .{ .name = "LETIMER0", .index = 19, .description = null },
    .{ .name = "SYSCFG", .index = 20, .description = null },
    .{ .name = "LDMA", .index = 22, .description = null },
    .{ .name = "LFXO", .index = 23, .description = null },
    .{ .name = "LFRCO", .index = 24, .description = null },
    .{ .name = "ULFRCO", .index = 25, .description = null },
    .{ .name = "GPIO_ODD", .index = 26, .description = null },
    .{ .name = "GPIO_EVEN", .index = 27, .description = null },
    .{ .name = "I2C0", .index = 28, .description = null },
    .{ .name = "I2C1", .index = 29, .description = null },
    .{ .name = "EMUDG", .index = 30, .description = null },
    .{ .name = "HOSTMAILBOX", .index = 39, .description = null },
    .{ .name = "ACMP0", .index = 41, .description = null },
    .{ .name = "ACMP1", .index = 42, .description = null },
    .{ .name = "WDOG0", .index = 43, .description = null },
    .{ .name = "WDOG1", .index = 44, .description = null },
    .{ .name = "HFXO0", .index = 45, .description = null },
    .{ .name = "HFRCO0", .index = 46, .description = null },
    .{ .name = "HFRCOEM23", .index = 47, .description = null },
    .{ .name = "CMU", .index = 48, .description = null },
    .{ .name = "AES", .index = 49, .description = null },
    .{ .name = "IADC", .index = 50, .description = null },
    .{ .name = "MSC", .index = 51, .description = null },
    .{ .name = "DPLL0", .index = 52, .description = null },
    .{ .name = "DCDC", .index = 54, .description = null },
    .{ .name = "VDAC", .index = 55, .description = null },
    .{ .name = "PCNT0", .index = 56, .description = null },
    .{ .name = "SW0", .index = 57, .description = null },
    .{ .name = "SW1", .index = 58, .description = null },
    .{ .name = "SW2", .index = 59, .description = null },
    .{ .name = "SW3", .index = 60, .description = null },
    .{ .name = "SEMBRX", .index = 67, .description = null },
    .{ .name = "SEMBTX", .index = 68, .description = null },
    .{ .name = "LESENSE", .index = 69, .description = null },
    .{ .name = "SYSRTC_APP", .index = 70, .description = null },
    .{ .name = "SYSRTC_SEQ", .index = 71, .description = null },
    .{ .name = "LCD", .index = 72, .description = null },
    .{ .name = "KEYSCAN", .index = 73, .description = null },
};

pub const VectorTable = extern struct {
    const Handler = microzig.interrupt.Handler;
    const unhandled = microzig.interrupt.unhandled;

    initial_stack_pointer: *const anyopaque,
    Reset: Handler,
    NMI: Handler = unhandled,
    HardFault: Handler = unhandled,
    MemManageFault: Handler = unhandled,
    BusFault: Handler = unhandled,
    UsageFault: Handler = unhandled,
    SecureFault: Handler = unhandled,
    reserved6: [3]u32 = undefined,
    SVCall: Handler = unhandled,
    DebugMonitor: Handler = unhandled,
    reserved11: [1]u32 = undefined,
    PendSV: Handler = unhandled,
    SysTick: Handler = unhandled,
    SMU_SECURE: Handler = unhandled,
    SMU_S_PRIVILEGED: Handler = unhandled,
    reserved16: [1]u32 = undefined,
    EMU: Handler = unhandled,
    TIMER0: Handler = unhandled,
    TIMER1: Handler = unhandled,
    TIMER2: Handler = unhandled,
    TIMER3: Handler = unhandled,
    TIMER4: Handler = unhandled,
    USART0_RX: Handler = unhandled,
    USART0_TX: Handler = unhandled,
    EUSART0_RX: Handler = unhandled,
    EUSART0_TX: Handler = unhandled,
    EUSART1_RX: Handler = unhandled,
    EUSART1_TX: Handler = unhandled,
    EUSART2_RX: Handler = unhandled,
    EUSART2_TX: Handler = unhandled,
    ICACHE0: Handler = unhandled,
    BURTC: Handler = unhandled,
    LETIMER0: Handler = unhandled,
    SYSCFG: Handler = unhandled,
    reserved35: [1]u32 = undefined,
    LDMA: Handler = unhandled,
    LFXO: Handler = unhandled,
    LFRCO: Handler = unhandled,
    ULFRCO: Handler = unhandled,
    GPIO_ODD: Handler = unhandled,
    GPIO_EVEN: Handler = unhandled,
    I2C0: Handler = unhandled,
    I2C1: Handler = unhandled,
    EMUDG: Handler = unhandled,
    reserved45: [8]u32 = undefined,
    HOSTMAILBOX: Handler = unhandled,
    reserved54: [1]u32 = undefined,
    ACMP0: Handler = unhandled,
    ACMP1: Handler = unhandled,
    WDOG0: Handler = unhandled,
    WDOG1: Handler = unhandled,
    HFXO0: Handler = unhandled,
    HFRCO0: Handler = unhandled,
    HFRCOEM23: Handler = unhandled,
    CMU: Handler = unhandled,
    AES: Handler = unhandled,
    IADC: Handler = unhandled,
    MSC: Handler = unhandled,
    DPLL0: Handler = unhandled,
    reserved67: [1]u32 = undefined,
    DCDC: Handler = unhandled,
    VDAC: Handler = unhandled,
    PCNT0: Handler = unhandled,
    SW0: Handler = unhandled,
    SW1: Handler = unhandled,
    SW2: Handler = unhandled,
    SW3: Handler = unhandled,
    reserved75: [6]u32 = undefined,
    SEMBRX: Handler = unhandled,
    SEMBTX: Handler = unhandled,
    LESENSE: Handler = unhandled,
    SYSRTC_APP: Handler = unhandled,
    SYSRTC_SEQ: Handler = unhandled,
    LCD: Handler = unhandled,
    KEYSCAN: Handler = unhandled,
};

pub const peripherals = struct {
    /// DEVINFO Registers
    pub const DEVINFO: *volatile types.peripherals.DEVINFO = @ptrFromInt(0xfe08000);
    /// SCRATCHPAD_S Registers
    pub const SCRATCHPAD_S: *volatile types.peripherals.SCRATCHPAD_S = @ptrFromInt(0x40000000);
    /// EMU_S Registers
    pub const EMU_S: *volatile types.peripherals.EMU_S = @ptrFromInt(0x40004000);
    /// CMU_S Registers
    pub const CMU_S: *volatile types.peripherals.CMU_S = @ptrFromInt(0x40008000);
    /// HFRCO0_S Registers
    pub const HFRCO0_S: *volatile types.peripherals.HFRCO0_S = @ptrFromInt(0x40010000);
    /// FSRCO_S Registers
    pub const FSRCO_S: *volatile types.peripherals.FSRCO_S = @ptrFromInt(0x40018000);
    /// DPLL0_S Registers
    pub const DPLL0_S: *volatile types.peripherals.DPLL0_S = @ptrFromInt(0x4001c000);
    /// LFXO_S Registers
    pub const LFXO_S: *volatile types.peripherals.LFXO_S = @ptrFromInt(0x40020000);
    /// LFRCO_S Registers
    pub const LFRCO_S: *volatile types.peripherals.LFRCO_S = @ptrFromInt(0x40024000);
    /// ULFRCO_S Registers
    pub const ULFRCO_S: *volatile types.peripherals.ULFRCO_S = @ptrFromInt(0x40028000);
    /// MSC_S Registers
    pub const MSC_S: *volatile types.peripherals.MSC_S = @ptrFromInt(0x40030000);
    /// ICACHE0_S Registers
    pub const ICACHE0_S: *volatile types.peripherals.ICACHE0_S = @ptrFromInt(0x40034000);
    /// PRS_S Registers
    pub const PRS_S: *volatile types.peripherals.PRS_S = @ptrFromInt(0x40038000);
    /// GPIO_S Registers
    pub const GPIO_S: *volatile types.peripherals.GPIO_S = @ptrFromInt(0x4003c000);
    /// LDMA_S Registers
    pub const LDMA_S: *volatile types.peripherals.LDMA_S = @ptrFromInt(0x40040000);
    /// LDMAXBAR_S Registers
    pub const LDMAXBAR_S: *volatile types.peripherals.LDMAXBAR_S = @ptrFromInt(0x40044000);
    /// TIMER0_S Registers
    pub const TIMER0_S: *volatile types.peripherals.TIMER0_S = @ptrFromInt(0x40048000);
    /// TIMER1_S Registers
    pub const TIMER1_S: *volatile types.peripherals.TIMER1_S = @ptrFromInt(0x4004c000);
    /// TIMER2_S Registers
    pub const TIMER2_S: *volatile types.peripherals.TIMER2_S = @ptrFromInt(0x40050000);
    /// TIMER3_S Registers
    pub const TIMER3_S: *volatile types.peripherals.TIMER3_S = @ptrFromInt(0x40054000);
    /// TIMER4_S Registers
    pub const TIMER4_S: *volatile types.peripherals.TIMER4_S = @ptrFromInt(0x40058000);
    /// USART0_S Registers
    pub const USART0_S: *volatile types.peripherals.USART0_S = @ptrFromInt(0x4005c000);
    /// BURTC_S Registers
    pub const BURTC_S: *volatile types.peripherals.BURTC_S = @ptrFromInt(0x40064000);
    /// I2C1_S Registers
    pub const I2C1_S: *volatile types.peripherals.I2C1_S = @ptrFromInt(0x40068000);
    /// SYSCFG_S_CFGNS Registers
    pub const SYSCFG_S_CFGNS: *volatile types.peripherals.SYSCFG_S_CFGNS = @ptrFromInt(0x40078000);
    /// SYSCFG_S Registers
    pub const SYSCFG_S: *volatile types.peripherals.SYSCFG_S = @ptrFromInt(0x4007c000);
    /// BURAM_S Registers
    pub const BURAM_S: *volatile types.peripherals.BURAM_S = @ptrFromInt(0x40080000);
    /// GPCRC_S Registers
    pub const GPCRC_S: *volatile types.peripherals.GPCRC_S = @ptrFromInt(0x40088000);
    /// DCDC_S Registers
    pub const DCDC_S: *volatile types.peripherals.DCDC_S = @ptrFromInt(0x40094000);
    /// HOSTMAILBOX_S Registers
    pub const HOSTMAILBOX_S: *volatile types.peripherals.HOSTMAILBOX_S = @ptrFromInt(0x40098000);
    /// EUSART1_S Registers
    pub const EUSART1_S: *volatile types.peripherals.EUSART1_S = @ptrFromInt(0x400a0000);
    /// EUSART2_S Registers
    pub const EUSART2_S: *volatile types.peripherals.EUSART2_S = @ptrFromInt(0x400a4000);
    /// SYSRTC0_S Registers
    pub const SYSRTC0_S: *volatile types.peripherals.SYSRTC0_S = @ptrFromInt(0x400a8000);
    /// LCD_S Registers
    pub const LCD_S: *volatile types.peripherals.LCD_S = @ptrFromInt(0x400ac000);
    /// KEYSCAN_S Registers
    pub const KEYSCAN_S: *volatile types.peripherals.KEYSCAN_S = @ptrFromInt(0x400b0000);
    /// DMEM_S Registers
    pub const DMEM_S: *volatile types.peripherals.DMEM_S = @ptrFromInt(0x400b4000);
    /// LCDRF_S Registers
    pub const LCDRF_S: *volatile types.peripherals.LCDRF_S = @ptrFromInt(0x400c0000);
    /// PFMXPPRF_S Registers
    pub const PFMXPPRF_S: *volatile types.peripherals.PFMXPPRF_S = @ptrFromInt(0x400c4000);
    /// RADIOAES_S Registers
    pub const RADIOAES_S: *volatile types.peripherals.RADIOAES_S = @ptrFromInt(0x44000000);
    /// SMU_S Registers
    pub const SMU_S: *volatile types.peripherals.SMU_S = @ptrFromInt(0x44008000);
    /// SMU_S_CFGNS Registers
    pub const SMU_S_CFGNS: *volatile types.peripherals.SMU_S_CFGNS = @ptrFromInt(0x4400c000);
    /// LETIMER0_S Registers
    pub const LETIMER0_S: *volatile types.peripherals.LETIMER0_S = @ptrFromInt(0x49000000);
    /// IADC0_S Registers
    pub const IADC0_S: *volatile types.peripherals.IADC0_S = @ptrFromInt(0x49004000);
    /// ACMP0_S Registers
    pub const ACMP0_S: *volatile types.peripherals.ACMP0_S = @ptrFromInt(0x49008000);
    /// ACMP1_S Registers
    pub const ACMP1_S: *volatile types.peripherals.ACMP1_S = @ptrFromInt(0x4900c000);
    /// VDAC0_S Registers
    pub const VDAC0_S: *volatile types.peripherals.VDAC0_S = @ptrFromInt(0x49024000);
    /// PCNT0_S Registers
    pub const PCNT0_S: *volatile types.peripherals.PCNT0_S = @ptrFromInt(0x49030000);
    /// LESENSE_S Registers
    pub const LESENSE_S: *volatile types.peripherals.LESENSE_S = @ptrFromInt(0x49038000);
    /// HFRCOEM23_S Registers
    pub const HFRCOEM23_S: *volatile types.peripherals.HFRCOEM23_S = @ptrFromInt(0x4a000000);
    /// HFXO0_S Registers
    pub const HFXO0_S: *volatile types.peripherals.HFXO0_S = @ptrFromInt(0x4a004000);
    /// I2C0_S Registers
    pub const I2C0_S: *volatile types.peripherals.I2C0_S = @ptrFromInt(0x4b000000);
    /// WDOG0_S Registers
    pub const WDOG0_S: *volatile types.peripherals.WDOG0_S = @ptrFromInt(0x4b004000);
    /// WDOG1_S Registers
    pub const WDOG1_S: *volatile types.peripherals.WDOG1_S = @ptrFromInt(0x4b008000);
    /// EUSART0_S Registers
    pub const EUSART0_S: *volatile types.peripherals.EUSART0_S = @ptrFromInt(0x4b010000);
    /// SEMAILBOX_S_HOST Registers
    pub const SEMAILBOX_S_HOST: *volatile types.peripherals.SEMAILBOX_S_HOST = @ptrFromInt(0x4c000000);
    /// SCRATCHPAD_NS Registers
    pub const SCRATCHPAD_NS: *volatile types.peripherals.SCRATCHPAD_NS = @ptrFromInt(0x50000000);
    /// EMU_NS Registers
    pub const EMU_NS: *volatile types.peripherals.EMU_NS = @ptrFromInt(0x50004000);
    /// CMU_NS Registers
    pub const CMU_NS: *volatile types.peripherals.CMU_NS = @ptrFromInt(0x50008000);
    /// HFRCO0_NS Registers
    pub const HFRCO0_NS: *volatile types.peripherals.HFRCO0_NS = @ptrFromInt(0x50010000);
    /// FSRCO_NS Registers
    pub const FSRCO_NS: *volatile types.peripherals.FSRCO_NS = @ptrFromInt(0x50018000);
    /// DPLL0_NS Registers
    pub const DPLL0_NS: *volatile types.peripherals.DPLL0_NS = @ptrFromInt(0x5001c000);
    /// LFXO_NS Registers
    pub const LFXO_NS: *volatile types.peripherals.LFXO_NS = @ptrFromInt(0x50020000);
    /// LFRCO_NS Registers
    pub const LFRCO_NS: *volatile types.peripherals.LFRCO_NS = @ptrFromInt(0x50024000);
    /// ULFRCO_NS Registers
    pub const ULFRCO_NS: *volatile types.peripherals.ULFRCO_NS = @ptrFromInt(0x50028000);
    /// MSC_NS Registers
    pub const MSC_NS: *volatile types.peripherals.MSC_NS = @ptrFromInt(0x50030000);
    /// ICACHE0_NS Registers
    pub const ICACHE0_NS: *volatile types.peripherals.ICACHE0_NS = @ptrFromInt(0x50034000);
    /// PRS_NS Registers
    pub const PRS_NS: *volatile types.peripherals.PRS_NS = @ptrFromInt(0x50038000);
    /// GPIO_NS Registers
    pub const GPIO_NS: *volatile types.peripherals.GPIO_NS = @ptrFromInt(0x5003c000);
    /// LDMA_NS Registers
    pub const LDMA_NS: *volatile types.peripherals.LDMA_NS = @ptrFromInt(0x50040000);
    /// LDMAXBAR_NS Registers
    pub const LDMAXBAR_NS: *volatile types.peripherals.LDMAXBAR_NS = @ptrFromInt(0x50044000);
    /// TIMER0_NS Registers
    pub const TIMER0_NS: *volatile types.peripherals.TIMER0_NS = @ptrFromInt(0x50048000);
    /// TIMER1_NS Registers
    pub const TIMER1_NS: *volatile types.peripherals.TIMER1_NS = @ptrFromInt(0x5004c000);
    /// TIMER2_NS Registers
    pub const TIMER2_NS: *volatile types.peripherals.TIMER2_NS = @ptrFromInt(0x50050000);
    /// TIMER3_NS Registers
    pub const TIMER3_NS: *volatile types.peripherals.TIMER3_NS = @ptrFromInt(0x50054000);
    /// TIMER4_NS Registers
    pub const TIMER4_NS: *volatile types.peripherals.TIMER4_NS = @ptrFromInt(0x50058000);
    /// USART0_NS Registers
    pub const USART0_NS: *volatile types.peripherals.USART0_NS = @ptrFromInt(0x5005c000);
    /// BURTC_NS Registers
    pub const BURTC_NS: *volatile types.peripherals.BURTC_NS = @ptrFromInt(0x50064000);
    /// I2C1_NS Registers
    pub const I2C1_NS: *volatile types.peripherals.I2C1_NS = @ptrFromInt(0x50068000);
    /// SYSCFG_NS_CFGNS Registers
    pub const SYSCFG_NS_CFGNS: *volatile types.peripherals.SYSCFG_NS_CFGNS = @ptrFromInt(0x50078000);
    /// SYSCFG_NS Registers
    pub const SYSCFG_NS: *volatile types.peripherals.SYSCFG_NS = @ptrFromInt(0x5007c000);
    /// BURAM_NS Registers
    pub const BURAM_NS: *volatile types.peripherals.BURAM_NS = @ptrFromInt(0x50080000);
    /// GPCRC_NS Registers
    pub const GPCRC_NS: *volatile types.peripherals.GPCRC_NS = @ptrFromInt(0x50088000);
    /// DCDC_NS Registers
    pub const DCDC_NS: *volatile types.peripherals.DCDC_NS = @ptrFromInt(0x50094000);
    /// HOSTMAILBOX_NS Registers
    pub const HOSTMAILBOX_NS: *volatile types.peripherals.HOSTMAILBOX_NS = @ptrFromInt(0x50098000);
    /// EUSART1_NS Registers
    pub const EUSART1_NS: *volatile types.peripherals.EUSART1_NS = @ptrFromInt(0x500a0000);
    /// EUSART2_NS Registers
    pub const EUSART2_NS: *volatile types.peripherals.EUSART2_NS = @ptrFromInt(0x500a4000);
    /// SYSRTC0_NS Registers
    pub const SYSRTC0_NS: *volatile types.peripherals.SYSRTC0_NS = @ptrFromInt(0x500a8000);
    /// LCD_NS Registers
    pub const LCD_NS: *volatile types.peripherals.LCD_NS = @ptrFromInt(0x500ac000);
    /// KEYSCAN_NS Registers
    pub const KEYSCAN_NS: *volatile types.peripherals.KEYSCAN_NS = @ptrFromInt(0x500b0000);
    /// DMEM_NS Registers
    pub const DMEM_NS: *volatile types.peripherals.DMEM_NS = @ptrFromInt(0x500b4000);
    /// LCDRF_NS Registers
    pub const LCDRF_NS: *volatile types.peripherals.LCDRF_NS = @ptrFromInt(0x500c0000);
    /// PFMXPPRF_NS Registers
    pub const PFMXPPRF_NS: *volatile types.peripherals.PFMXPPRF_NS = @ptrFromInt(0x500c4000);
    /// RADIOAES_NS Registers
    pub const RADIOAES_NS: *volatile types.peripherals.RADIOAES_NS = @ptrFromInt(0x54000000);
    /// SMU_NS Registers
    pub const SMU_NS: *volatile types.peripherals.SMU_NS = @ptrFromInt(0x54008000);
    /// SMU_NS_CFGNS Registers
    pub const SMU_NS_CFGNS: *volatile types.peripherals.SMU_NS_CFGNS = @ptrFromInt(0x5400c000);
    /// LETIMER0_NS Registers
    pub const LETIMER0_NS: *volatile types.peripherals.LETIMER0_NS = @ptrFromInt(0x59000000);
    /// IADC0_NS Registers
    pub const IADC0_NS: *volatile types.peripherals.IADC0_NS = @ptrFromInt(0x59004000);
    /// ACMP0_NS Registers
    pub const ACMP0_NS: *volatile types.peripherals.ACMP0_NS = @ptrFromInt(0x59008000);
    /// ACMP1_NS Registers
    pub const ACMP1_NS: *volatile types.peripherals.ACMP1_NS = @ptrFromInt(0x5900c000);
    /// VDAC0_NS Registers
    pub const VDAC0_NS: *volatile types.peripherals.VDAC0_NS = @ptrFromInt(0x59024000);
    /// PCNT0_NS Registers
    pub const PCNT0_NS: *volatile types.peripherals.PCNT0_NS = @ptrFromInt(0x59030000);
    /// LESENSE_NS Registers
    pub const LESENSE_NS: *volatile types.peripherals.LESENSE_NS = @ptrFromInt(0x59038000);
    /// HFRCOEM23_NS Registers
    pub const HFRCOEM23_NS: *volatile types.peripherals.HFRCOEM23_NS = @ptrFromInt(0x5a000000);
    /// HFXO0_NS Registers
    pub const HFXO0_NS: *volatile types.peripherals.HFXO0_NS = @ptrFromInt(0x5a004000);
    /// I2C0_NS Registers
    pub const I2C0_NS: *volatile types.peripherals.I2C0_NS = @ptrFromInt(0x5b000000);
    /// WDOG0_NS Registers
    pub const WDOG0_NS: *volatile types.peripherals.WDOG0_NS = @ptrFromInt(0x5b004000);
    /// WDOG1_NS Registers
    pub const WDOG1_NS: *volatile types.peripherals.WDOG1_NS = @ptrFromInt(0x5b008000);
    /// EUSART0_NS Registers
    pub const EUSART0_NS: *volatile types.peripherals.EUSART0_NS = @ptrFromInt(0x5b010000);
    /// SEMAILBOX_NS_HOST Registers
    pub const SEMAILBOX_NS_HOST: *volatile types.peripherals.SEMAILBOX_NS_HOST = @ptrFromInt(0x5c000000);
};
