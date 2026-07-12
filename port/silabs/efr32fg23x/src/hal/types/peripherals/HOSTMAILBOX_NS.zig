const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// HOSTMAILBOX_NS Registers
pub const HOSTMAILBOX_NS = extern struct {
    /// No Description
    /// offset: 0x00
    MSGPTR0: mmio.Mmio(packed struct(u32) {
        /// Pointer
        PTR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x04
    MSGPTR1: mmio.Mmio(packed struct(u32) {
        /// Pointer
        PTR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x08
    MSGPTR2: mmio.Mmio(packed struct(u32) {
        /// Pointer
        PTR: u32 = 0x0,
    }),
    /// No Description
    /// offset: 0x0c
    MSGPTR3: mmio.Mmio(packed struct(u32) {
        /// Pointer
        PTR: u32 = 0x0,
    }),
    /// offset: 0x10
    reserved16: [48]u8,
    /// No Description
    /// offset: 0x40
    IF: mmio.Mmio(packed struct(u32) {
        /// Mailbox Interupt Flag
        MBOXIF0: u1 = 0x0,
        /// Mailbox Interupt Flag
        MBOXIF1: u1 = 0x0,
        /// Mailbox Interupt Flag
        MBOXIF2: u1 = 0x0,
        /// Mailbox Interupt Flag
        MBOXIF3: u1 = 0x0,
        padding: u28 = 0,
    }),
    /// No Description
    /// offset: 0x44
    IEN: mmio.Mmio(packed struct(u32) {
        /// Mailbox Interrupt Enable
        MBOXIEN0: u1 = 0x0,
        /// Mailbox Interrupt Enable
        MBOXIEN1: u1 = 0x0,
        /// Mailbox Interrupt Enable
        MBOXIEN2: u1 = 0x0,
        /// Mailbox Interrupt Enable
        MBOXIEN3: u1 = 0x0,
        padding: u28 = 0,
    }),
};
