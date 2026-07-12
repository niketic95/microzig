const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// PFMXPPRF_S Registers
pub const PFMXPPRF_S = extern struct {
    /// No Description
    /// offset: 0x00
    RFIMDCDCCTRL0: mmio.Mmio(packed struct(u32) {
        /// TX Max Req
        TXMAXREQ: u1 = 0x0,
        /// RX PP Req
        RXPPREQ: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x04
    RFIMDCDCCTRL1: mmio.Mmio(packed struct(u32) {
        /// DCDC DIV Enable
        DCDCDIVEN: u1 = 0x0,
        /// DCDC DIV Inverter Enable
        DCDCDIVINVEN: u1 = 0x0,
        /// DCDC DIV Ratio
        DCDCDIVRATIO: enum(u4) {
            /// Dividing master_rf clk by 8, D=50%
            DIVRATIO8 = 0x0,
            /// Dividing master_rf clk by 9, D=44.4%
            DIVRATIO9 = 0x1,
            /// Dividing master_rf clk by 10, D=40%
            DIVRATIO10 = 0x2,
            /// Dividing master_rf clk by 11, D=36.4%
            DIVRATIO11 = 0x3,
            /// Dividing master_rf clk by 12, D=50%
            DIVRATIO12 = 0x4,
            /// Dividing master_rf clk by 13, D=46.2%
            DIVRATIO13 = 0x5,
            /// Dividing master_rf clk by 14, D=42.9%
            DIVRATIO14 = 0x6,
            /// Dividing master_rf clk by 15, D=40%
            DIVRATIO15 = 0x7,
            /// Dividing master_rf clk by 16, D=50%
            DIVRATIO16 = 0x8,
            /// Dividing master_rf clk by 17, D=47.1%
            DIVRATIO17 = 0x9,
            /// Dividing master_rf clk by 18, D=44.4%
            DIVRATIO18 = 0xa,
            /// Dividing master_rf clk by 19, D=42.1%
            DIVRATIO19 = 0xb,
            /// Dividing master_rf clk by 20, D=60%
            DIVRATIO20 = 0xc,
            /// Dividing master_rf clk by 21, D=57.1%
            DIVRATIO21 = 0xd,
            /// Dividing master_rf clk by 22, D=54.5%
            DIVRATIO22 = 0xe,
            /// Dividing master_rf clk by 23, D=52.2%
            DIVRATIO23 = 0xf,
        } = .DIVRATIO13,
        padding: u26 = 0,
    }),
    /// No Description
    /// offset: 0x08
    RFIMDCDCCTRL2: mmio.Mmio(packed struct(u32) {
        /// Pulse Pairing Time Max
        PPTMAX: u9 = 0xA0,
        /// Pulse Pairing Time Min
        PPTMIN: u9 = 0x5A,
        /// Pulse Pairing Period
        PPND: u9 = 0xB4,
        /// Pulse Pairing Calibration Loop Enable
        PPCALEN: u1 = 0x1,
        /// Pulse Pairing Sync Only
        PPSYNCONLY: u1 = 0x0,
        padding: u3 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    RFIMDCDCSTATUS: mmio.Mmio(packed struct(u32) {
        /// DCDC Enable Status
        DCDCEN: u1 = 0x0,
        /// TX MAX Status
        TXMAXSTATUS: u1 = 0x0,
        /// RX PP Status
        RXPPSTATUS: u1 = 0x0,
        reserved8: u5 = 0,
        /// Cal Loop WNO1 value
        WNO1: u9 = 0x0,
        padding: u15 = 0,
    }),
    /// Protected register address = (RPURATD register index X 32 + RPURATD bit index) X 4.
    /// offset: 0x10
    RPURATD0: mmio.Mmio(packed struct(u32) {
        /// RFIMDCDCCTRL0 Protection Bit
        RATDRFIMDCDCCTRL0: u1 = 0x0,
        /// RFIMDCDCCTRL1 Protection Bit
        RATDRFIMDCDCCTRL1: u1 = 0x0,
        /// RFIMDCDCCTRL2 Protection Bit
        RATDRFIMDCDCCTRL2: u1 = 0x0,
        padding: u29 = 0,
    }),
};
