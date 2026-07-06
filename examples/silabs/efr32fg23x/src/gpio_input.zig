const microzig = @import("microzig");
const hal = microzig.hal;

pub const panic = microzig.panic;
pub const std_options = microzig.std_options(.{});
comptime {
    _ = microzig.export_startup();
}

pub const microzig_options: microzig.Options = .{};

pub fn main() void {
    microzig.interrupt.enable_interrupts();

    hal.hfxo.configure(null, .{ .MODE = .EXTCLK });
    hal.hfxo.start();

    while (true) {}
}
