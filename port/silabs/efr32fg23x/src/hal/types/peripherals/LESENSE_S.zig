const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// LESENSE_S Registers
pub const LESENSE_S = extern struct {
    /// IPVERSION
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IPVERSION
        IPVERSION: u32 = 0x1,
    }),
    /// Global Enable of LESENSE functions
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// Enable
        EN: enum(u1) {
            /// Disable
            DISABLE = 0x0,
            /// Enable
            ENABLE = 0x1,
        } = .DISABLE,
        /// Disabling
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x08
    SWRST: mmio.Mmio(packed struct(u32) {
        /// Software reset command
        SWRST: u1 = 0x0,
        /// Software reset busy status
        RESETTING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// Configuration Register
    /// offset: 0x0c
    CFG: mmio.Mmio(packed struct(u32) {
        /// Configure scan mode
        SCANMODE: enum(u2) {
            /// A new scan is started each time the period counter overflows
            PERIODIC = 0x0,
            /// A single scan is performed when START in CMD is set
            ONESHOT = 0x1,
            /// Pulse on PRS channel
            PRS = 0x2,
            _,
        } = .PERIODIC,
        /// Select scan configuration
        SCANCONF: enum(u2) {
            /// The channel configuration register registers used are directly mapped to the channel number.
            DIRMAP = 0x0,
            /// The channel configuration registers used are CH[X+8]_CONF for channels 0-7 and CH[X-8]_CONF for channels 8-15.
            INVMAP = 0x1,
            /// The channel configuration registers used toggle between CH[X]_CONF and CH[X+8]_CONF when channel x triggers
            TOGGLE = 0x2,
            /// The decoder state defines the CONF registers to be used.
            DECDEF = 0x3,
        } = .DIRMAP,
        reserved5: u1 = 0,
        /// Enable dual sample mode
        DUALSAMPLE: u1 = 0x0,
        /// Enable storing of SCANRES
        STRSCANRES: u1 = 0x0,
        /// DMA wake-up from EM2
        DMAWU: enum(u1) {
            /// No DMA wake-up from EM2
            DISABLE = 0x0,
            /// DMA wake-up from EM2 when FIFO count is greater or equal to RESFIDL
            ENABLE = 0x1,
        } = .DISABLE,
        /// Result FIFO level
        RESFIDL: u4 = 0x0,
        reserved17: u5 = 0,
        /// Debug Mode Run Enable
        DEBUGRUN: enum(u1) {
            /// LESENSE can not start new scans in debug mode
            X0 = 0x0,
            /// LESENSE can start new scans in debug mode
            X1 = 0x1,
        } = .X0,
        padding: u14 = 0,
    }),
    /// Timing Control Register
    /// offset: 0x10
    TIMCTRL: mmio.Mmio(packed struct(u32) {
        /// Prescaling factor for high frequency tim
        AUXPRESC: enum(u2) {
            /// High frequency timer is clocked at LESENSEHFCLK/1
            DIV1 = 0x0,
            /// High frequency timer is clocked at LESENSEHFCLK/2
            DIV2 = 0x1,
            /// High frequency timer is clocked at LESENSEHFCLK/4
            DIV4 = 0x2,
            /// High frequency timer is clocked at LESENSEHFCLK/8
            DIV8 = 0x3,
        } = .DIV1,
        reserved4: u2 = 0,
        /// Prescaling factor for low frequency time
        LFPRESC: enum(u3) {
            /// Low frequency timer is clocked with LESENSECLK/1
            DIV1 = 0x0,
            /// Low frequency timer is clocked with LESENSECLK/2
            DIV2 = 0x1,
            /// Low frequency timer is clocked with LESENSECLK/4
            DIV4 = 0x2,
            /// Low frequency timer is clocked with LESENSECLK/8
            DIV8 = 0x3,
            /// Low frequency timer is clocked with LESENSECLK/16
            DIV16 = 0x4,
            /// Low frequency timer is clocked with LESENSECLK/32
            DIV32 = 0x5,
            /// Low frequency timer is clocked with LESENSECLK/64
            DIV64 = 0x6,
            /// Low frequency timer is clocked with LESENSECLK/128
            DIV128 = 0x7,
        } = .DIV1,
        reserved8: u1 = 0,
        /// Period counter prescaling
        PCPRESC: enum(u3) {
            /// The period counter clock frequency is LESENSECLK/1
            DIV1 = 0x0,
            /// The period counter clock frequency is LESENSECLK/2
            DIV2 = 0x1,
            /// The period counter clock frequency is LESENSECLK/4
            DIV4 = 0x2,
            /// The period counter clock frequency is LESENSECLK/8
            DIV8 = 0x3,
            /// The period counter clock frequency is LESENSECLK/16
            DIV16 = 0x4,
            /// The period counter clock frequency is LESENSECLK/32
            DIV32 = 0x5,
            /// The period counter clock frequency is LESENSECLK/64
            DIV64 = 0x6,
            /// The period counter clock frequency is LESENSECLK/128
            DIV128 = 0x7,
        } = .DIV1,
        reserved12: u1 = 0,
        /// Period counter top value
        PCTOP: u8 = 0x0,
        reserved22: u2 = 0,
        /// Start delay configuration
        STARTDLY: u2 = 0x0,
        reserved28: u4 = 0,
        /// AUX startup config
        AUXSTARTUP: enum(u1) {
            /// Request oscillator .5 LESENSECLK cycle before sensing starts
            PREDEMAND = 0x0,
            /// Request oscillator at sensing time
            ONDEMAND = 0x1,
        } = .PREDEMAND,
        padding: u3 = 0,
    }),
    /// Peripheral Control Register
    /// offset: 0x14
    PERCTRL: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// DAC CH0 data selection.
        DACCH0DATA: enum(u1) {
            /// DAC data is defined by CH0DATA in the DAC interface.
            DACDATA = 0x0,
            /// DAC data is defined by THRES in CHx_INTERACT.
            THRES = 0x1,
        } = .DACDATA,
        reserved6: u3 = 0,
        /// DAC startup configuration
        DACSTARTUP: enum(u1) {
            /// DAC is started a full LESENSECLK before sensor interaction starts.
            FULLCYCLE = 0x0,
            /// DAC is started half a LESENSECLK cycle before sensor interaction starts.
            HALFCYCLE = 0x1,
        } = .FULLCYCLE,
        reserved8: u1 = 0,
        /// DAC conversion trigger configuration
        DACCONVTRIG: enum(u1) {
            /// DAC is enabled before every LESENSE channle measurement.
            CHANNELSTART = 0x0,
            /// DAC is only enabled once per scan.
            SCANSTART = 0x1,
        } = .CHANNELSTART,
        reserved20: u11 = 0,
        /// ACMP0 mode
        ACMP0MODE: enum(u1) {
            /// LESENSE controls POSSEL of ACMP0
            MUX = 0x0,
            /// LESENSE controls POSSEL and reference divider of ACMP0
            MUXTHRES = 0x1,
        } = .MUX,
        reserved22: u1 = 0,
        /// ACMP1 mode
        ACMP1MODE: enum(u1) {
            /// LESENSE controls the POSSEL of ACMP1
            MUX = 0x0,
            /// LESENSE POSSEL and reference divider of ACMP1
            MUXTHRES = 0x1,
        } = .MUX,
        reserved24: u1 = 0,
        /// Invert analog comparator 0 output
        ACMP0INV: u1 = 0x0,
        /// Invert analog comparator 1 output
        ACMP1INV: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Decoder control Register
    /// offset: 0x18
    DECCTRL: mmio.Mmio(packed struct(u32) {
        /// Disable the decoder
        DECDIS: u1 = 0x0,
        reserved2: u1 = 0,
        /// Enable decoder to channel interrupt map
        INTMAP: u1 = 0x0,
        /// Enable decoder hysteresis on PRS0 output
        HYSTPRS0: u1 = 0x0,
        /// Enable decoder hysteresis on PRS1 output
        HYSTPRS1: u1 = 0x0,
        /// Enable decoder hysteresis on PRS2 output
        HYSTPRS2: u1 = 0x0,
        /// Enable decoder hysteresis on interrupt r
        HYSTIRQ: u1 = 0x0,
        /// Enable count mode on decoder PRS channel
        PRSCNT: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// LESENSE evaluation control
    /// offset: 0x1c
    EVALCTRL: mmio.Mmio(packed struct(u32) {
        /// Sliding window and step detection size
        WINSIZE: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// PRS control register
    /// offset: 0x20
    PRSCTRL: mmio.Mmio(packed struct(u32) {
        /// Decoder state compare value
        DECCMPVAL: u5 = 0x0,
        reserved8: u3 = 0,
        /// Decoder state compare value mask
        DECCMPMASK: u5 = 0x0,
        reserved16: u3 = 0,
        /// Enable PRS output DECCMP
        DECCMPEN: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// Command Register
    /// offset: 0x24
    CMD: mmio.Mmio(packed struct(u32) {
        /// Start scanning of sensors.
        START: u1 = 0x0,
        /// Stop scanning of sensors
        STOP: u1 = 0x0,
        /// Start decoder
        DECODE: u1 = 0x0,
        /// Clear result buffer
        CLEARBUF: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// Channel enable Register
    /// offset: 0x28
    CHEN: mmio.Mmio(packed struct(u32) {
        /// Enable scan channel
        CHEN: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// Scan result register
    /// offset: 0x2c
    SCANRES: mmio.Mmio(packed struct(u32) {
        /// Scan results
        SCANRES: u16 = 0x0,
        /// Direction of previous step detection
        STEPDIR: u16 = 0x0,
    }),
    /// Status Register
    /// offset: 0x30
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Result fifo valid
        RESFIFOV: u1 = 0x0,
        /// Result fifo full
        RESFIFOFULL: u1 = 0x0,
        reserved3: u1 = 0,
        /// LESENSE scan active
        SCANACTIVE: u1 = 0x0,
        /// LESENSE periodic counter running
        RUNNING: u1 = 0x0,
        /// FIFO Read Busy
        READBUSY: u1 = 0x0,
        /// FIFO Flushing
        FLUSHING: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// Result FIFO Count
    /// offset: 0x34
    RESCOUNT: mmio.Mmio(packed struct(u32) {
        /// Result Fifo Count
        COUNT: u5 = 0x0,
        padding: u27 = 0,
    }),
    /// Result Fifo
    /// offset: 0x38
    RESFIFO: mmio.Mmio(packed struct(u32) {
        /// Result data and source
        BUFDATASRC: u20 = 0x0,
        padding: u12 = 0,
    }),
    /// Current channel index
    /// offset: 0x3c
    CURCH: mmio.Mmio(packed struct(u32) {
        /// Shows the index of the current channel
        CURCH: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// Current decoder state
    /// offset: 0x40
    DECSTATE: mmio.Mmio(packed struct(u32) {
        /// Shows the current decoder state
        DECSTATE: u5 = 0x0,
        padding: u27 = 0,
    }),
    /// Decoder input register
    /// offset: 0x44
    SENSORSTATE: mmio.Mmio(packed struct(u32) {
        /// Sensor State
        SENSORSTATE: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// GPIO Idle phase configuration
    /// offset: 0x48
    IDLECONF: mmio.Mmio(packed struct(u32) {
        /// Channel IDLE configuration
        CHIDLE0: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE1: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE2: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE3: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE4: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE5: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE6: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE7: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE8: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE9: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE10: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE11: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE12: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE13: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE14: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
        /// Channel IDLE configuration
        CHIDLE15: enum(u2) {
            /// Channel output is disabled in idle phase
            DISABLE = 0x0,
            /// Channel output is high in idle phase
            HIGH = 0x1,
            /// Channel output is low in idle phase
            LOW = 0x2,
            /// Channel output is connected to DAC output in idle phase (CH 0,1,2 only)
            DAC = 0x3,
        } = .DISABLE,
    }),
    /// offset: 0x4c
    reserved76: [4]u8,
    /// Synchronization Busy Register
    /// offset: 0x50
    SYNCBUSY: mmio.Mmio(packed struct(u32) {
        /// Command
        CMD: u1 = 0x0,
        padding: u31 = 0,
    }),
    /// offset: 0x54
    reserved84: [12]u8,
    /// Interrupt Flags
    /// offset: 0x60
    IF: mmio.Mmio(packed struct(u32) {
        /// Channel
        CH0: u1 = 0x0,
        /// Channel
        CH1: u1 = 0x0,
        /// Channel
        CH2: u1 = 0x0,
        /// Channel
        CH3: u1 = 0x0,
        /// Channel
        CH4: u1 = 0x0,
        /// Channel
        CH5: u1 = 0x0,
        /// Channel
        CH6: u1 = 0x0,
        /// Channel
        CH7: u1 = 0x0,
        /// Channel
        CH8: u1 = 0x0,
        /// Channel
        CH9: u1 = 0x0,
        /// Channel
        CH10: u1 = 0x0,
        /// Channel
        CH11: u1 = 0x0,
        /// Channel
        CH12: u1 = 0x0,
        /// Channel
        CH13: u1 = 0x0,
        /// Channel
        CH14: u1 = 0x0,
        /// Channel
        CH15: u1 = 0x0,
        /// Scan Done
        SCANDONE: u1 = 0x0,
        /// Decoder
        DEC: u1 = 0x0,
        /// Result Watermark Level
        RESWL: u1 = 0x0,
        /// Result Overflow
        RESOF: u1 = 0x0,
        /// Counter Overflow
        CNTOF: u1 = 0x0,
        /// Result Underflow
        RESUF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// Interrupt Enables
    /// offset: 0x64
    IEN: mmio.Mmio(packed struct(u32) {
        /// Channel
        CH0: u1 = 0x0,
        /// Channel
        CH1: u1 = 0x0,
        /// Channel
        CH2: u1 = 0x0,
        /// Channel
        CH3: u1 = 0x0,
        /// Channel
        CH4: u1 = 0x0,
        /// Channel
        CH5: u1 = 0x0,
        /// Channel
        CH6: u1 = 0x0,
        /// Channel
        CH7: u1 = 0x0,
        /// Channel
        CH8: u1 = 0x0,
        /// Channel
        CH9: u1 = 0x0,
        /// Channel
        CH10: u1 = 0x0,
        /// Channel
        CH11: u1 = 0x0,
        /// Channel
        CH12: u1 = 0x0,
        /// Channel
        CH13: u1 = 0x0,
        /// Channel
        CH14: u1 = 0x0,
        /// Channel
        CH15: u1 = 0x0,
        /// Scan Complete
        SCANDONE: u1 = 0x0,
        /// Decoder
        DEC: u1 = 0x0,
        /// Result Watermark Level
        RESWL: u1 = 0x0,
        /// Result Overflow
        RESOF: u1 = 0x0,
        /// Counter Overflow
        CNTOF: u1 = 0x0,
        /// Result Underflow
        RESUF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// offset: 0x68
    reserved104: [152]u8,
    /// No Description
    /// offset: 0x100
    CH0_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x104
    CH0_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x108
    CH0_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x10c
    CH0_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x110
    CH1_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x114
    CH1_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x118
    CH1_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x11c
    CH1_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x120
    CH2_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x124
    CH2_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x128
    CH2_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x12c
    CH2_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x130
    CH3_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x134
    CH3_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x138
    CH3_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x13c
    CH3_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x140
    CH4_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x144
    CH4_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x148
    CH4_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x14c
    CH4_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x150
    CH5_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x154
    CH5_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x158
    CH5_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x15c
    CH5_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x160
    CH6_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x164
    CH6_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x168
    CH6_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x16c
    CH6_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x170
    CH7_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x174
    CH7_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x178
    CH7_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x17c
    CH7_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x180
    CH8_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x184
    CH8_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x188
    CH8_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x18c
    CH8_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x190
    CH9_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x194
    CH9_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x198
    CH9_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x19c
    CH9_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x1a0
    CH10_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x1a4
    CH10_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x1a8
    CH10_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x1ac
    CH10_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x1b0
    CH11_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x1b4
    CH11_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x1b8
    CH11_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x1bc
    CH11_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x1c0
    CH12_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x1c4
    CH12_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x1c8
    CH12_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x1cc
    CH12_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x1d0
    CH13_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x1d4
    CH13_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x1d8
    CH13_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x1dc
    CH13_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x1e0
    CH14_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x1e4
    CH14_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x1e8
    CH14_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x1ec
    CH14_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x1f0
    CH15_TIMING: mmio.Mmio(packed struct(u32) {
        /// Set excitation time
        EXTIME: u6 = 0x0,
        /// Set sample delay
        SAMPLEDLY: u8 = 0x0,
        /// Set measure delay
        MEASUREDLY: u10 = 0x0,
        padding: u8 = 0,
    }),
    /// No Description
    /// offset: 0x1f4
    CH15_INTERACT: mmio.Mmio(packed struct(u32) {
        /// ACMP threshold or DAC data
        THRES: u12 = 0x0,
        reserved16: u4 = 0,
        /// Set GPIO mode
        EXMODE: enum(u2) {
            /// Disabled
            DISABLE = 0x0,
            /// Push Pull, GPIO is driven high
            HIGH = 0x1,
            /// Push Pull, GPIO is driven low
            LOW = 0x2,
            /// DAC output
            DACOUT = 0x3,
        } = .DISABLE,
        /// Use alternative excite pin
        ALTEX: u1 = 0x0,
        /// Select clock used for timing of sample d
        SAMPLECLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Select clock used for excitation timing
        EXCLK: enum(u1) {
            /// Prescaled low-frequency LESENSECLK will be used for timing
            LFACLK = 0x0,
            /// Prescaled high-frequency LESENSEHFCLK will be used for timing
            AUXHFRCO = 0x1,
        } = .LFACLK,
        /// Enable interrupt generation
        SETIF: enum(u3) {
            /// No interrupt is generated
            NONE = 0x0,
            /// Set interrupt flag if the sensor triggers.
            LEVEL = 0x1,
            /// Set interrupt flag on positive edge of the sensor state
            POSEDGE = 0x2,
            /// Set interrupt flag on negative edge of the sensor state
            NEGEDGE = 0x3,
            /// Set interrupt flag on both edges of the sensor state
            BOTHEDGES = 0x4,
            _,
        } = .NONE,
        /// OFFSET for IADC/ACMP interaction
        OFFSET: u4 = 0x0,
        /// Sample mode Selection
        SAMPLE: enum(u2) {
            /// ACMPCOUNT
            ACMPCOUNT = 0x0,
            /// ACMP
            ACMP = 0x1,
            /// ADC
            ADC = 0x2,
            /// ADCDIFF
            ADCDIFF = 0x3,
        } = .ACMPCOUNT,
        padding: u2 = 0,
    }),
    /// No Description
    /// offset: 0x1f8
    CH15_EVALCFG: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Send result to decoder
        DECODE: u1 = 0x0,
        /// Select mode for threshold comparison
        COMP: enum(u1) {
            /// Comparison evaluates to 1 if sensor data is less than CTRTHRESHOLD, or if the ACMP output is 0
            LESS = 0x0,
            /// Comparison evaluates to 1 if sensor data is greater than, or equal to CTRTHRESHOLD, or if the ACMP output is 1
            GE = 0x1,
        } = .LESS,
        /// Enable storing of sensor sample in resul
        STRSAMPLE: enum(u2) {
            /// Nothing will be stored in the result buffer.
            DISABLE = 0x0,
            /// The sensor sample data will be stored in the result buffer.
            DATA = 0x1,
            /// The data source, i.e. the channel, will be stored alongside the sensor sample data.
            DATASRC = 0x2,
            _,
        } = .DISABLE,
        /// Enable inversion of result
        SCANRESINV: u1 = 0x0,
        reserved8: u1 = 0,
        /// Configure evaluation mode
        MODE: enum(u2) {
            /// Threshold comparison is used to evaluate sensor result
            THRES = 0x0,
            /// Sliding window is used to evaluate sensor result
            SLIDINGWIN = 0x1,
            /// Step detection is used to evaluate sensor result
            STEPDET = 0x2,
            _,
        } = .THRES,
        padding: u22 = 0,
    }),
    /// No Description
    /// offset: 0x1fc
    CH15_EVALTHRES: mmio.Mmio(packed struct(u32) {
        /// Threshold
        EVALTHRES: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// No Description
    /// offset: 0x200
    ST0_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x204
    ST1_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x208
    ST2_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x20c
    ST3_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x210
    ST4_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x214
    ST5_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x218
    ST6_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x21c
    ST7_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x220
    ST8_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x224
    ST9_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x228
    ST10_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x22c
    ST11_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x230
    ST12_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x234
    ST13_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x238
    ST14_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x23c
    ST15_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x240
    ST16_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x244
    ST17_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x248
    ST18_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x24c
    ST19_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x250
    ST20_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x254
    ST21_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x258
    ST22_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x25c
    ST23_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x260
    ST24_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x264
    ST25_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x268
    ST26_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x26c
    ST27_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x270
    ST28_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x274
    ST29_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x278
    ST30_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x27c
    ST31_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x280
    ST32_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x284
    ST33_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x288
    ST34_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x28c
    ST35_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x290
    ST36_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x294
    ST37_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x298
    ST38_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x29c
    ST39_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2a0
    ST40_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2a4
    ST41_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2a8
    ST42_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2ac
    ST43_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2b0
    ST44_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2b4
    ST45_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2b8
    ST46_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2bc
    ST47_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2c0
    ST48_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2c4
    ST49_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2c8
    ST50_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2cc
    ST51_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2d0
    ST52_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2d4
    ST53_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2d8
    ST54_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2dc
    ST55_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2e0
    ST56_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2e4
    ST57_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2e8
    ST58_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2ec
    ST59_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2f0
    ST60_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2f4
    ST61_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2f8
    ST62_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// No Description
    /// offset: 0x2fc
    ST63_ARC: mmio.Mmio(packed struct(u32) {
        /// Sensor compare value
        SCOMP: u4 = 0x0,
        /// Sensor mask
        SMASK: u4 = 0x0,
        /// Current State
        CURSTATE: u5 = 0x0,
        /// Configure transition action in normal mode
        PRSACT: enum(u3) {
            /// No PRS output generated (if PRSCOUNT == 0), or do not count (if PRSCOUNT == 1).
            NONE = 0x0,
            /// Pulse generated on LESENSE PRS output 0 (if PRSCOUNT == 0).
            PRS0 = 0x1,
            /// Pulse generated on LESENSE PRS output 1 (if PRSCOUNT == 0).
            PRS1 = 0x2,
            /// Pulse generated on LESENSE PRS output 0 and 1 (if PRSCOUNT == 0).
            PRS01 = 0x3,
            /// Pulse generated on LESENSE PRS output 2. (PRSCOUNT == 0 OR 1).
            PRS2 = 0x4,
            /// Pulse generated on LESENSE PRS output 0 and 2 (if PRSCOUNT == 0).
            PRS02 = 0x5,
            /// Pulse generated on LESENSE PRS output 1 and 2 (if PRSCOUNT == 0).
            PRS12 = 0x6,
            /// Pulse generated on LESENSE PRS output 0, 1 and 2 (if PRSCOUNT == 0).
            PRS012 = 0x7,
        } = .NONE,
        /// Next state index
        NEXTSTATE: u5 = 0x0,
        /// Set interrupt flag
        SETIF: u1 = 0x0,
        padding: u10 = 0,
    }),
};
