;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module blocks
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sp_blocks_2
	.globl _sp_blocks_1
	.globl _sp_blocks_0
	.globl _sp_palette
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_sp_palette:
	.db #0x54	; 84	'T'
	.db #0x4d	; 77	'M'
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0x4c	; 76	'L'
	.db #0x4e	; 78	'N'
	.db #0x4a	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x56	; 86	'V'
	.db #0x5e	; 94
	.db #0x53	; 83	'S'
	.db #0x5f	; 95
	.db #0x55	; 85	'U'
	.db #0x58	; 88	'X'
	.db #0x44	; 68	'D'
	.db #0x4b	; 75	'K'
_sp_blocks_0:
	.db #0x14	; 20
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0xbe	; 190
	.db #0x28	; 40
	.db #0x7d	; 125
	.db #0x3c	; 60
	.db #0x28	; 40
	.db #0x7d	; 125
	.db #0x3c	; 60
	.db #0x28	; 40
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x28	; 40
	.db #0x14	; 20
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sp_blocks_1:
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x34	; 52	'4'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x34	; 52	'4'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sp_blocks_2:
	.db #0x11	; 17
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x1b	; 27
	.db #0x22	; 34
	.db #0x27	; 39
	.db #0x33	; 51	'3'
	.db #0x22	; 34
	.db #0x27	; 39
	.db #0x33	; 51	'3'
	.db #0x22	; 34
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x22	; 34
	.db #0x11	; 17
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
