ENTRY(_start)

SECTIONS
{
  .vectors :
  {
    linker_vectors_begin = .;
    __Vectors = .;
    KEEP(*(.microzig_flash_start))
    linker_vectors_end = .;

    __Vectors_End = .;
    __Vectors_Size = __Vectors_End - __Vectors;
  } > FLASH :vectors

  .stack (NOLOAD):
  {
    . = ALIGN(8);
    __stack_limit = .;
    __StackLimit = .;
    KEEP(*(.stack*))
    . = ALIGN(4);
    __stack = .;
    __StackTop = .;
  } > RAM :ram_pre_code

  .bss :
  {
    . = ALIGN(4);
    __bss_start__ = .;
    microzig_bss_start = .;
    *(SORT_BY_ALIGNMENT(.bss*))
    *(COMMON)
    . = ALIGN(4);
    __bss_end__ = .;
    microzig_bss_end = .;
  } > RAM :ram_pre_code

  .noinit (NOLOAD) : ALIGN(4)
  {
    *(.noinit*);
  } > RAM :ram_pre_code

  text_application_ram : ALIGN(4)
  {
    . = ALIGN(4);
    __vma_ramfuncs_start__ = .;

    /* text_application_ram */
    *(text_application_ram)

    . = ALIGN(4);
    __vma_ramfuncs_end__ = .;
  } > RAM AT > FLASH :ram_code

  __lma_ramfuncs_start__ = LOADADDR(text_application_ram);
  __lma_ramfuncs_end__ = LOADADDR(text_application_ram) + SIZEOF(text_application_ram);

  .rodata :
  {
  } > FLASH :readonly

  .text :
  {
    linker_code_begin = .;
    *(SORT_BY_ALIGNMENT(.text*))
    *(SORT_BY_ALIGNMENT(text_*))
    . = ALIGN(32);
    linker_code_end = .;

    KEEP(*(.init))
    KEEP(*(.fini))

    /* .ctors */
    *crtbegin.o(.ctors)
    *crtbegin?.o(.ctors)
    *(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
    *(SORT(.ctors.*))
    *(.ctors)

    /* .dtors */
    *crtbegin.o(.dtors)
    *crtbegin?.o(.dtors)
    *(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
    *(SORT(.dtors.*))
    *(.dtors)

    *(.rodata*)
    *(.eh_frame*)
  } > FLASH :text

  .ARM.extab :
  {
    *(.ARM.extab* .gnu.linkonce.armextab.*)
  } > FLASH :text

  __exidx_start = .;
  .ARM.exidx :
  {
    *(.ARM.exidx* .gnu.linkonce.armexidx.*)
  } > FLASH :text
  __exidx_end = .;

  .copy.table :
  {
    . = ALIGN(4);
    __copy_table_start__ = .;

    LONG (__etext)
    LONG (__data_start__)
    LONG ((__data_end__ - __data_start__) / 4)

    /* Add each additional data section here */
    /*
    LONG (__etext2)
    LONG (__data2_start__)
    LONG ((__data2_end__ - __data2_start__) / 4)
    */

    __copy_table_end__ = .;
  } > FLASH :tables

  .zero.table :
  {
    . = ALIGN(4);
    __zero_table_start__ = .;
    /* Add each additional bss section here */
    /*
    LONG (__bss2_start__)
    LONG ((__bss2_end__ - __bss2_start__) / 4)
    */

    __zero_table_end__ = .;
  } > FLASH :tables

  .data :
  {
    *(vtable)
    *(SORT_BY_ALIGNMENT(.data*))
    . = ALIGN(4);

    . = ALIGN(4);
    /* preinit data */
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP(*(.preinit_array))
    PROVIDE_HIDDEN (__preinit_array_end = .);

    . = ALIGN(4);
    /* init data */
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP(*(SORT(.init_array.*)))
    KEEP(*(.init_array))
    PROVIDE_HIDDEN (__init_array_end = .);

    . = ALIGN(4);
    /* finit data */
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP(*(SORT(.fini_array.*)))
    KEEP(*(.fini_array))
    PROVIDE_HIDDEN (__fini_array_end = .);

    . = ALIGN(4);
    /* All data end */

  } > RAM AT > FLASH :ram_data

  /* Values to support copying initialised values at startup */
  __etext = LOADADDR(.data);
  __data_start__ = ADDR(.data);
  __data_end__ = ADDR(.data) + SIZEOF(.data);
  microzig_data_start = __data_start__;
  microzig_data_end = __data_end__;

  ASSERT((__etext % 4) == 0, "Data section needs to be word-aligned in LMA")
  ASSERT((__data_start__ % 4) == 0, "Data section needs to be word-aligned in VMA")
  ASSERT((__data_end__ % 4) == 0, "Data section needs to be word-multiple sized")
  /* Sets the difference between VMA and LMA to 0 for the next NOLOAD sections */
  .empty :
  {
  } > FLASH :empty

/* Calculate heap size based on RAM limits. */
heap_limit = ORIGIN(RAM) + LENGTH(RAM);  /* End of RAM */
heap_size = heap_limit - __HeapBase;
  .heap (NOLOAD):
  {
    . = ALIGN(8);
    __HeapBase = .;
    . += heap_size;
    __end__ = .;
    microzig_heap_start = .;
    _end = __end__;
    KEEP(*(.heap*))
    __HeapLimit = ORIGIN(RAM) + LENGTH(RAM);
    microzig_heap_end = .;
  } > RAM :ram_post_data

  __ram_end__ = 0x20000000 + 0x10000;
  __main_flash_end__ = 0x8000000 + 0x7e000;

  __ramfuncs_start__ = __vma_ramfuncs_start__;
  __ramfuncs_end__ = __vma_ramfuncs_end__;

  linker_nvm_end = __main_flash_end__;
  linker_nvm_begin = linker_nvm_end - SIZEOF(.nvm);
  linker_storage_end = linker_nvm_begin;
  __nvm3Base = linker_nvm_begin;

  linker_storage_begin = linker_storage_end - SIZEOF(.internal_storage);
  ASSERT((linker_storage_begin >= (__etext + SIZEOF(.data))), "FLASH memory overflowed !")


  HIDDEN(app_flash_end = 0x8000000 + 0x7e000);
  ASSERT( (linker_nvm_begin + SIZEOF(.nvm)) <= app_flash_end, "NVM3 is excessing the flash size !")

  microzig_data_load_start = LOADADDR(.data);

}
