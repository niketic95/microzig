const std = @import("std");
const microzig = @import("microzig/build-internals");

const Self = @This();

chips: struct {
    efr32fg23b010f512im48: *const microzig.Target,
    efr32fg23b021f512im48: *const microzig.Target,
},

boards: struct {
    dummy_kit: *const microzig.Target,
},

pub fn init(dep: *std.Build.Dependency) ?Self {
    const b = dep.builder;

    const chip_efr32fg23b010f512im48: microzig.Target = .{
        .dep = dep,
        .preferred_binary_format = .elf,
        .zig_target = .{
            .cpu_arch = .thumb,
            .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m33 },
            .os_tag = .freestanding,
            .abi = .eabi,
        },
        .chip = .{
            .name = "EFR32FG23B010F512IM48",
            .register_definition = .{ .svd = b.path("src/chips/EFR32FG23B010F512IM48.svd") },
            .memory_regions = &.{
                .{ .name = "FLASH", .tag = .flash, .offset = 0x8000000, .length = 512 * 1024, .access = .rx },
                .{ .name = "RAM", .tag = .ram, .offset = 0x20000000, .length = 64 * 1024, .access = .rwx },
            },
        },
        .hal = .{ .root_source_file = b.path("src/hal/hal.zig") },

        .linker_script = .{},
    };

    const chip_efr32fg23b021f512im48: microzig.Target = .{
        .dep = dep,
        .preferred_binary_format = .elf,
        .zig_target = .{
            .cpu_arch = .thumb,
            .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m33 },
            .os_tag = .freestanding,
            .abi = .eabi,
        },
        .chip = .{
            .name = "EFR32FG23B021F512IM48",
            .register_definition = .{ .svd = b.path("src/chips/EFR32FG23B021F512IM48.svd") },
            .memory_regions = &.{
                .{ .name = "FLASH", .tag = .flash, .offset = 0x8000000, .length = 512 * 1024, .access = .rx },
                .{ .name = "RAM", .tag = .ram, .offset = 0x20000000, .length = 64 * 1024, .access = .rwx },
            },
        },
        .hal = .{ .root_source_file = b.path("src/hal/hal.zig") },

        .linker_script = .{},
    };

    return .{
        .chips = .{
            .efr32fg23b010f512im48 = chip_efr32fg23b010f512im48.derive(.{}),
            .efr32fg23b021f512im48 = chip_efr32fg23b021f512im48.derive(.{}),
        },
        .boards = .{
            .dummy_kit = chip_efr32fg23b021f512im48.derive(.{
                .board = .{
                    .name = "Dummy board",
                    .root_source_file = b.path("src/boards/dummy.zig"),
                },
            }),
        },
    };
}

pub fn build(b: *std.Build) void {
    _ = b.step("test", "Run platform agnostic unit tests");
}
