const std = @import("std");

const microzig = @import("microzig");

const chip = @import("EFR32FG23B021F512IM48.zig");

pub const hfxo = struct {
    const HFXO = chip.peripherals.HFXO0_NS;
    const unlock_val: u16 = 22542;

    fn unlock() void {
        HFXO.LOCK.write_raw(unlock_val);
    }
    fn lock() void {
        HFXO.LOCK.write_raw(~unlock_val);
    }

    pub fn configure(
        xtalCfg: ?@TypeOf(HFXO.XTALCFG).underlying_type,
        hfoCfg: @TypeOf(HFXO.CFG).underlying_type,
    ) void {
        unlock();
        if (xtalCfg) |cfg| {
            HFXO.XTALCFG.write(cfg);
        }
        HFXO.CFG.write(hfoCfg);
        lock();
    }
    pub fn start() void {
        unlock();
        HFXO.CTRL.modify(.{ .FORCEEN = 1 });
        lock();

        while (HFXO.STATUS.read().ENS == 0) {}
    }
};

pub const gpio = struct {};

pub const hfrco = struct {};

pub const dpll = struct {};

const lfxo = struct {};

const lfrco = struct {};

const fsrco = struct {};

const ulfrco = struct {};
