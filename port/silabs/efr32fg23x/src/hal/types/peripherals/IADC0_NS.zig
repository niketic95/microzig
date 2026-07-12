const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// IADC0_NS Registers
pub const IADC0_NS = extern struct {
    /// IPVERSION
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// IP version ID
        IPVERSION: u32 = 0x2,
    }),
    /// Enable
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// Enable IADC Module
        EN: enum(u1) {
            /// Disable
            DISABLE = 0x0,
            /// Enable
            ENABLE = 0x1,
        } = .DISABLE,
        /// Disablement busy status
        DISABLING: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// Control
    /// offset: 0x08
    CTRL: mmio.Mmio(packed struct(u32) {
        /// EM23 Wakeup on Conversion
        EM23WUCONVERT: enum(u1) {
            /// When using suspend mode, conversions performed in EM2 or EM3 should not wake up the DMA until the FIFO's DVL setting is reached. This saves more power for large OSR settings or infrequent sampling.
            WUDVL = 0x0,
            /// When using suspend mode, conversions performed in EM2 or EM3 will wake up the DMA and keep it awake until the conversions are done, regardless of the DVL setting. This mode burns more power, but it is useful when the conversion rate is faster than the time for the DMA to cycle through wake up and going back to sleep as it converts more than 4 scan table entries. Without using the wake up on conversion mode, the FIFO may overflow while the DMA is going in and out of sleep.
            WUCONVERT = 0x1,
        } = .WUDVL,
        /// ADC_CLK Suspend - PRS0
        ADCCLKSUSPEND0: enum(u1) {
            /// Normal mode which does not disable the ADC_CLK.
            PRSWUDIS = 0x0,
            /// ADCCLKWUEN will gate off ADC_CLK until the trigger is detected provided the internal timer is not selected as the trigger. Once the trigger is detected the ADC_CLK will be started, the band gap will be started, the ADC will be warmed up, and the SCAN Table and the Single entry will be converted. Once the conversions are done, the ADC_CLK will be gated off.
            PRSWUEN = 0x1,
        } = .PRSWUDIS,
        /// ADC_CLK Suspend - PRS1
        ADCCLKSUSPEND1: enum(u1) {
            /// Normal mode which does not disable the ADC_CLK.
            PRSWUDIS = 0x0,
            /// ADCCLKWUEN will gate off ADC_CLK until the trigger is detected provided the internal timer is not selected as the trigger. Once the trigger is detected the ADC_CLK will be started, the band gap will be started, the ADC will be warmed up, and the SCAN Table and the Single entry will be converted. Once the conversions are done, the ADC_CLK will be gated off.
            PRSWUEN = 0x1,
        } = .PRSWUDIS,
        /// Debug Halt
        DBGHALT: enum(u1) {
            /// Continue operation as normal during debug mode
            NORMAL = 0x0,
            /// Complete the current conversion and then halt during debug mode
            HALT = 0x1,
        } = .NORMAL,
        /// Warmup Mode
        WARMUPMODE: enum(u2) {
            /// Shut down the IADC after conversions have completed.
            NORMAL = 0x0,
            /// Switch to standby mode after conversions have completed. The next warmup time will require 1us.
            KEEPINSTANDBY = 0x1,
            /// Keep IADC fully powered after conversions have completed.
            KEEPWARM = 0x2,
            _,
        } = .NORMAL,
        reserved16: u10 = 0,
        /// Time Base
        TIMEBASE: u7 = 0x0,
        reserved28: u5 = 0,
        /// High Speed Clock Rate
        HSCLKRATE: enum(u3) {
            /// Use CMU_CLK_ADC directly. The source clock must be 40 MHz or less.
            DIV1 = 0x0,
            /// Divide CMU_CLK_ADC by 2 before using it. The resulting CLK_SRC_ADC must be 40 MHz or less.
            DIV2 = 0x1,
            /// Divide CMU_CLK_ADC by 3 before using it. The resulting CLK_SRC_ADC must be 40 MHz or less.
            DIV3 = 0x2,
            /// Divide CMU_CLK_ADC by 4 before using it. The resulting CLK_SRC_ADC must be 40 MHz or less.
            DIV4 = 0x3,
            _,
        } = .DIV1,
        padding: u1 = 0,
    }),
    /// Command
    /// offset: 0x0c
    CMD: mmio.Mmio(packed struct(u32) {
        /// Single Queue Start
        SINGLESTART: u1 = 0x0,
        /// Single Queue Stop
        SINGLESTOP: u1 = 0x0,
        reserved3: u1 = 0,
        /// Scan Queue Start
        SCANSTART: u1 = 0x0,
        /// Scan Queue Stop
        SCANSTOP: u1 = 0x0,
        reserved16: u11 = 0,
        /// Timer Enable
        TIMEREN: u1 = 0x0,
        /// Timer Disable
        TIMERDIS: u1 = 0x0,
        reserved24: u6 = 0,
        /// Flush the Single FIFO
        SINGLEFIFOFLUSH: u1 = 0x0,
        /// Flush the Scan FIFO
        SCANFIFOFLUSH: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Timer
    /// offset: 0x10
    TIMER: mmio.Mmio(packed struct(u32) {
        /// Timer Period
        TIMER: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// Status
    /// offset: 0x14
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Single Queue Enabled
        SINGLEQEN: u1 = 0x0,
        /// Single Queue Pending
        SINGLEQUEUEPENDING: u1 = 0x0,
        reserved3: u1 = 0,
        /// Scan Queued Enabled
        SCANQEN: u1 = 0x0,
        /// Scan Queue Pending
        SCANQUEUEPENDING: u1 = 0x0,
        reserved6: u1 = 0,
        /// Converting
        CONVERTING: u1 = 0x0,
        reserved8: u1 = 0,
        /// SINGLEFIFO Data Valid
        SINGLEFIFODV: u1 = 0x0,
        /// SCANFIFO Data Valid
        SCANFIFODV: u1 = 0x0,
        reserved14: u4 = 0,
        /// The Single FIFO is flushing
        SINGLEFIFOFLUSHING: u1 = 0x0,
        /// The Scan FIFO is flushing
        SCANFIFOFLUSHING: u1 = 0x0,
        /// Timer Active
        TIMERACTIVE: u1 = 0x0,
        reserved20: u3 = 0,
        /// SINGLE write pending
        SINGLEWRITEPENDING: u1 = 0x0,
        /// MASKREQ write pending
        MASKREQWRITEPENDING: u1 = 0x0,
        reserved24: u2 = 0,
        /// SYNCBUSY
        SYNCBUSY: u1 = 0x0,
        reserved30: u5 = 0,
        /// ADCWARM
        ADCWARM: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// Mask Request
    /// offset: 0x18
    MASKREQ: mmio.Mmio(packed struct(u32) {
        /// Scan Queue Mask Request
        MASKREQ: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// Scan Table Mask
    /// offset: 0x1c
    STMASK: mmio.Mmio(packed struct(u32) {
        /// Scan Table Mask
        STMASK: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// Comparator Threshold
    /// offset: 0x20
    CMPTHR: mmio.Mmio(packed struct(u32) {
        /// ADC Less Than or Equal to Threshold
        ADLT: u16 = 0x0,
        /// ADC Greater Than or Equal to Threshold
        ADGT: u16 = 0x0,
    }),
    /// Interrupt Flag
    /// offset: 0x24
    IF: mmio.Mmio(packed struct(u32) {
        /// Single FIFO Data Valid Level
        SINGLEFIFODVL: u1 = 0x0,
        /// Scan FIFO Data Valid Level
        SCANFIFODVL: u1 = 0x0,
        /// Single Result Window Compare
        SINGLECMP: u1 = 0x0,
        /// Scan Result Window Compare
        SCANCMP: u1 = 0x0,
        reserved7: u3 = 0,
        /// Scan Entry Done
        SCANENTRYDONE: u1 = 0x0,
        /// Scan Table Done
        SCANTABLEDONE: u1 = 0x0,
        /// Single Conversion Done
        SINGLEDONE: u1 = 0x0,
        reserved12: u2 = 0,
        /// Polarity Error
        POLARITYERR: u1 = 0x0,
        /// Port Allocation Error
        PORTALLOCERR: u1 = 0x0,
        reserved16: u2 = 0,
        /// Single FIFO Overflow
        SINGLEFIFOOF: u1 = 0x0,
        /// Scan FIFO Overflow
        SCANFIFOOF: u1 = 0x0,
        /// Single FIFO Underflow
        SINGLEFIFOUF: u1 = 0x0,
        /// Scan FIFO Underflow
        SCANFIFOUF: u1 = 0x0,
        reserved31: u11 = 0,
        /// EM2/3 Abort Error
        EM23ABORTERROR: u1 = 0x0,
    }),
    /// Interrupt Enable
    /// offset: 0x28
    IEN: mmio.Mmio(packed struct(u32) {
        /// Single FIFO Data Valid Level Enable
        SINGLEFIFODVL: u1 = 0x0,
        /// Scan FIFO Data Valid Level Enable
        SCANFIFODVL: u1 = 0x0,
        /// Single Result Window Compare Enable
        SINGLECMP: u1 = 0x0,
        /// Scan Result Window Compare Enable
        SCANCMP: u1 = 0x0,
        reserved7: u3 = 0,
        /// Scan Entry Done Enable
        SCANENTRYDONE: u1 = 0x0,
        /// Scan Table Done Enable
        SCANTABLEDONE: u1 = 0x0,
        /// Single Conversion Done Enable
        SINGLEDONE: u1 = 0x0,
        reserved12: u2 = 0,
        /// Polarity Error Enable
        POLARITYERR: u1 = 0x0,
        /// Port Allocation Error Enable
        PORTALLOCERR: u1 = 0x0,
        reserved16: u2 = 0,
        /// Single FIFO Overflow Enable
        SINGLEFIFOOF: u1 = 0x0,
        /// Scan FIFO Overflow Enable
        SCANFIFOOF: u1 = 0x0,
        /// Single FIFO Underflow Enable
        SINGLEFIFOUF: u1 = 0x0,
        /// Scan FIFO Underflow Enable
        SCANFIFOUF: u1 = 0x0,
        reserved31: u11 = 0,
        /// EM2/3 Abort Error Enable
        EM23ABORTERROR: u1 = 0x0,
    }),
    /// Trigger
    /// offset: 0x2c
    TRIGGER: mmio.Mmio(packed struct(u32) {
        /// Scan Trigger Select
        SCANTRIGSEL: enum(u3) {
            /// Immediate triggering. The scan queue will be disabled once all conversions in the scan table are complete, unless TRIGGERACTION is set to continuous.
            IMMEDIATE = 0x0,
            /// Triggers when the local timer count reaches zero.
            TIMER = 0x1,
            /// Triggers on PRS0 from a timer module that is using the same clock group as the ADC and has been programmed to use the same clock source as the ADC. The prescale may be different between the ADC and the timer module.
            PRSCLKGRP = 0x2,
            /// Triggers on asynchronous PRS0 positive edge. Requires PRS0 to go low for 3 ADC_CLKs before another positive edge can be detected. Generates an additional delay of 1 to 2 CLK_SRC_ADC cycles for synchronization.
            PRSPOS = 0x3,
            /// Triggers on asynchronous PRS0 negative edge. Requires PRS0 to go high for 3 ADC_CLKs before another negative edge can be detected. Generates an additional delay of 1 to 2 CLK_SRC_ADC cycles for synchronization. PRSNEG should only be used when the trigger source is from a module that remains powered during EM23. For modules (ie: TIMER) that power down during EM23, PRSPOS should be used for an asynchronous trigger, and PRSCLKGRP should be used for a synchronous trigger.
            PRSNEG = 0x4,
            /// Triggers on LESENSE convert request. When using the LESENSE for the SCAN Table, only one entry is converted per LESENSE convert request.
            LESENSE = 0x5,
            _,
        } = .IMMEDIATE,
        reserved4: u1 = 0,
        /// Scan Trigger Action
        SCANTRIGACTION: enum(u1) {
            /// For TRIGSEL=IMMEDIATE, goes through the scan table once and disables queue. For TRIGSEL = TIMER, PRSCLKGRP, PRSPOS, PRSNEG, goes through the scan table once per trigger.
            ONCE = 0x0,
            /// Goes through the scan table, converts each entry with a mask bit set, and puts it back into the scan queue to repeat again continuously. The queues are first come first serve. If both queues are triggered, the single queue will get to convert after each scan table completes. The scan queue will get to convert after each single conversion completes.
            CONTINUOUS = 0x1,
        } = .ONCE,
        reserved8: u3 = 0,
        /// Single Trigger Select
        SINGLETRIGSEL: enum(u3) {
            /// Immediate triggering. The single queue will be disabled once the conversion is complete, unless TRIGGERACTION is set to continuous.
            IMMEDIATE = 0x0,
            /// Triggers when the local timer count reaches zero.
            TIMER = 0x1,
            /// Triggers on PRS1 from a timer module that is using the same clock group as the ADC and has been programmed to use the same clock source as the ADC. The prescale may be different between the ADC and the timer module.
            PRSCLKGRP = 0x2,
            /// Triggers on asynchronous PRS1 positive edge. Requires PRS1 to go low for 3 ADC_CLKs before another positive edge can be detected. Generates an additional delay of 1 to 2 CLK_SRC_ADC cycles for synchronization.
            PRSPOS = 0x3,
            /// Triggers on asynchronous PRS1 negative edge. Requires PRS1 to go high for 3 ADC_CLKs before another negative edge can be detected. Generates an additional delay of 1 to 2 CLK_SRC_ADC cycles for synchronization. PRSNEG should only be used when the trigger source is from a module that remains powered during EM23. For modules (ie: TIMER) that power down during EM23, PRSPOS should be used for an asynchronous trigger, and PRSCLKGRP should be used for a synchronous trigger.
            PRSNEG = 0x4,
            _,
        } = .IMMEDIATE,
        reserved12: u1 = 0,
        /// Single Trigger Action
        SINGLETRIGACTION: enum(u1) {
            /// For TRIGSEL=IMMEDIATE, converts the single queue once and disables queue. For TRIGSEL = TIMER, PRSCLKGRP, PRSPOS, PRSNEG, converts the single queue once per trigger.
            ONCE = 0x0,
            /// Converts the single queue, then checks for a pending scan queue before converting the single queue again continuously. The queues are first come first serve. If both queues are continuous, the IADC alternates between them.
            CONTINUOUS = 0x1,
        } = .ONCE,
        reserved16: u3 = 0,
        /// Single Tailgate Enable
        SINGLETAILGATE: enum(u1) {
            /// The single queue is ready to start warming up and converting once the trigger had been detected.
            TAILGATEOFF = 0x0,
            /// After the single queue's trigger is detected, it must wait until the end of a scan operation before the Single queue can be converted.
            TAILGATEON = 0x1,
        } = .TAILGATEOFF,
        padding: u15 = 0,
    }),
    /// offset: 0x30
    reserved48: [24]u8,
    /// Configration
    /// offset: 0x48
    CFG0: mmio.Mmio(packed struct(u32) {
        /// ADC Mode
        ADCMODE: enum(u2) {
            /// High speed mode with a maximum ADC_CLK of 10 MHz.
            NORMAL = 0x0,
            _,
        } = .NORMAL,
        /// High Speed OSR
        OSRHS: enum(u3) {
            /// High speed over sampling of 2x.
            HISPD2 = 0x0,
            /// High speed over sampling of 4x.
            HISPD4 = 0x1,
            /// High speed over sampling of 8x.
            HISPD8 = 0x2,
            /// High speed over sampling of 16x.
            HISPD16 = 0x3,
            /// HIgh speed over sampling of 32x.
            HISPD32 = 0x4,
            /// High speed over sampling of 64x.
            HISPD64 = 0x5,
            _,
        } = .HISPD2,
        reserved12: u7 = 0,
        /// Analog Gain
        ANALOGGAIN: enum(u3) {
            /// Analog gain of 0.5x.
            ANAGAIN0P5 = 0x1,
            /// Analog gain of 1x.
            ANAGAIN1 = 0x2,
            /// Analog gain of 2x.
            ANAGAIN2 = 0x3,
            /// Analog gain of 3x.
            ANAGAIN3 = 0x4,
            /// Analog gain of 4x.
            ANAGAIN4 = 0x5,
            _,
        } = .ANAGAIN1,
        reserved16: u1 = 0,
        /// Reference Select
        REFSEL: enum(u3) {
            /// Internal 1.21 V reference.
            VBGR = 0x0,
            /// External Reference. (Calibrated for 1.25V nominal.)
            VREF = 0x1,
            /// AVDD (unbuffered)
            VDDX = 0x3,
            /// AVDD (buffered) * 0.8
            VDDX0P8BUF = 0x4,
            _,
        } = .VBGR,
        reserved21: u2 = 0,
        /// Digital Averaging
        DIGAVG: enum(u3) {
            /// Collect one output word (no digital averaging).
            AVG1 = 0x0,
            /// Collect and average 2 digital output words.
            AVG2 = 0x1,
            /// Collect and average 4 digital output words.
            AVG4 = 0x2,
            /// Collect and average 8 digital output words.
            AVG8 = 0x3,
            /// Collect and average 16 digital output words.
            AVG16 = 0x4,
            _,
        } = .AVG1,
        reserved28: u4 = 0,
        /// Two's Complement
        TWOSCOMPL: enum(u2) {
            /// Automatic: Single ended measurements are reported as unipolar and differential measurements are reported as bipolar.
            AUTO = 0x0,
            /// Force all measurements to result in unipolar output. Negative differential numbers will saturate to 0.
            FORCEUNIPOLAR = 0x1,
            /// Force all measurements to result in bipolar output. Single ended measurements are half the range, but allow for small negative measurements.
            FORCEBIPOLAR = 0x2,
            _,
        } = .AUTO,
        padding: u2 = 0,
    }),
    /// offset: 0x4c
    reserved76: [4]u8,
    /// Scale
    /// offset: 0x50
    SCALE0: mmio.Mmio(packed struct(u32) {
        /// Offset
        OFFSET: u18 = 0x2C000,
        /// Gain 13 LSBs
        GAIN13LSB: u13 = 0x0,
        /// Gain 3 MSBs
        GAIN3MSB: enum(u1) {
            /// Upper 3 bits of gain = 011 (0.75x)
            GAIN011 = 0x0,
            /// Upper 3 bits of gain = 100 (1.00x)
            GAIN100 = 0x1,
        } = .GAIN100,
    }),
    /// Scheduling
    /// offset: 0x54
    SCHED0: mmio.Mmio(packed struct(u32) {
        /// Prescale
        PRESCALE: u10 = 0x0,
        padding: u22 = 0,
    }),
    /// Configration
    /// offset: 0x58
    CFG1: mmio.Mmio(packed struct(u32) {
        /// ADC Mode
        ADCMODE: enum(u2) {
            /// High speed mode with a maximum ADC_CLK of 10 MHz.
            NORMAL = 0x0,
            _,
        } = .NORMAL,
        /// High Speed OSR
        OSRHS: enum(u3) {
            /// High speed over sampling of 2x.
            HISPD2 = 0x0,
            /// High speed over sampling of 4x.
            HISPD4 = 0x1,
            /// High speed over sampling of 8x.
            HISPD8 = 0x2,
            /// High speed over sampling of 16x.
            HISPD16 = 0x3,
            /// HIgh speed over sampling of 32x.
            HISPD32 = 0x4,
            /// High speed over sampling of 64x.
            HISPD64 = 0x5,
            _,
        } = .HISPD2,
        reserved12: u7 = 0,
        /// Analog Gain
        ANALOGGAIN: enum(u3) {
            /// Analog gain of 0.5x.
            ANAGAIN0P5 = 0x1,
            /// Analog gain of 1x.
            ANAGAIN1 = 0x2,
            /// Analog gain of 2x.
            ANAGAIN2 = 0x3,
            /// Analog gain of 3x.
            ANAGAIN3 = 0x4,
            /// Analog gain of 4x.
            ANAGAIN4 = 0x5,
            _,
        } = .ANAGAIN1,
        reserved16: u1 = 0,
        /// Reference Select
        REFSEL: enum(u3) {
            /// Internal 1.21 V reference.
            VBGR = 0x0,
            /// External Reference. (Calibrated for 1.25V nominal.)
            VREF = 0x1,
            /// AVDD (unbuffered)
            VDDX = 0x3,
            /// AVDD (buffered) * 0.8
            VDDX0P8BUF = 0x4,
            _,
        } = .VBGR,
        reserved21: u2 = 0,
        /// Digital Averaging
        DIGAVG: enum(u3) {
            /// Collect one output word (no digital averaging).
            AVG1 = 0x0,
            /// Collect and average 2 digital output words.
            AVG2 = 0x1,
            /// Collect and average 4 digital output words.
            AVG4 = 0x2,
            /// Collect and average 8 digital output words.
            AVG8 = 0x3,
            /// Collect and average 16 digital output words.
            AVG16 = 0x4,
            _,
        } = .AVG1,
        reserved28: u4 = 0,
        /// Two's Complement
        TWOSCOMPL: enum(u2) {
            /// Automatic: Single ended measurements are reported as unipolar and differential measurements are reported as bipolar.
            AUTO = 0x0,
            /// Force all measurements to result in unipolar output. Negative differential numbers will saturate to 0.
            FORCEUNIPOLAR = 0x1,
            /// Force all measurements to result in bipolar output. Single ended measurements are half the range, but allow for small negative measurements.
            FORCEBIPOLAR = 0x2,
            _,
        } = .AUTO,
        padding: u2 = 0,
    }),
    /// offset: 0x5c
    reserved92: [4]u8,
    /// Scale
    /// offset: 0x60
    SCALE1: mmio.Mmio(packed struct(u32) {
        /// Offset
        OFFSET: u18 = 0x2C000,
        /// Gain 13 LSBs
        GAIN13LSB: u13 = 0x0,
        /// Gain 3 MSBs
        GAIN3MSB: enum(u1) {
            /// Upper 3 bits of gain = 011 (0.75x)
            GAIN011 = 0x0,
            /// Upper 3 bits of gain = 100 (1.00x)
            GAIN100 = 0x1,
        } = .GAIN100,
    }),
    /// Scheduling
    /// offset: 0x64
    SCHED1: mmio.Mmio(packed struct(u32) {
        /// Prescale
        PRESCALE: u10 = 0x0,
        padding: u22 = 0,
    }),
    /// offset: 0x68
    reserved104: [8]u8,
    /// Single FIFO Configuration
    /// offset: 0x70
    SINGLEFIFOCFG: mmio.Mmio(packed struct(u32) {
        /// Alignment
        ALIGNMENT: enum(u3) {
            /// ID[7:0], SIGN_EXT, DATA[11:0]
            RIGHT12 = 0x0,
            /// ID[7:0], SIGN_EXT, DATA[15:0]
            RIGHT16 = 0x1,
            /// ID[7:0], SIGN_EXT, DATA[19:0]
            RIGHT20 = 0x2,
            /// DATA[11:0], 000000000000, ID[7:0]
            LEFT12 = 0x3,
            /// DATA[15:0], 00000000, ID[7:0]
            LEFT16 = 0x4,
            /// DATA[19:0], 0000, ID[7:0]
            LEFT20 = 0x5,
            _,
        } = .RIGHT12,
        /// Show ID
        SHOWID: u1 = 0x0,
        /// Data Valid Level
        DVL: enum(u3) {
            /// When 1 entry in the single FIFO is valid, set the SINGLEFIFODVL interrupt and request DMA.
            VALID1 = 0x0,
            /// When 2 entries in the single FIFO are valid, set the SINGLEFIFODVL interrupt and request DMA.
            VALID2 = 0x1,
            /// When 3 entries in the single FIFO are valid, set the SINGLEFIFODVL interrupt and request DMA.
            VALID3 = 0x2,
            /// When 4 entries in the single FIFO are valid, set the SINGLEFIFODVL interrupt and request DMA.
            VALID4 = 0x3,
            /// When 5 entries in the single FIFO are valid, set the SINGLEFIFODVL interrupt and request DMA.
            VALID5 = 0x4,
            /// When 6 entries in the single FIFO are valid, set the SINGLEFIFODVL interrupt and request DMA.
            VALID6 = 0x5,
            /// When 7 entries in the single FIFO are valid, set the SINGLEFIFODVL interrupt and request DMA.
            VALID7 = 0x6,
            /// When 8 entries in the single FIFO are valid, set the SINGLEFIFODVL interrupt and request DMA.
            VALID8 = 0x7,
        } = .VALID4,
        reserved8: u1 = 0,
        /// Single FIFO DMA wakeup.
        DMAWUFIFOSINGLE: enum(u1) {
            /// While in EM2 or EM3, the DMA controller will not be requested.
            DISABLED = 0x0,
            /// While in EM2 or EM3, the DMA controller will be requested when the single FIFO reaches its Data Valid Level. [DVL must be set to 0 (VALID1).]
            ENABLED = 0x1,
        } = .DISABLED,
        padding: u23 = 0,
    }),
    /// Read the oldest valid data from the single FIFO and pop the FIFO
    /// offset: 0x74
    SINGLEFIFODATA: mmio.Mmio(packed struct(u32) {
        /// Single FIFO Read Data
        DATA: u32 = 0x0,
    }),
    /// Single FIFO status
    /// offset: 0x78
    SINGLEFIFOSTAT: mmio.Mmio(packed struct(u32) {
        /// FIFO Read Count
        FIFOREADCNT: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// latest single queue conversion data
    /// offset: 0x7c
    SINGLEDATA: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// SCAN FIFO configuration
    /// offset: 0x80
    SCANFIFOCFG: mmio.Mmio(packed struct(u32) {
        /// Alignment
        ALIGNMENT: enum(u3) {
            /// ID[7:0], SIGN_EXT, DATA[11:0]
            RIGHT12 = 0x0,
            /// ID[7:0], SIGN_EXT, DATA[15:0]
            RIGHT16 = 0x1,
            /// ID[7:0], SIGN_EXT, DATA[19:0]
            RIGHT20 = 0x2,
            /// DATA[11:0], 000000000000, ID[7:0]
            LEFT12 = 0x3,
            /// DATA[15:0], 00000000, ID[7:0]
            LEFT16 = 0x4,
            /// DATA[19:0], 0000, ID[7:0]
            LEFT20 = 0x5,
            _,
        } = .RIGHT12,
        /// Show ID
        SHOWID: u1 = 0x0,
        /// Data Valid Level
        DVL: enum(u3) {
            /// When 1 entry in the scan FIFO is valid, set the SCANFIFODVL interrupt and request DMA.
            VALID1 = 0x0,
            /// When 2 entries in the scan FIFO are valid, set the SCANFIFODVL interrupt and request DMA.
            VALID2 = 0x1,
            /// When 3 entries in the scan FIFO are valid, set the SCANFIFODVL interrupt and request DMA.
            VALID3 = 0x2,
            /// When 4 entries in the scan FIFO are valid, set the SCANFIFODVL interrupt and request DMA.
            VALID4 = 0x3,
            /// When 5 entries in the scan FIFO are valid, set the SCANFIFODVL interrupt and request DMA.
            VALID5 = 0x4,
            /// When 6 entries in the scan FIFO are valid, set the SCANFIFODVL interrupt and request DMA.
            VALID6 = 0x5,
            /// When 7 entries in the scan FIFO are valid, set the SCANFIFODVL interrupt and request DMA.
            VALID7 = 0x6,
            /// When 8 entries in the scan FIFO are valid, set the SCANFIFODVL interrupt and request DMA.
            VALID8 = 0x7,
        } = .VALID4,
        reserved8: u1 = 0,
        /// Scan FIFO DMA Wakeup
        DMAWUFIFOSCAN: enum(u1) {
            /// While in EM2 or EM3, the DMA controller will not be requested.
            DISABLED = 0x0,
            /// While in EM2 or EM3, the DMA controller will be requested when the scan FIFO reaches its Data Valid Level. [DVL must be set to 0 (VALID1).]
            ENABLED = 0x1,
        } = .DISABLED,
        padding: u23 = 0,
    }),
    /// Read the oldest valid data from the scan FIFO and pop the FIFO
    /// offset: 0x84
    SCANFIFODATA: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// Scan FIFO status
    /// offset: 0x88
    SCANFIFOSTAT: mmio.Mmio(packed struct(u32) {
        /// FIFO Read Count
        FIFOREADCNT: u4 = 0x0,
        padding: u28 = 0,
    }),
    /// Most recent data data from scan queue conversion
    /// offset: 0x8c
    SCANDATA: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// offset: 0x90
    reserved144: [8]u8,
    /// No Description
    /// offset: 0x98
    SINGLE: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// offset: 0x9c
    reserved156: [4]u8,
    /// No Description
    /// offset: 0xa0
    SCAN0: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xa4
    SCAN1: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xa8
    SCAN2: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xac
    SCAN3: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xb0
    SCAN4: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xb4
    SCAN5: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xb8
    SCAN6: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xbc
    SCAN7: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xc0
    SCAN8: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xc4
    SCAN9: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xc8
    SCAN10: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xcc
    SCAN11: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xd0
    SCAN12: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xd4
    SCAN13: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xd8
    SCAN14: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// No Description
    /// offset: 0xdc
    SCAN15: mmio.Mmio(packed struct(u32) {
        /// Negative Pin Select
        PINNEG: u4 = 0x0,
        /// Negative Port Select
        PORTNEG: enum(u4) {
            /// Ground (single-ended)
            GND = 0x0,
            /// Direct connection to DAC0_CH1
            DAC1 = 0x2,
            /// Port A - Select pin number using PINNEG
            PORTA = 0x8,
            /// Port B - Select pin number using PINNEG
            PORTB = 0x9,
            /// Port C - Select pin number using PINNEG
            PORTC = 0xa,
            /// Port D - Select pin number using PINNEG
            PORTD = 0xb,
            _,
        } = .GND,
        /// Positive Pin Select
        PINPOS: u4 = 0x0,
        /// Positive Port Select
        PORTPOS: enum(u4) {
            /// Ground
            GND = 0x0,
            /// Supply Pin - Select specific supply using PINPOS
            SUPPLY = 0x1,
            /// Direct connection to DAC0_CH0
            DAC0 = 0x2,
            /// Port A - Select pin number using PINPOS
            PORTA = 0x8,
            /// Port B - Select pin number using PINPOS
            PORTB = 0x9,
            /// Port C - Select pin number using PINPOS
            PORTC = 0xa,
            /// Port D - Select pin number using PINPOS
            PORTD = 0xb,
            _,
        } = .GND,
        /// Configuration Group Select
        CFG: enum(u1) {
            /// Use configuration group 0
            CONFIG0 = 0x0,
            /// Use configuration group 1
            CONFIG1 = 0x1,
        } = .CONFIG0,
        /// Comparison Enable
        CMP: u1 = 0x0,
        padding: u14 = 0,
    }),
};
