const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// DMEM_S Registers
pub const DMEM_S = extern struct {
    /// No Description
    /// offset: 0x00
    IPVERSION: mmio.Mmio(packed struct(u32) {
        /// New BitField
        IPVERSION: u1 = 0x1,
        padding: u31 = 0,
    }),
    /// No Description
    /// offset: 0x04
    CMD: mmio.Mmio(packed struct(u32) {
        /// Clear ECCERRADDR0
        CLEARECCADDR0: u1 = 0x0,
        /// Clear ECCERRADDR1
        CLEARECCADDR1: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x08
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Enable ECC functionality
        ECCEN: u1 = 0x0,
        /// Enable ECC syndrome writes
        ECCWEN: u1 = 0x0,
        /// ECC Error bus fault enable
        ECCERRFAULTEN: u1 = 0x0,
        /// AHB port arbitration priority
        AHBPORTPRIORITY: enum(u3) {
            /// No AHB port have raised priority.
            NONE = 0x0,
            /// AHB port 0 has raised priority.
            PORT0 = 0x1,
            /// AHB port 1 has raised priority.
            PORT1 = 0x2,
            _,
        } = .NONE,
        /// Address fault bus fault enable
        ADDRFAULTEN: u1 = 0x1,
        padding: u25 = 0,
    }),
    /// No Description
    /// offset: 0x0c
    ECCERRADDR0: mmio.Mmio(packed struct(u32) {
        /// ECC Error Address
        ADDR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x10
    ECCERRADDR1: mmio.Mmio(packed struct(u32) {
        /// ECC Error Address
        ADDR: u32 = 0x0,
    }),
    /// offset: 0x14
    reserved20: [8]u8,
    /// No Description
    /// offset: 0x1c
    ECCMERRIND: mmio.Mmio(packed struct(u32) {
        /// Multiple ECC errors on AHB port 0
        P0: u1 = 0x0,
        /// Multiple ECC errors on AHB port 1
        P1: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// No Description
    /// offset: 0x20
    IF: mmio.Mmio(packed struct(u32) {
        /// AHB0 1-bit ECC Error Interrupt Flag
        AHB0ERR1B: u1 = 0x0,
        /// AHB1 1-bit ECC Error Interrupt Flag
        AHB1ERR1B: u1 = 0x0,
        reserved4: u2 = 0,
        /// AHB0 2-bit ECC Error Interrupt Flag
        AHB0ERR2B: u1 = 0x0,
        /// AHB1 2-bit ECC Error Interrupt Flag
        AHB1ERR2B: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// No Description
    /// offset: 0x24
    IEN: mmio.Mmio(packed struct(u32) {
        /// AHB0 1-bit ECC Error Interrupt Enable
        AHB0ERR1B: u1 = 0x0,
        /// AHB1 1-bit ECC Error Interrupt Enable
        AHB1ERR1B: u1 = 0x0,
        reserved4: u2 = 0,
        /// AHB0 2-bit ECC Error Interrupt Enable
        AHB0ERR2B: u1 = 0x0,
        /// AHB1 2-bit ECC Error Interrupt Enable
        AHB1ERR2B: u1 = 0x0,
        padding: u26 = 0,
    }),
};
