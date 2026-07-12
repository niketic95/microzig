const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// GPIO_S Registers
pub const GPIO_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// ip version id
        IPVERSION: u32 = 0x2,
    }),
    /// offset: 0x04
    reserved4: [44]u8,
    /// Port control
    /// offset: 0x30
    PORTA_CTRL: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// Slew Rate
        SLEWRATE: u3 = 0x4,
        reserved12: u5 = 0,
        /// Data In Disable
        DINDIS: u1 = 0x0,
        reserved20: u7 = 0,
        /// Slew Rate Alt
        SLEWRATEALT: u3 = 0x4,
        reserved28: u5 = 0,
        /// Data In Disable Alt
        DINDISALT: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// mode low
    /// offset: 0x34
    PORTA_MODEL: mmio.Mmio(packed struct(u32) {
        /// MODE n
        MODE0: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE1: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE2: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE3: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE4: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE5: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE6: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE7: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
    }),
    /// offset: 0x38
    reserved56: [4]u8,
    /// mode high
    /// offset: 0x3c
    PORTA_MODEH: mmio.Mmio(packed struct(u32) {
        /// MODE n
        MODE0: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE1: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE2: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        padding: u20 = 0,
    }),
    /// data out
    /// offset: 0x40
    PORTA_DOUT: mmio.Mmio(packed struct(u32) {
        /// Data output
        DOUT: u11 = 0x0,
        padding: u21 = 0,
    }),
    /// data in
    /// offset: 0x44
    PORTA_DIN: mmio.Mmio(packed struct(u32) {
        /// Data input
        DIN: u11 = 0x0,
        padding: u21 = 0,
    }),
    /// offset: 0x48
    reserved72: [24]u8,
    /// Port control
    /// offset: 0x60
    PORTB_CTRL: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// Slew Rate
        SLEWRATE: u3 = 0x4,
        reserved12: u5 = 0,
        /// Data In Disable
        DINDIS: u1 = 0x0,
        reserved20: u7 = 0,
        /// Slew Rate Alt
        SLEWRATEALT: u3 = 0x4,
        reserved28: u5 = 0,
        /// Data In Disable Alt
        DINDISALT: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// mode low
    /// offset: 0x64
    PORTB_MODEL: mmio.Mmio(packed struct(u32) {
        /// MODE n
        MODE0: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE1: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE2: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE3: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE4: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE5: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE6: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        padding: u4 = 0,
    }),
    /// offset: 0x68
    reserved104: [8]u8,
    /// data out
    /// offset: 0x70
    PORTB_DOUT: mmio.Mmio(packed struct(u32) {
        /// Data output
        DOUT: u7 = 0x0,
        padding: u25 = 0,
    }),
    /// data in
    /// offset: 0x74
    PORTB_DIN: mmio.Mmio(packed struct(u32) {
        /// Data input
        DIN: u7 = 0x0,
        padding: u25 = 0,
    }),
    /// offset: 0x78
    reserved120: [24]u8,
    /// Port control
    /// offset: 0x90
    PORTC_CTRL: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// Slew Rate
        SLEWRATE: u3 = 0x4,
        reserved12: u5 = 0,
        /// Data In Disable
        DINDIS: u1 = 0x0,
        reserved20: u7 = 0,
        /// Slew Rate Alt
        SLEWRATEALT: u3 = 0x4,
        reserved28: u5 = 0,
        /// Data In Disable Alt
        DINDISALT: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// mode low
    /// offset: 0x94
    PORTC_MODEL: mmio.Mmio(packed struct(u32) {
        /// MODE n
        MODE0: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE1: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE2: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE3: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE4: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE5: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE6: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE7: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
    }),
    /// offset: 0x98
    reserved152: [4]u8,
    /// mode high
    /// offset: 0x9c
    PORTC_MODEH: mmio.Mmio(packed struct(u32) {
        /// MODE n
        MODE0: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE1: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        padding: u24 = 0,
    }),
    /// data out
    /// offset: 0xa0
    PORTC_DOUT: mmio.Mmio(packed struct(u32) {
        /// Data output
        DOUT: u10 = 0x0,
        padding: u22 = 0,
    }),
    /// data in
    /// offset: 0xa4
    PORTC_DIN: mmio.Mmio(packed struct(u32) {
        /// Data input
        DIN: u10 = 0x0,
        padding: u22 = 0,
    }),
    /// offset: 0xa8
    reserved168: [24]u8,
    /// Port control
    /// offset: 0xc0
    PORTD_CTRL: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// Slew Rate
        SLEWRATE: u3 = 0x4,
        reserved12: u5 = 0,
        /// Data In Disable
        DINDIS: u1 = 0x0,
        reserved20: u7 = 0,
        /// Slew Rate Alt
        SLEWRATEALT: u3 = 0x4,
        reserved28: u5 = 0,
        /// Data In Disable Alt
        DINDISALT: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// mode low
    /// offset: 0xc4
    PORTD_MODEL: mmio.Mmio(packed struct(u32) {
        /// MODE n
        MODE0: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE1: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE2: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE3: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE4: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        /// MODE n
        MODE5: enum(u4) {
            /// Input disabled. Pullup if DOUT is set.
            DISABLED = 0x0,
            /// Input enabled. Filter if DOUT is set.
            INPUT = 0x1,
            /// Input enabled. DOUT determines pull direction.
            INPUTPULL = 0x2,
            /// Input enabled with filter. DOUT determines pull direction.
            INPUTPULLFILTER = 0x3,
            /// Push-pull output.
            PUSHPULL = 0x4,
            /// Push-pull using alternate control.
            PUSHPULLALT = 0x5,
            /// Wired-or output.
            WIREDOR = 0x6,
            /// Wired-or output with pull-down.
            WIREDORPULLDOWN = 0x7,
            /// Open-drain output.
            WIREDAND = 0x8,
            /// Open-drain output with filter.
            WIREDANDFILTER = 0x9,
            /// Open-drain output with pullup.
            WIREDANDPULLUP = 0xa,
            /// Open-drain output with filter and pullup.
            WIREDANDPULLUPFILTER = 0xb,
            /// Open-drain output using alternate control.
            WIREDANDALT = 0xc,
            /// Open-drain output using alternate control with filter.
            WIREDANDALTFILTER = 0xd,
            /// Open-drain output using alternate control with pullup.
            WIREDANDALTPULLUP = 0xe,
            /// Open-drain output using alternate control with filter and pullup.
            WIREDANDALTPULLUPFILTER = 0xf,
        } = .DISABLED,
        padding: u8 = 0,
    }),
    /// offset: 0xc8
    reserved200: [8]u8,
    /// data out
    /// offset: 0xd0
    PORTD_DOUT: mmio.Mmio(packed struct(u32) {
        /// Data output
        DOUT: u6 = 0x0,
        padding: u26 = 0,
    }),
    /// data in
    /// offset: 0xd4
    PORTD_DIN: mmio.Mmio(packed struct(u32) {
        /// Data input
        DIN: u6 = 0x0,
        padding: u26 = 0,
    }),
    /// offset: 0xd8
    reserved216: [552]u8,
    /// No Description
    /// offset: 0x300
    LOCK: mmio.Mmio(packed struct(u32) {
        /// Configuration Lock Key
        LOCKKEY: enum(u16) {
            /// Unlock code
            UNLOCK = 0xa534,
            _,
        } = .UNLOCK,
        padding: u16 = 0,
    }),
    /// offset: 0x304
    reserved772: [12]u8,
    /// No Description
    /// offset: 0x310
    GPIOLOCKSTATUS: mmio.Mmio(packed struct(u32) {
        /// GPIO LOCK status
        LOCK: enum(u1) {
            /// Registers are unlocked
            UNLOCKED = 0x0,
            /// Registers are locked
            LOCKED = 0x1,
        } = .UNLOCKED,
        padding: u31 = 0,
    }),
    /// offset: 0x314
    reserved788: [12]u8,
    /// A Bus allocation
    /// offset: 0x320
    ABUSALLOC: mmio.Mmio(packed struct(u32) {
        /// A Bus Even 0
        AEVEN0: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH0
            VDAC0CH0 = 0x4,
            _,
        } = .TRISTATE,
        reserved8: u4 = 0,
        /// A Bus Even 1
        AEVEN1: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH1
            VDAC0CH1 = 0x4,
            _,
        } = .TRISTATE,
        reserved16: u4 = 0,
        /// A Bus Odd 0
        AODD0: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH0
            VDAC0CH0 = 0x4,
            _,
        } = .TRISTATE,
        reserved24: u4 = 0,
        /// A Bus Odd 1
        AODD1: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH1
            VDAC0CH1 = 0x4,
            _,
        } = .TRISTATE,
        padding: u4 = 0,
    }),
    /// B Bus allocation
    /// offset: 0x324
    BBUSALLOC: mmio.Mmio(packed struct(u32) {
        /// B Bus Even 0
        BEVEN0: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH0
            VDAC0CH0 = 0x4,
            _,
        } = .TRISTATE,
        reserved8: u4 = 0,
        /// B Bus Even 1
        BEVEN1: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH1
            VDAC0CH1 = 0x4,
            _,
        } = .TRISTATE,
        reserved16: u4 = 0,
        /// B Bus Odd 0
        BODD0: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH0
            VDAC0CH0 = 0x4,
            _,
        } = .TRISTATE,
        reserved24: u4 = 0,
        /// B Bus Odd 1
        BODD1: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH1
            VDAC0CH1 = 0x4,
            _,
        } = .TRISTATE,
        padding: u4 = 0,
    }),
    /// CD Bus allocation
    /// offset: 0x328
    CDBUSALLOC: mmio.Mmio(packed struct(u32) {
        /// CD Bus Even 0
        CDEVEN0: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH0
            VDAC0CH0 = 0x4,
            _,
        } = .TRISTATE,
        reserved8: u4 = 0,
        /// CD Bus Even 1
        CDEVEN1: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH1
            VDAC0CH1 = 0x4,
            _,
        } = .TRISTATE,
        reserved16: u4 = 0,
        /// CD Bus Odd 0
        CDODD0: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH0
            VDAC0CH0 = 0x4,
            _,
        } = .TRISTATE,
        reserved24: u4 = 0,
        /// CD Bus Odd 1
        CDODD1: enum(u4) {
            /// The bus is not allocated
            TRISTATE = 0x0,
            /// The bus is allocated to ADC0
            ADC0 = 0x1,
            /// The bus is allocated to ACMP0
            ACMP0 = 0x2,
            /// The bus is allocated to ACMP1
            ACMP1 = 0x3,
            /// The bus is allocated to VDAC0 CH1
            VDAC0CH1 = 0x4,
            _,
        } = .TRISTATE,
        padding: u4 = 0,
    }),
    /// offset: 0x32c
    reserved812: [212]u8,
    /// External Interrupt Port Select Low
    /// offset: 0x400
    EXTIPSELL: mmio.Mmio(packed struct(u32) {
        /// External Interrupt Port Select
        EXTIPSEL0: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved4: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL1: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved8: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL2: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved12: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL3: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved16: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL4: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved20: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL5: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved24: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL6: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved28: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL7: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        padding: u2 = 0,
    }),
    /// External interrupt Port Select High
    /// offset: 0x404
    EXTIPSELH: mmio.Mmio(packed struct(u32) {
        /// External Interrupt Port Select
        EXTIPSEL0: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved4: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL1: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved8: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL2: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        reserved12: u2 = 0,
        /// External Interrupt Port Select
        EXTIPSEL3: enum(u2) {
            /// Port A group selected
            PORTA = 0x0,
            /// Port B group selected
            PORTB = 0x1,
            /// Port C group selected
            PORTC = 0x2,
            /// Port D group selected
            PORTD = 0x3,
        } = .PORTA,
        padding: u18 = 0,
    }),
    /// External Interrupt Pin Select Low
    /// offset: 0x408
    EXTIPINSELL: mmio.Mmio(packed struct(u32) {
        /// External Interrupt Pin select
        EXTIPINSEL0: enum(u2) {
            /// OFFSET=0
            PIN0 = 0x0,
            /// OFFSET=1
            PIN1 = 0x1,
            /// OFFSET=2
            PIN2 = 0x2,
            /// OFFSET=3
            PIN3 = 0x3,
        } = .PIN0,
        reserved4: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL1: enum(u2) {
            /// OFFSET=0
            PIN0 = 0x0,
            /// OFFSET=1
            PIN1 = 0x1,
            /// OFFSET=2
            PIN2 = 0x2,
            /// OFFSET=3
            PIN3 = 0x3,
        } = .PIN0,
        reserved8: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL2: enum(u2) {
            /// OFFSET=0
            PIN0 = 0x0,
            /// OFFSET=1
            PIN1 = 0x1,
            /// OFFSET=2
            PIN2 = 0x2,
            /// OFFSET=3
            PIN3 = 0x3,
        } = .PIN0,
        reserved12: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL3: enum(u2) {
            /// OFFSET=0
            PIN0 = 0x0,
            /// OFFSET=1
            PIN1 = 0x1,
            /// OFFSET=2
            PIN2 = 0x2,
            /// OFFSET=3
            PIN3 = 0x3,
        } = .PIN0,
        reserved16: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL4: enum(u2) {
            /// OFFSET=0
            PIN0 = 0x0,
            /// OFFSET=1
            PIN1 = 0x1,
            /// OFFSET=2
            PIN2 = 0x2,
            /// OFFSET=3
            PIN3 = 0x3,
        } = .PIN0,
        reserved20: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL5: enum(u2) {
            /// OFFSET=0
            PIN0 = 0x0,
            /// OFFSET=1
            PIN1 = 0x1,
            /// OFFSET=2
            PIN2 = 0x2,
            /// OFFSET=3
            PIN3 = 0x3,
        } = .PIN0,
        reserved24: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL6: enum(u2) {
            /// OFFSET=0
            PIN0 = 0x0,
            /// OFFSET=1
            PIN1 = 0x1,
            /// OFFSET=2
            PIN2 = 0x2,
            /// OFFSET=3
            PIN3 = 0x3,
        } = .PIN0,
        reserved28: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL7: enum(u2) {
            /// OFFSET=0
            PIN0 = 0x0,
            /// OFFSET=1
            PIN1 = 0x1,
            /// OFFSET=2
            PIN2 = 0x2,
            /// OFFSET=3
            PIN3 = 0x3,
        } = .PIN0,
        padding: u2 = 0,
    }),
    /// External Interrupt Pin Select High
    /// offset: 0x40c
    EXTIPINSELH: mmio.Mmio(packed struct(u32) {
        /// External Interrupt Pin select
        EXTIPINSEL0: enum(u2) {
            /// OFFSET=8
            PIN8 = 0x0,
            /// OFFSET=9
            PIN9 = 0x1,
            /// OFFSET=10
            PIN10 = 0x2,
            /// OFFSET=11
            PIN11 = 0x3,
        } = .PIN8,
        reserved4: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL1: enum(u2) {
            /// OFFSET=8
            PIN8 = 0x0,
            /// OFFSET=9
            PIN9 = 0x1,
            /// OFFSET=10
            PIN10 = 0x2,
            /// OFFSET=11
            PIN11 = 0x3,
        } = .PIN8,
        reserved8: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL2: enum(u2) {
            /// OFFSET=8
            PIN8 = 0x0,
            /// OFFSET=9
            PIN9 = 0x1,
            /// OFFSET=10
            PIN10 = 0x2,
            /// OFFSET=11
            PIN11 = 0x3,
        } = .PIN8,
        reserved12: u2 = 0,
        /// External Interrupt Pin select
        EXTIPINSEL3: enum(u2) {
            /// OFFSET=8
            PIN8 = 0x0,
            /// OFFSET=9
            PIN9 = 0x1,
            /// OFFSET=10
            PIN10 = 0x2,
            /// OFFSET=11
            PIN11 = 0x3,
        } = .PIN8,
        padding: u18 = 0,
    }),
    /// External Interrupt Rising Edge Trigger
    /// offset: 0x410
    EXTIRISE: mmio.Mmio(packed struct(u32) {
        /// EXT Int Rise
        EXTIRISE: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// External Interrupt Falling Edge Trigger
    /// offset: 0x414
    EXTIFALL: mmio.Mmio(packed struct(u32) {
        /// EXT Int FALL
        EXTIFALL: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// offset: 0x418
    reserved1048: [8]u8,
    /// Interrupt Flag
    /// offset: 0x420
    IF: mmio.Mmio(packed struct(u32) {
        /// External Pin Flag
        EXTIF0: u1 = 0x0,
        /// External Pin Flag
        EXTIF1: u1 = 0x0,
        /// External Pin Flag
        EXTIF2: u1 = 0x0,
        /// External Pin Flag
        EXTIF3: u1 = 0x0,
        /// External Pin Flag
        EXTIF4: u1 = 0x0,
        /// External Pin Flag
        EXTIF5: u1 = 0x0,
        /// External Pin Flag
        EXTIF6: u1 = 0x0,
        /// External Pin Flag
        EXTIF7: u1 = 0x0,
        /// External Pin Flag
        EXTIF8: u1 = 0x0,
        /// External Pin Flag
        EXTIF9: u1 = 0x0,
        /// External Pin Flag
        EXTIF10: u1 = 0x0,
        /// External Pin Flag
        EXTIF11: u1 = 0x0,
        reserved16: u4 = 0,
        /// EM4 wake up
        EM4WU: u12 = 0x0,
        padding: u4 = 0,
    }),
    /// Interrupt Enable
    /// offset: 0x424
    IEN: mmio.Mmio(packed struct(u32) {
        /// External Pin Enable
        EXTIEN0: u1 = 0x0,
        /// External Pin Enable
        EXTIEN1: u1 = 0x0,
        /// External Pin Enable
        EXTIEN2: u1 = 0x0,
        /// External Pin Enable
        EXTIEN3: u1 = 0x0,
        /// External Pin Enable
        EXTIEN4: u1 = 0x0,
        /// External Pin Enable
        EXTIEN5: u1 = 0x0,
        /// External Pin Enable
        EXTIEN6: u1 = 0x0,
        /// External Pin Enable
        EXTIEN7: u1 = 0x0,
        /// External Pin Enable
        EXTIEN8: u1 = 0x0,
        /// External Pin Enable
        EXTIEN9: u1 = 0x0,
        /// External Pin Enable
        EXTIEN10: u1 = 0x0,
        /// External Pin Enable
        EXTIEN11: u1 = 0x0,
        reserved16: u4 = 0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN0: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN1: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN2: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN3: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN4: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN5: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN6: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN7: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN8: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN9: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN10: u1 = 0x0,
        /// EM4 Wake Up Interrupt En
        EM4WUIEN11: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x428
    reserved1064: [4]u8,
    /// No Description
    /// offset: 0x42c
    EM4WUEN: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// EM4 wake up enable
        EM4WUEN: u12 = 0x0,
        padding: u4 = 0,
    }),
    /// No Description
    /// offset: 0x430
    EM4WUPOL: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// EM4 Wake-Up Polarity
        EM4WUPOL: u12 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x434
    reserved1076: [12]u8,
    /// No Description
    /// offset: 0x440
    DBGROUTEPEN: mmio.Mmio(packed struct(u32) {
        /// Route Pin Enable
        SWCLKTCKPEN: u1 = 0x1,
        /// Route Location 0
        SWDIOTMSPEN: u1 = 0x1,
        /// JTAG Test Debug Output Pin Enable
        TDOPEN: u1 = 0x1,
        /// JTAG Test Debug Input Pin Enable
        TDIPEN: u1 = 0x1,
        padding: u28 = 0,
    }),
    /// No Description
    /// offset: 0x444
    TRACEROUTEPEN: mmio.Mmio(packed struct(u32) {
        /// Serial Wire Viewer Output Pin Enable
        SWVPEN: u1 = 0x0,
        /// Trace Clk Pin Enable
        TRACECLKPEN: u1 = 0x0,
        /// Trace Data0 Pin Enable
        TRACEDATA0PEN: u1 = 0x0,
        /// Trace Data1 Pin Enable
        TRACEDATA1PEN: u1 = 0x0,
        /// Trace Data2 Pin Enable
        TRACEDATA2PEN: u1 = 0x0,
        /// Trace Data3 Pin Enable
        TRACEDATA3PEN: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// offset: 0x448
    reserved1096: [24]u8,
    /// LCD Segment Enable
    /// offset: 0x460
    LCDSEG: mmio.Mmio(packed struct(u32) {
        /// LCD Segment Allocation
        LCDSEGALLOC: u20 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x464
    reserved1124: [12]u8,
    /// LCD Common Enable
    /// offset: 0x470
    LCDCOM: mmio.Mmio(packed struct(u32) {
        /// LCD Common Allocation
        LCDCOMALLOC: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// offset: 0x474
    reserved1140: [12]u8,
    /// ACMP0 pin enable
    /// offset: 0x480
    ACMP0_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// ACMPOUT pin enable control bit
        ACMPOUTPEN: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// ACMPOUT port/pin select
    /// offset: 0x484
    ACMP0_ACMPOUTROUTE: mmio.Mmio(packed struct(u32) {
        /// ACMPOUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ACMPOUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x488
    reserved1160: [4]u8,
    /// ACMP1 pin enable
    /// offset: 0x48c
    ACMP1_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// ACMPOUT pin enable control bit
        ACMPOUTPEN: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// ACMPOUT port/pin select
    /// offset: 0x490
    ACMP1_ACMPOUTROUTE: mmio.Mmio(packed struct(u32) {
        /// ACMPOUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ACMPOUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x494
    reserved1172: [4]u8,
    /// CMU pin enable
    /// offset: 0x498
    CMU_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CLKOUT0 pin enable control bit
        CLKOUT0PEN: u1 = 0x0,
        /// CLKOUT1 pin enable control bit
        CLKOUT1PEN: u1 = 0x0,
        /// CLKOUT2 pin enable control bit
        CLKOUT2PEN: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// CLKIN0 port/pin select
    /// offset: 0x49c
    CMU_CLKIN0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CLKIN0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CLKIN0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CLKOUT0 port/pin select
    /// offset: 0x4a0
    CMU_CLKOUT0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CLKOUT0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CLKOUT0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CLKOUT1 port/pin select
    /// offset: 0x4a4
    CMU_CLKOUT1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CLKOUT1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CLKOUT1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CLKOUT2 port/pin select
    /// offset: 0x4a8
    CMU_CLKOUT2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CLKOUT2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CLKOUT2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x4ac
    reserved1196: [24]u8,
    /// EUSART0 pin enable
    /// offset: 0x4c4
    EUSART0_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CS pin enable control bit
        CSPEN: u1 = 0x0,
        /// RTS pin enable control bit
        RTSPEN: u1 = 0x0,
        /// RX pin enable control bit
        RXPEN: u1 = 0x0,
        /// SCLK pin enable control bit
        SCLKPEN: u1 = 0x0,
        /// TX pin enable control bit
        TXPEN: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// CS port/pin select
    /// offset: 0x4c8
    EUSART0_CSROUTE: mmio.Mmio(packed struct(u32) {
        /// CS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CTS port/pin select
    /// offset: 0x4cc
    EUSART0_CTSROUTE: mmio.Mmio(packed struct(u32) {
        /// CTS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CTS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// RTS port/pin select
    /// offset: 0x4d0
    EUSART0_RTSROUTE: mmio.Mmio(packed struct(u32) {
        /// RTS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// RTS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// RX port/pin select
    /// offset: 0x4d4
    EUSART0_RXROUTE: mmio.Mmio(packed struct(u32) {
        /// RX port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// RX pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SCLK port/pin select
    /// offset: 0x4d8
    EUSART0_SCLKROUTE: mmio.Mmio(packed struct(u32) {
        /// SCLK port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SCLK pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// TX port/pin select
    /// offset: 0x4dc
    EUSART0_TXROUTE: mmio.Mmio(packed struct(u32) {
        /// TX port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// TX pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x4e0
    reserved1248: [4]u8,
    /// EUSART1 pin enable
    /// offset: 0x4e4
    EUSART1_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CS pin enable control bit
        CSPEN: u1 = 0x0,
        /// RTS pin enable control bit
        RTSPEN: u1 = 0x0,
        /// RX pin enable control bit
        RXPEN: u1 = 0x0,
        /// SCLK pin enable control bit
        SCLKPEN: u1 = 0x0,
        /// TX pin enable control bit
        TXPEN: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// CS port/pin select
    /// offset: 0x4e8
    EUSART1_CSROUTE: mmio.Mmio(packed struct(u32) {
        /// CS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CTS port/pin select
    /// offset: 0x4ec
    EUSART1_CTSROUTE: mmio.Mmio(packed struct(u32) {
        /// CTS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CTS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// RTS port/pin select
    /// offset: 0x4f0
    EUSART1_RTSROUTE: mmio.Mmio(packed struct(u32) {
        /// RTS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// RTS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// RX port/pin select
    /// offset: 0x4f4
    EUSART1_RXROUTE: mmio.Mmio(packed struct(u32) {
        /// RX port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// RX pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SCLK port/pin select
    /// offset: 0x4f8
    EUSART1_SCLKROUTE: mmio.Mmio(packed struct(u32) {
        /// SCLK port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SCLK pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// TX port/pin select
    /// offset: 0x4fc
    EUSART1_TXROUTE: mmio.Mmio(packed struct(u32) {
        /// TX port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// TX pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x500
    reserved1280: [4]u8,
    /// EUSART2 pin enable
    /// offset: 0x504
    EUSART2_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CS pin enable control bit
        CSPEN: u1 = 0x0,
        /// RTS pin enable control bit
        RTSPEN: u1 = 0x0,
        /// RX pin enable control bit
        RXPEN: u1 = 0x0,
        /// SCLK pin enable control bit
        SCLKPEN: u1 = 0x0,
        /// TX pin enable control bit
        TXPEN: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// CS port/pin select
    /// offset: 0x508
    EUSART2_CSROUTE: mmio.Mmio(packed struct(u32) {
        /// CS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CTS port/pin select
    /// offset: 0x50c
    EUSART2_CTSROUTE: mmio.Mmio(packed struct(u32) {
        /// CTS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CTS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// RTS port/pin select
    /// offset: 0x510
    EUSART2_RTSROUTE: mmio.Mmio(packed struct(u32) {
        /// RTS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// RTS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// RX port/pin select
    /// offset: 0x514
    EUSART2_RXROUTE: mmio.Mmio(packed struct(u32) {
        /// RX port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// RX pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SCLK port/pin select
    /// offset: 0x518
    EUSART2_SCLKROUTE: mmio.Mmio(packed struct(u32) {
        /// SCLK port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SCLK pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// TX port/pin select
    /// offset: 0x51c
    EUSART2_TXROUTE: mmio.Mmio(packed struct(u32) {
        /// TX port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// TX pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x520
    reserved1312: [4]u8,
    /// FRC pin enable
    /// offset: 0x524
    FRC_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// DCLK pin enable control bit
        DCLKPEN: u1 = 0x0,
        /// DFRAME pin enable control bit
        DFRAMEPEN: u1 = 0x0,
        /// DOUT pin enable control bit
        DOUTPEN: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// DCLK port/pin select
    /// offset: 0x528
    FRC_DCLKROUTE: mmio.Mmio(packed struct(u32) {
        /// DCLK port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// DCLK pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// DFRAME port/pin select
    /// offset: 0x52c
    FRC_DFRAMEROUTE: mmio.Mmio(packed struct(u32) {
        /// DFRAME port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// DFRAME pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// DOUT port/pin select
    /// offset: 0x530
    FRC_DOUTROUTE: mmio.Mmio(packed struct(u32) {
        /// DOUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// DOUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x534
    reserved1332: [4]u8,
    /// I2C0 pin enable
    /// offset: 0x538
    I2C0_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// SCL pin enable control bit
        SCLPEN: u1 = 0x0,
        /// SDA pin enable control bit
        SDAPEN: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// SCL port/pin select
    /// offset: 0x53c
    I2C0_SCLROUTE: mmio.Mmio(packed struct(u32) {
        /// SCL port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SCL pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SDA port/pin select
    /// offset: 0x540
    I2C0_SDAROUTE: mmio.Mmio(packed struct(u32) {
        /// SDA port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SDA pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x544
    reserved1348: [4]u8,
    /// I2C1 pin enable
    /// offset: 0x548
    I2C1_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// SCL pin enable control bit
        SCLPEN: u1 = 0x0,
        /// SDA pin enable control bit
        SDAPEN: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// SCL port/pin select
    /// offset: 0x54c
    I2C1_SCLROUTE: mmio.Mmio(packed struct(u32) {
        /// SCL port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SCL pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SDA port/pin select
    /// offset: 0x550
    I2C1_SDAROUTE: mmio.Mmio(packed struct(u32) {
        /// SDA port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SDA pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x554
    reserved1364: [4]u8,
    /// KEYSCAN pin enable
    /// offset: 0x558
    KEYSCAN_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// COLOUT0 pin enable control bit
        COLOUT0PEN: u1 = 0x0,
        /// COLOUT1 pin enable control bit
        COLOUT1PEN: u1 = 0x0,
        /// COLOUT2 pin enable control bit
        COLOUT2PEN: u1 = 0x0,
        /// COLOUT3 pin enable control bit
        COLOUT3PEN: u1 = 0x0,
        /// COLOUT4 pin enable control bit
        COLOUT4PEN: u1 = 0x0,
        /// COLOUT5 pin enable control bit
        COLOUT5PEN: u1 = 0x0,
        /// COLOUT6 pin enable control bit
        COLOUT6PEN: u1 = 0x0,
        /// COLOUT7 pin enable control bit
        COLOUT7PEN: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// COLOUT0 port/pin select
    /// offset: 0x55c
    KEYSCAN_COLOUT0ROUTE: mmio.Mmio(packed struct(u32) {
        /// COLOUT0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// COLOUT0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// COLOUT1 port/pin select
    /// offset: 0x560
    KEYSCAN_COLOUT1ROUTE: mmio.Mmio(packed struct(u32) {
        /// COLOUT1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// COLOUT1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// COLOUT2 port/pin select
    /// offset: 0x564
    KEYSCAN_COLOUT2ROUTE: mmio.Mmio(packed struct(u32) {
        /// COLOUT2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// COLOUT2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// COLOUT3 port/pin select
    /// offset: 0x568
    KEYSCAN_COLOUT3ROUTE: mmio.Mmio(packed struct(u32) {
        /// COLOUT3 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// COLOUT3 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// COLOUT4 port/pin select
    /// offset: 0x56c
    KEYSCAN_COLOUT4ROUTE: mmio.Mmio(packed struct(u32) {
        /// COLOUT4 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// COLOUT4 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// COLOUT5 port/pin select
    /// offset: 0x570
    KEYSCAN_COLOUT5ROUTE: mmio.Mmio(packed struct(u32) {
        /// COLOUT5 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// COLOUT5 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// COLOUT6 port/pin select
    /// offset: 0x574
    KEYSCAN_COLOUT6ROUTE: mmio.Mmio(packed struct(u32) {
        /// COLOUT6 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// COLOUT6 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// COLOUT7 port/pin select
    /// offset: 0x578
    KEYSCAN_COLOUT7ROUTE: mmio.Mmio(packed struct(u32) {
        /// COLOUT7 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// COLOUT7 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ROWSENSE0 port/pin select
    /// offset: 0x57c
    KEYSCAN_ROWSENSE0ROUTE: mmio.Mmio(packed struct(u32) {
        /// ROWSENSE0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ROWSENSE0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ROWSENSE1 port/pin select
    /// offset: 0x580
    KEYSCAN_ROWSENSE1ROUTE: mmio.Mmio(packed struct(u32) {
        /// ROWSENSE1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ROWSENSE1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ROWSENSE2 port/pin select
    /// offset: 0x584
    KEYSCAN_ROWSENSE2ROUTE: mmio.Mmio(packed struct(u32) {
        /// ROWSENSE2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ROWSENSE2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ROWSENSE3 port/pin select
    /// offset: 0x588
    KEYSCAN_ROWSENSE3ROUTE: mmio.Mmio(packed struct(u32) {
        /// ROWSENSE3 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ROWSENSE3 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ROWSENSE4 port/pin select
    /// offset: 0x58c
    KEYSCAN_ROWSENSE4ROUTE: mmio.Mmio(packed struct(u32) {
        /// ROWSENSE4 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ROWSENSE4 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ROWSENSE5 port/pin select
    /// offset: 0x590
    KEYSCAN_ROWSENSE5ROUTE: mmio.Mmio(packed struct(u32) {
        /// ROWSENSE5 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ROWSENSE5 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x594
    reserved1428: [4]u8,
    /// LESENSE pin enable
    /// offset: 0x598
    LESENSE_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CH0OUT pin enable control bit
        CH0OUTPEN: u1 = 0x0,
        /// CH1OUT pin enable control bit
        CH1OUTPEN: u1 = 0x0,
        /// CH2OUT pin enable control bit
        CH2OUTPEN: u1 = 0x0,
        /// CH3OUT pin enable control bit
        CH3OUTPEN: u1 = 0x0,
        /// CH4OUT pin enable control bit
        CH4OUTPEN: u1 = 0x0,
        /// CH5OUT pin enable control bit
        CH5OUTPEN: u1 = 0x0,
        /// CH6OUT pin enable control bit
        CH6OUTPEN: u1 = 0x0,
        /// CH7OUT pin enable control bit
        CH7OUTPEN: u1 = 0x0,
        /// CH8OUT pin enable control bit
        CH8OUTPEN: u1 = 0x0,
        /// CH9OUT pin enable control bit
        CH9OUTPEN: u1 = 0x0,
        /// CH10OUT pin enable control bit
        CH10OUTPEN: u1 = 0x0,
        /// CH11OUT pin enable control bit
        CH11OUTPEN: u1 = 0x0,
        /// CH12OUT pin enable control bit
        CH12OUTPEN: u1 = 0x0,
        /// CH13OUT pin enable control bit
        CH13OUTPEN: u1 = 0x0,
        /// CH14OUT pin enable control bit
        CH14OUTPEN: u1 = 0x0,
        /// CH15OUT pin enable control bit
        CH15OUTPEN: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// CH0OUT port/pin select
    /// offset: 0x59c
    LESENSE_CH0OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH0OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH0OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH1OUT port/pin select
    /// offset: 0x5a0
    LESENSE_CH1OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH1OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH1OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH2OUT port/pin select
    /// offset: 0x5a4
    LESENSE_CH2OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH2OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH2OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH3OUT port/pin select
    /// offset: 0x5a8
    LESENSE_CH3OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH3OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH3OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH4OUT port/pin select
    /// offset: 0x5ac
    LESENSE_CH4OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH4OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH4OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH5OUT port/pin select
    /// offset: 0x5b0
    LESENSE_CH5OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH5OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH5OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH6OUT port/pin select
    /// offset: 0x5b4
    LESENSE_CH6OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH6OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH6OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH7OUT port/pin select
    /// offset: 0x5b8
    LESENSE_CH7OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH7OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH7OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH8OUT port/pin select
    /// offset: 0x5bc
    LESENSE_CH8OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH8OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH8OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH9OUT port/pin select
    /// offset: 0x5c0
    LESENSE_CH9OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH9OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH9OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH10OUT port/pin select
    /// offset: 0x5c4
    LESENSE_CH10OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH10OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH10OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH11OUT port/pin select
    /// offset: 0x5c8
    LESENSE_CH11OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH11OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH11OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH12OUT port/pin select
    /// offset: 0x5cc
    LESENSE_CH12OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH12OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH12OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH13OUT port/pin select
    /// offset: 0x5d0
    LESENSE_CH13OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH13OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH13OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH14OUT port/pin select
    /// offset: 0x5d4
    LESENSE_CH14OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH14OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH14OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CH15OUT port/pin select
    /// offset: 0x5d8
    LESENSE_CH15OUTROUTE: mmio.Mmio(packed struct(u32) {
        /// CH15OUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CH15OUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x5dc
    reserved1500: [4]u8,
    /// LETIMER pin enable
    /// offset: 0x5e0
    LETIMER_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// OUT0 pin enable control bit
        OUT0PEN: u1 = 0x0,
        /// OUT1 pin enable control bit
        OUT1PEN: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// OUT0 port/pin select
    /// offset: 0x5e4
    LETIMER_OUT0ROUTE: mmio.Mmio(packed struct(u32) {
        /// OUT0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// OUT0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// OUT1 port/pin select
    /// offset: 0x5e8
    LETIMER_OUT1ROUTE: mmio.Mmio(packed struct(u32) {
        /// OUT1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// OUT1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x5ec
    reserved1516: [4]u8,
    /// MODEM pin enable
    /// offset: 0x5f0
    MODEM_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// ANT0 pin enable control bit
        ANT0PEN: u1 = 0x0,
        /// ANT1 pin enable control bit
        ANT1PEN: u1 = 0x0,
        /// ANTROLLOVER pin enable control bit
        ANTROLLOVERPEN: u1 = 0x0,
        /// ANTRR0 pin enable control bit
        ANTRR0PEN: u1 = 0x0,
        /// ANTRR1 pin enable control bit
        ANTRR1PEN: u1 = 0x0,
        /// ANTRR2 pin enable control bit
        ANTRR2PEN: u1 = 0x0,
        /// ANTRR3 pin enable control bit
        ANTRR3PEN: u1 = 0x0,
        /// ANTRR4 pin enable control bit
        ANTRR4PEN: u1 = 0x0,
        /// ANTRR5 pin enable control bit
        ANTRR5PEN: u1 = 0x0,
        /// ANTSWEN pin enable control bit
        ANTSWENPEN: u1 = 0x0,
        /// ANTSWUS pin enable control bit
        ANTSWUSPEN: u1 = 0x0,
        /// ANTTRIG pin enable control bit
        ANTTRIGPEN: u1 = 0x0,
        /// ANTTRIGSTOP pin enable control bit
        ANTTRIGSTOPPEN: u1 = 0x0,
        /// DCLK pin enable control bit
        DCLKPEN: u1 = 0x0,
        /// DOUT pin enable control bit
        DOUTPEN: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// ANT0 port/pin select
    /// offset: 0x5f4
    MODEM_ANT0ROUTE: mmio.Mmio(packed struct(u32) {
        /// ANT0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANT0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANT1 port/pin select
    /// offset: 0x5f8
    MODEM_ANT1ROUTE: mmio.Mmio(packed struct(u32) {
        /// ANT1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANT1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTROLLOVER port/pin select
    /// offset: 0x5fc
    MODEM_ANTROLLOVERROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTROLLOVER port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTROLLOVER pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTRR0 port/pin select
    /// offset: 0x600
    MODEM_ANTRR0ROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTRR0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTRR0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTRR1 port/pin select
    /// offset: 0x604
    MODEM_ANTRR1ROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTRR1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTRR1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTRR2 port/pin select
    /// offset: 0x608
    MODEM_ANTRR2ROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTRR2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTRR2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTRR3 port/pin select
    /// offset: 0x60c
    MODEM_ANTRR3ROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTRR3 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTRR3 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTRR4 port/pin select
    /// offset: 0x610
    MODEM_ANTRR4ROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTRR4 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTRR4 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTRR5 port/pin select
    /// offset: 0x614
    MODEM_ANTRR5ROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTRR5 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTRR5 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTSWEN port/pin select
    /// offset: 0x618
    MODEM_ANTSWENROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTSWEN port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTSWEN pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTSWUS port/pin select
    /// offset: 0x61c
    MODEM_ANTSWUSROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTSWUS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTSWUS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTTRIG port/pin select
    /// offset: 0x620
    MODEM_ANTTRIGROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTTRIG port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTTRIG pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ANTTRIGSTOP port/pin select
    /// offset: 0x624
    MODEM_ANTTRIGSTOPROUTE: mmio.Mmio(packed struct(u32) {
        /// ANTTRIGSTOP port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ANTTRIGSTOP pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// DCLK port/pin select
    /// offset: 0x628
    MODEM_DCLKROUTE: mmio.Mmio(packed struct(u32) {
        /// DCLK port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// DCLK pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// DIN port/pin select
    /// offset: 0x62c
    MODEM_DINROUTE: mmio.Mmio(packed struct(u32) {
        /// DIN port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// DIN pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// DOUT port/pin select
    /// offset: 0x630
    MODEM_DOUTROUTE: mmio.Mmio(packed struct(u32) {
        /// DOUT port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// DOUT pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x634
    reserved1588: [8]u8,
    /// S0IN port/pin select
    /// offset: 0x63c
    PCNT0_S0INROUTE: mmio.Mmio(packed struct(u32) {
        /// S0IN port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// S0IN pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// S1IN port/pin select
    /// offset: 0x640
    PCNT0_S1INROUTE: mmio.Mmio(packed struct(u32) {
        /// S1IN port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// S1IN pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x644
    reserved1604: [4]u8,
    /// PRS0 pin enable
    /// offset: 0x648
    PRS0_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// ASYNCH0 pin enable control bit
        ASYNCH0PEN: u1 = 0x0,
        /// ASYNCH1 pin enable control bit
        ASYNCH1PEN: u1 = 0x0,
        /// ASYNCH2 pin enable control bit
        ASYNCH2PEN: u1 = 0x0,
        /// ASYNCH3 pin enable control bit
        ASYNCH3PEN: u1 = 0x0,
        /// ASYNCH4 pin enable control bit
        ASYNCH4PEN: u1 = 0x0,
        /// ASYNCH5 pin enable control bit
        ASYNCH5PEN: u1 = 0x0,
        /// ASYNCH6 pin enable control bit
        ASYNCH6PEN: u1 = 0x0,
        /// ASYNCH7 pin enable control bit
        ASYNCH7PEN: u1 = 0x0,
        /// ASYNCH8 pin enable control bit
        ASYNCH8PEN: u1 = 0x0,
        /// ASYNCH9 pin enable control bit
        ASYNCH9PEN: u1 = 0x0,
        /// ASYNCH10 pin enable control bit
        ASYNCH10PEN: u1 = 0x0,
        /// ASYNCH11 pin enable control bit
        ASYNCH11PEN: u1 = 0x0,
        /// SYNCH0 pin enable control bit
        SYNCH0PEN: u1 = 0x0,
        /// SYNCH1 pin enable control bit
        SYNCH1PEN: u1 = 0x0,
        /// SYNCH2 pin enable control bit
        SYNCH2PEN: u1 = 0x0,
        /// SYNCH3 pin enable control bit
        SYNCH3PEN: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// ASYNCH0 port/pin select
    /// offset: 0x64c
    PRS0_ASYNCH0ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH1 port/pin select
    /// offset: 0x650
    PRS0_ASYNCH1ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH2 port/pin select
    /// offset: 0x654
    PRS0_ASYNCH2ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH3 port/pin select
    /// offset: 0x658
    PRS0_ASYNCH3ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH3 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH3 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH4 port/pin select
    /// offset: 0x65c
    PRS0_ASYNCH4ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH4 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH4 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH5 port/pin select
    /// offset: 0x660
    PRS0_ASYNCH5ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH5 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH5 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH6 port/pin select
    /// offset: 0x664
    PRS0_ASYNCH6ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH6 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH6 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH7 port/pin select
    /// offset: 0x668
    PRS0_ASYNCH7ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH7 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH7 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH8 port/pin select
    /// offset: 0x66c
    PRS0_ASYNCH8ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH8 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH8 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH9 port/pin select
    /// offset: 0x670
    PRS0_ASYNCH9ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH9 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH9 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH10 port/pin select
    /// offset: 0x674
    PRS0_ASYNCH10ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH10 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH10 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// ASYNCH11 port/pin select
    /// offset: 0x678
    PRS0_ASYNCH11ROUTE: mmio.Mmio(packed struct(u32) {
        /// ASYNCH11 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// ASYNCH11 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SYNCH0 port/pin select
    /// offset: 0x67c
    PRS0_SYNCH0ROUTE: mmio.Mmio(packed struct(u32) {
        /// SYNCH0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SYNCH0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SYNCH1 port/pin select
    /// offset: 0x680
    PRS0_SYNCH1ROUTE: mmio.Mmio(packed struct(u32) {
        /// SYNCH1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SYNCH1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SYNCH2 port/pin select
    /// offset: 0x684
    PRS0_SYNCH2ROUTE: mmio.Mmio(packed struct(u32) {
        /// SYNCH2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SYNCH2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SYNCH3 port/pin select
    /// offset: 0x688
    PRS0_SYNCH3ROUTE: mmio.Mmio(packed struct(u32) {
        /// SYNCH3 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SYNCH3 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x68c
    reserved1676: [100]u8,
    /// BUFOUTREQINASYNC port/pin select
    /// offset: 0x6f0
    SYXO0_BUFOUTREQINASYNCROUTE: mmio.Mmio(packed struct(u32) {
        /// BUFOUTREQINASYNC port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// BUFOUTREQINASYNC pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x6f4
    reserved1780: [4]u8,
    /// TIMER0 pin enable
    /// offset: 0x6f8
    TIMER0_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CC0 pin enable control bit
        CC0PEN: u1 = 0x0,
        /// CC1 pin enable control bit
        CC1PEN: u1 = 0x0,
        /// CC2 pin enable control bit
        CC2PEN: u1 = 0x0,
        /// CDTI0 pin enable control bit
        CCC0PEN: u1 = 0x0,
        /// CDTI1 pin enable control bit
        CCC1PEN: u1 = 0x0,
        /// CDTI2 pin enable control bit
        CCC2PEN: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// CC0 port/pin select
    /// offset: 0x6fc
    TIMER0_CC0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC1 port/pin select
    /// offset: 0x700
    TIMER0_CC1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC2 port/pin select
    /// offset: 0x704
    TIMER0_CC2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI0 port/pin select
    /// offset: 0x708
    TIMER0_CDTI0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI1 port/pin select
    /// offset: 0x70c
    TIMER0_CDTI1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI2 port/pin select
    /// offset: 0x710
    TIMER0_CDTI2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x714
    reserved1812: [4]u8,
    /// TIMER1 pin enable
    /// offset: 0x718
    TIMER1_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CC0 pin enable control bit
        CC0PEN: u1 = 0x0,
        /// CC1 pin enable control bit
        CC1PEN: u1 = 0x0,
        /// CC2 pin enable control bit
        CC2PEN: u1 = 0x0,
        /// CDTI0 pin enable control bit
        CCC0PEN: u1 = 0x0,
        /// CDTI1 pin enable control bit
        CCC1PEN: u1 = 0x0,
        /// CDTI2 pin enable control bit
        CCC2PEN: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// CC0 port/pin select
    /// offset: 0x71c
    TIMER1_CC0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC1 port/pin select
    /// offset: 0x720
    TIMER1_CC1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC2 port/pin select
    /// offset: 0x724
    TIMER1_CC2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI0 port/pin select
    /// offset: 0x728
    TIMER1_CDTI0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI1 port/pin select
    /// offset: 0x72c
    TIMER1_CDTI1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI2 port/pin select
    /// offset: 0x730
    TIMER1_CDTI2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x734
    reserved1844: [4]u8,
    /// TIMER2 pin enable
    /// offset: 0x738
    TIMER2_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CC0 pin enable control bit
        CC0PEN: u1 = 0x0,
        /// CC1 pin enable control bit
        CC1PEN: u1 = 0x0,
        /// CC2 pin enable control bit
        CC2PEN: u1 = 0x0,
        /// CDTI0 pin enable control bit
        CCC0PEN: u1 = 0x0,
        /// CDTI1 pin enable control bit
        CCC1PEN: u1 = 0x0,
        /// CDTI2 pin enable control bit
        CCC2PEN: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// CC0 port/pin select
    /// offset: 0x73c
    TIMER2_CC0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC1 port/pin select
    /// offset: 0x740
    TIMER2_CC1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC2 port/pin select
    /// offset: 0x744
    TIMER2_CC2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI0 port/pin select
    /// offset: 0x748
    TIMER2_CDTI0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI1 port/pin select
    /// offset: 0x74c
    TIMER2_CDTI1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI2 port/pin select
    /// offset: 0x750
    TIMER2_CDTI2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x754
    reserved1876: [4]u8,
    /// TIMER3 pin enable
    /// offset: 0x758
    TIMER3_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CC0 pin enable control bit
        CC0PEN: u1 = 0x0,
        /// CC1 pin enable control bit
        CC1PEN: u1 = 0x0,
        /// CC2 pin enable control bit
        CC2PEN: u1 = 0x0,
        /// CDTI0 pin enable control bit
        CCC0PEN: u1 = 0x0,
        /// CDTI1 pin enable control bit
        CCC1PEN: u1 = 0x0,
        /// CDTI2 pin enable control bit
        CCC2PEN: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// CC0 port/pin select
    /// offset: 0x75c
    TIMER3_CC0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC1 port/pin select
    /// offset: 0x760
    TIMER3_CC1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC2 port/pin select
    /// offset: 0x764
    TIMER3_CC2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI0 port/pin select
    /// offset: 0x768
    TIMER3_CDTI0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI1 port/pin select
    /// offset: 0x76c
    TIMER3_CDTI1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI2 port/pin select
    /// offset: 0x770
    TIMER3_CDTI2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x774
    reserved1908: [4]u8,
    /// TIMER4 pin enable
    /// offset: 0x778
    TIMER4_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CC0 pin enable control bit
        CC0PEN: u1 = 0x0,
        /// CC1 pin enable control bit
        CC1PEN: u1 = 0x0,
        /// CC2 pin enable control bit
        CC2PEN: u1 = 0x0,
        /// CDTI0 pin enable control bit
        CCC0PEN: u1 = 0x0,
        /// CDTI1 pin enable control bit
        CCC1PEN: u1 = 0x0,
        /// CDTI2 pin enable control bit
        CCC2PEN: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// CC0 port/pin select
    /// offset: 0x77c
    TIMER4_CC0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC1 port/pin select
    /// offset: 0x780
    TIMER4_CC1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CC2 port/pin select
    /// offset: 0x784
    TIMER4_CC2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CC2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CC2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI0 port/pin select
    /// offset: 0x788
    TIMER4_CDTI0ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI0 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI0 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI1 port/pin select
    /// offset: 0x78c
    TIMER4_CDTI1ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI1 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI1 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CDTI2 port/pin select
    /// offset: 0x790
    TIMER4_CDTI2ROUTE: mmio.Mmio(packed struct(u32) {
        /// CDTI2 port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CDTI2 pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// offset: 0x794
    reserved1940: [4]u8,
    /// USART0 pin enable
    /// offset: 0x798
    USART0_ROUTEEN: mmio.Mmio(packed struct(u32) {
        /// CS pin enable control bit
        CSPEN: u1 = 0x0,
        /// RTS pin enable control bit
        RTSPEN: u1 = 0x0,
        /// RX pin enable control bit
        RXPEN: u1 = 0x0,
        /// SCLK pin enable control bit
        CLKPEN: u1 = 0x0,
        /// TX pin enable control bit
        TXPEN: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// CS port/pin select
    /// offset: 0x79c
    USART0_CSROUTE: mmio.Mmio(packed struct(u32) {
        /// CS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// CTS port/pin select
    /// offset: 0x7a0
    USART0_CTSROUTE: mmio.Mmio(packed struct(u32) {
        /// CTS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// CTS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// RTS port/pin select
    /// offset: 0x7a4
    USART0_RTSROUTE: mmio.Mmio(packed struct(u32) {
        /// RTS port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// RTS pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// RX port/pin select
    /// offset: 0x7a8
    USART0_RXROUTE: mmio.Mmio(packed struct(u32) {
        /// RX port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// RX pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// SCLK port/pin select
    /// offset: 0x7ac
    USART0_CLKROUTE: mmio.Mmio(packed struct(u32) {
        /// SCLK port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// SCLK pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
    /// TX port/pin select
    /// offset: 0x7b0
    USART0_TXROUTE: mmio.Mmio(packed struct(u32) {
        /// TX port select register
        PORT: u2 = 0x0,
        reserved16: u14 = 0,
        /// TX pin select register
        PIN: u4 = 0x0,
        padding: u12 = 0,
    }),
};
