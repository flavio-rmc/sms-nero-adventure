; SMS Nero Adventure - minimal Master System ROM foundation
; Assembles with SDCC's sdasz80 and links with sdldz80.

        .module main

        .area _HOME (ABS)
        .org 0x0000
        di
        im      1
        jp      start

        .org 0x0038
        reti

        .org 0x0066
        retn

        .org 0x0100
start:
        ld      sp,#0xdff0
        call    vdp_setup
        call    clear_vram
        call    set_palette
        ei

main_loop:
        halt
        jp      main_loop

; Configure a 256x192 Mode 4 background display.
vdp_setup:
        ld      a,#0x04
        out     (#0xbf),a
        ; Bit 6 enables the visible display.  Without it the VDP renders black.
        ld      a,#0x40
        out     (#0xbf),a
        ld      a,#0x80
        out     (#0xbf),a
        ld      a,#0x81
        out     (#0xbf),a
        ret

; Fill all 16 KiB of VRAM with zero.
clear_vram:
        xor     a
        out     (#0xbf),a
        ld      a,#0x40
        out     (#0xbf),a
        ld      bc,#0x4000
clear_vram_loop:
        xor     a
        out     (#0xbe),a
        dec     bc
        ld      a,b
        or      c
        jr      nz,clear_vram_loop
        ret

; Background colour 0: deep blue diagnostic screen.
set_palette:
        xor     a
        out     (#0xbf),a
        ld      a,#0xc0
        out     (#0xbf),a
        ld      a,#0x30
        out     (#0xbe),a
        ret

; Sega header for a 16 KiB domestic/export Master System ROM.
        .org    0x3ff0
        .ascii  "TMR SEGA"
        .db     0x00,0x00,0x00,0x00,0x00,0x4f
