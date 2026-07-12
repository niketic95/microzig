const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// BURAM_NS Registers
pub const BURAM_NS = extern struct {
    /// No Description
    /// offset: 0x00
    RET0_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x04
    RET1_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x08
    RET2_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x0c
    RET3_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x10
    RET4_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x14
    RET5_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x18
    RET6_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x1c
    RET7_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x20
    RET8_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x24
    RET9_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x28
    RET10_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x2c
    RET11_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x30
    RET12_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x34
    RET13_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x38
    RET14_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x3c
    RET15_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x40
    RET16_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x44
    RET17_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x48
    RET18_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x4c
    RET19_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x50
    RET20_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x54
    RET21_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x58
    RET22_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x5c
    RET23_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x60
    RET24_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x64
    RET25_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x68
    RET26_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x6c
    RET27_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x70
    RET28_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x74
    RET29_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x78
    RET30_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x7c
    RET31_REG: mmio.Mmio(packed struct(u32) {
        /// Latch based Retention register
        RETREG: u32 = 0x0,
    }),
};
