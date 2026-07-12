const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// LCDRF_NS Registers
pub const LCDRF_NS = extern struct {
    /// No Description
    /// offset: 0x00
    RFIMLCDCTRL: mmio.Mmio(packed struct(u32) {
        /// LCD Charge Pump XO Clock Enable
        LCDCPXOEN: u1 = 0x0,
        /// LCD Charge Pump XO Select
        LCDCPXOSEL: enum(u1) {
            /// Internal LCD CP 10Mhz RC oscillator
            INTRCO = 0x0,
            /// HFXO divided 4 clock
            HFXODIV = 0x1,
        } = .INTRCO,
        /// LCD Charge Pump XO Retime Enable
        LCDCPXORETIMEEN: u1 = 0x0,
        /// LCD Low Noise
        LCDLOWNOISE: enum(u1) {
            /// Normal operation
            NORMAL = 0x0,
            /// slows down slew rate to reduce RF interference at a cost of additional power consumption
            SLOW = 0x1,
        } = .NORMAL,
        /// LCD Comparator Dout
        LCDCMPDOUT: u1 = 0x0,
        padding: u27 = 0,
    }),
};
