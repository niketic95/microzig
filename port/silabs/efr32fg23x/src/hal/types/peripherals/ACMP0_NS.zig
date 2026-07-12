const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// ACMP0_NS Registers
pub const ACMP0_NS = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP version ID
        IPVERSION: u32 = 0x1,
    }),
    /// No Description
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// Module enable
        EN: u1 = 0x0,
        /// Disablement busy status
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x08
    SWRST: mmio.Mmio(packed struct(u32) {
        /// Software reset
        SWRST: u1 = 0x0,
        /// Software reset busy status
        RESETTING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    CFG: mmio.Mmio(packed struct(u32) {
        /// Bias Configuration
        BIAS: u3 = 0x4,
        reserved8: u5 = 0,
        /// Hysteresis mode
        HYST: enum(u4) {
            /// Hysteresis disabled
            DISABLED = 0x0,
            /// 10mV symmetrical hysteresis
            SYM10MV = 0x1,
            /// 20mV symmetrical hysteresis
            SYM20MV = 0x2,
            /// 30mV symmetrical hysteresis
            SYM30MV = 0x3,
            /// 10mV hysteresis on positive edge transitions
            POS10MV = 0x4,
            /// 20mV hysteresis on positive edge transitions
            POS20MV = 0x5,
            /// 30mV hysteresis on positive edge transitions
            POS30MV = 0x6,
            /// 10mV hysteresis on negative edge transitions
            NEG10MV = 0x8,
            /// 20mV hysteresis on negative edge transitions
            NEG20MV = 0x9,
            /// 30mV hysteresis on negative edge transitions
            NEG30MV = 0xa,
            _,
        } = .DISABLED,
        reserved16: u4 = 0,
        /// Input Range
        INPUTRANGE: enum(u1) {
            /// Use this setting when the input to the comparator core can be from 0 to AVDD.
            FULL = 0x0,
            /// It is recommended to use this setting when the input to the comparator core will always be less than AVDD-0.7V.
            REDUCED = 0x1,
        } = .FULL,
        /// ACMP accuracy mode
        ACCURACY: enum(u1) {
            /// ACMP operates in low-accuracy mode but consumes less current.
            LOW = 0x0,
            /// ACMP operates in high-accuracy mode but consumes more current.
            HIGH = 0x1,
        } = .LOW,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0x10
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Not Ready Value
        NOTRDYVAL: enum(u1) {
            /// ACMP output is 0 when the ACMP is not ready.
            LOW = 0x0,
            /// ACMP output is 1 when the ACMP is not ready.
            HIGH = 0x1,
        } = .LOW,
        /// Comparator GPIO Output Invert
        GPIOINV: enum(u1) {
            /// The comparator output to GPIO is not inverted
            NOTINV = 0x0,
            /// The comparator output to GPIO is inverted
            INV = 0x1,
        } = .NOTINV,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x14
    INPUTCTRL: mmio.Mmio(packed struct(u32) {
        /// Positive Input Select
        POSSEL: enum(u8) {
            /// VSS
            VSS = 0x0,
            /// Divided AVDD
            VREFDIVAVDD = 0x10,
            /// Low-Power Divided AVDD
            VREFDIVAVDDLP = 0x11,
            /// Divided 1V25 reference
            VREFDIV1V25 = 0x12,
            /// Low-power Divided 1V25 reference
            VREFDIV1V25LP = 0x13,
            /// Divided 2V5 reference
            VREFDIV2V5 = 0x14,
            /// Low-power Divided 2V5 reference
            VREFDIV2V5LP = 0x15,
            /// VSENSE0 divided by 4
            VSENSE01DIV4 = 0x20,
            /// Low-power VSENSE0 divided by 4
            VSENSE01DIV4LP = 0x21,
            /// VSENSE1 divided by 4
            VSENSE11DIV4 = 0x22,
            /// Low-power VSENSE1 divided by 4
            VSENSE11DIV4LP = 0x23,
            /// VDAC0 channel 0 output
            VDACOUT0 = 0x40,
            /// VDAC0 channel 1 output
            VDACOUT1 = 0x41,
            /// External interface, base is PA0.
            EXTPA = 0x50,
            /// External interface, base is PB0.
            EXTPB = 0x51,
            /// External interface, base is PC0.
            EXTPC = 0x52,
            /// External interface, base is PD0.
            EXTPD = 0x53,
            /// Port A, Pin0
            PA0 = 0x80,
            /// Port A, Pin1
            PA1 = 0x81,
            /// Port A, Pin2
            PA2 = 0x82,
            /// Port A, Pin3
            PA3 = 0x83,
            /// Port A, Pin4
            PA4 = 0x84,
            /// Port A, Pin5
            PA5 = 0x85,
            /// Port A, Pin6
            PA6 = 0x86,
            /// Port A, Pin7
            PA7 = 0x87,
            /// Port A, Pin8
            PA8 = 0x88,
            /// Port A, Pin9
            PA9 = 0x89,
            /// Port A, Pin10
            PA10 = 0x8a,
            /// Port A, Pin11
            PA11 = 0x8b,
            /// Port A, Pin12
            PA12 = 0x8c,
            /// Port A, Pin13
            PA13 = 0x8d,
            /// Port A, Pin14
            PA14 = 0x8e,
            /// Port A, Pin15
            PA15 = 0x8f,
            /// Port B, Pin0
            PB0 = 0x90,
            /// Port B, Pin1
            PB1 = 0x91,
            /// Port B, Pin2
            PB2 = 0x92,
            /// Port B, Pin3
            PB3 = 0x93,
            /// Port B, Pin4
            PB4 = 0x94,
            /// Port B, Pin5
            PB5 = 0x95,
            /// Port B, Pin6
            PB6 = 0x96,
            /// Port B, Pin7
            PB7 = 0x97,
            /// Port B, Pin8
            PB8 = 0x98,
            /// Port B, Pin9
            PB9 = 0x99,
            /// Port B, Pin10
            PB10 = 0x9a,
            /// Port B, Pin11
            PB11 = 0x9b,
            /// Port B, Pin12
            PB12 = 0x9c,
            /// Port B, Pin13
            PB13 = 0x9d,
            /// Port B, Pin14
            PB14 = 0x9e,
            /// Port B, Pin15
            PB15 = 0x9f,
            /// Port C, Pin0
            PC0 = 0xa0,
            /// Port C, Pin1
            PC1 = 0xa1,
            /// Port C, Pin2
            PC2 = 0xa2,
            /// Port C, Pin3
            PC3 = 0xa3,
            /// Port C, Pin4
            PC4 = 0xa4,
            /// Port C, Pin5
            PC5 = 0xa5,
            /// Port C, Pin6
            PC6 = 0xa6,
            /// Port C, Pin7
            PC7 = 0xa7,
            /// Port C, Pin8
            PC8 = 0xa8,
            /// Port C, Pin9
            PC9 = 0xa9,
            /// Port C, Pin10
            PC10 = 0xaa,
            /// Port C, Pin11
            PC11 = 0xab,
            /// Port C, Pin12
            PC12 = 0xac,
            /// Port C, Pin13
            PC13 = 0xad,
            /// Port C, Pin14
            PC14 = 0xae,
            /// Port C, Pin15
            PC15 = 0xaf,
            /// Port D, Pin0
            PD0 = 0xb0,
            /// Port D, Pin1
            PD1 = 0xb1,
            /// Port D, Pin2
            PD2 = 0xb2,
            /// Port D, Pin3
            PD3 = 0xb3,
            /// Port D, Pin4
            PD4 = 0xb4,
            /// Port D, Pin5
            PD5 = 0xb5,
            /// Port D, Pin6
            PD6 = 0xb6,
            /// Port D, Pin7
            PD7 = 0xb7,
            /// Port D, Pin8
            PD8 = 0xb8,
            /// Port D, Pin9
            PD9 = 0xb9,
            /// Port D, Pin10
            PD10 = 0xba,
            /// Port D, Pin11
            PD11 = 0xbb,
            /// Port D, Pin12
            PD12 = 0xbc,
            /// Port D, Pin13
            PD13 = 0xbd,
            /// Port D, Pin14
            PD14 = 0xbe,
            /// Port D, Pin15
            PD15 = 0xbf,
            _,
        } = .VSS,
        /// Negative Input Select
        NEGSEL: enum(u8) {
            /// VSS
            VSS = 0x0,
            /// Divided AVDD
            VREFDIVAVDD = 0x10,
            /// Low-Power Divided AVDD
            VREFDIVAVDDLP = 0x11,
            /// Divided 1V25 reference
            VREFDIV1V25 = 0x12,
            /// Low-power Divided 1V25 reference
            VREFDIV1V25LP = 0x13,
            /// Divided 2V5 reference
            VREFDIV2V5 = 0x14,
            /// Low-power Divided 2V5 reference
            VREFDIV2V5LP = 0x15,
            /// VSENSE0 divided by 4
            VSENSE01DIV4 = 0x20,
            /// Low-power VSENSE0 divided by 4
            VSENSE01DIV4LP = 0x21,
            /// VSENSE1 divided by 4
            VSENSE11DIV4 = 0x22,
            /// Low-power VSENSE1 divided by 4
            VSENSE11DIV4LP = 0x23,
            /// Deprecated capacitive sensing feature, not recommended for new designs
            CAPSENSE = 0x30,
            /// VDAC0 channel 0 output
            VDACOUT0 = 0x40,
            /// VDAC0 channel 1 output
            VDACOUT1 = 0x41,
            /// Port A, Pin0
            PA0 = 0x80,
            /// Port A, Pin1
            PA1 = 0x81,
            /// Port A, Pin2
            PA2 = 0x82,
            /// Port A, Pin3
            PA3 = 0x83,
            /// Port A, Pin4
            PA4 = 0x84,
            /// Port A, Pin5
            PA5 = 0x85,
            /// Port A, Pin6
            PA6 = 0x86,
            /// Port A, Pin7
            PA7 = 0x87,
            /// Port A, Pin8
            PA8 = 0x88,
            /// Port A, Pin9
            PA9 = 0x89,
            /// Port A, Pin10
            PA10 = 0x8a,
            /// Port A, Pin11
            PA11 = 0x8b,
            /// Port A, Pin12
            PA12 = 0x8c,
            /// Port A, Pin13
            PA13 = 0x8d,
            /// Port A, Pin14
            PA14 = 0x8e,
            /// Port A, Pin15
            PA15 = 0x8f,
            /// Port B, Pin0
            PB0 = 0x90,
            /// Port B, Pin1
            PB1 = 0x91,
            /// Port B, Pin2
            PB2 = 0x92,
            /// Port B, Pin3
            PB3 = 0x93,
            /// Port B, Pin4
            PB4 = 0x94,
            /// Port B, Pin5
            PB5 = 0x95,
            /// Port B, Pin6
            PB6 = 0x96,
            /// Port B, Pin7
            PB7 = 0x97,
            /// Port B, Pin8
            PB8 = 0x98,
            /// Port B, Pin9
            PB9 = 0x99,
            /// Port B, Pin10
            PB10 = 0x9a,
            /// Port B, Pin11
            PB11 = 0x9b,
            /// Port B, Pin12
            PB12 = 0x9c,
            /// Port B, Pin13
            PB13 = 0x9d,
            /// Port B, Pin14
            PB14 = 0x9e,
            /// Port B, Pin15
            PB15 = 0x9f,
            /// Port C, Pin0
            PC0 = 0xa0,
            /// Port C, Pin1
            PC1 = 0xa1,
            /// Port C, Pin2
            PC2 = 0xa2,
            /// Port C, Pin3
            PC3 = 0xa3,
            /// Port C, Pin4
            PC4 = 0xa4,
            /// Port C, Pin5
            PC5 = 0xa5,
            /// Port C, Pin6
            PC6 = 0xa6,
            /// Port C, Pin7
            PC7 = 0xa7,
            /// Port C, Pin8
            PC8 = 0xa8,
            /// Port C, Pin9
            PC9 = 0xa9,
            /// Port C, Pin10
            PC10 = 0xaa,
            /// Port C, Pin11
            PC11 = 0xab,
            /// Port C, Pin12
            PC12 = 0xac,
            /// Port C, Pin13
            PC13 = 0xad,
            /// Port C, Pin14
            PC14 = 0xae,
            /// Port C, Pin15
            PC15 = 0xaf,
            /// Port D, Pin0
            PD0 = 0xb0,
            /// Port D, Pin1
            PD1 = 0xb1,
            /// Port D, Pin2
            PD2 = 0xb2,
            /// Port D, Pin3
            PD3 = 0xb3,
            /// Port D, Pin4
            PD4 = 0xb4,
            /// Port D, Pin5
            PD5 = 0xb5,
            /// Port D, Pin6
            PD6 = 0xb6,
            /// Port D, Pin7
            PD7 = 0xb7,
            /// Port D, Pin8
            PD8 = 0xb8,
            /// Port D, Pin9
            PD9 = 0xb9,
            /// Port D, Pin10
            PD10 = 0xba,
            /// Port D, Pin11
            PD11 = 0xbb,
            /// Port D, Pin12
            PD12 = 0xbc,
            /// Port D, Pin13
            PD13 = 0xbd,
            /// Port D, Pin14
            PD14 = 0xbe,
            /// Port D, Pin15
            PD15 = 0xbf,
            _,
        } = .VSS,
        /// VREF division
        VREFDIV: u6 = 0x0,
        reserved28: u6 = 0,
        /// Capacitive Sense Mode Internal Resistor
        CSRESSEL: enum(u3) {
            /// Internal capacitive sense resistor value 0
            RES0 = 0x0,
            /// Internal capacitive sense resistor value 1
            RES1 = 0x1,
            /// Internal capacitive sense resistor value 2
            RES2 = 0x2,
            /// Internal capacitive sense resistor value 3
            RES3 = 0x3,
            /// Internal capacitive sense resistor value 4
            RES4 = 0x4,
            /// Internal capacitive sense resistor value 5
            RES5 = 0x5,
            /// Internal capacitive sense resistor value 6
            RES6 = 0x6,
            _,
        } = .RES0,
        padding: u1 = 0,
    }),
    /// No Description
    /// offset: 0x18
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Analog Comparator Output
        ACMPOUT: u1 = 0x0,
        reserved2: u1 = 0,
        /// Analog Comparator Ready
        ACMPRDY: u1 = 0x0,
        /// INPUT conflict
        INPUTCONFLICT: u1 = 0x0,
        /// Port allocation error
        PORTALLOCERR: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x1c
    IF: mmio.Mmio(packed struct(u32) {
        /// Rising Edge Triggered Interrupt Flag
        RISE: u1 = 0x0,
        /// Falling Edge Triggered Interrupt Flag
        FALL: u1 = 0x0,
        /// ACMP ready Interrupt flag
        ACMPRDY: u1 = 0x0,
        /// Input conflict
        INPUTCONFLICT: u1 = 0x0,
        /// Port allocation error
        PORTALLOCERR: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x20
    IEN: mmio.Mmio(packed struct(u32) {
        /// Rising edge interrupt enable
        RISE: u1 = 0x0,
        /// Falling edge interrupt enable
        FALL: u1 = 0x0,
        /// ACMP ready interrupt enable
        ACMPRDY: u1 = 0x0,
        /// Input conflict interrupt enable
        INPUTCONFLICT: u1 = 0x0,
        /// Port allocation error interrupt enable
        PORTALLOCERR: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// No Description
    /// offset: 0x24
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Syncbusy for INPUTCTRL
        INPUTCTRL: u1 = 0x0,
        padding: u31 = 0,
    }),
};
