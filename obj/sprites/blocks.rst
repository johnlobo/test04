                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module blocks
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _sp_blocks_2
                             12 	.globl _sp_blocks_1
                             13 	.globl _sp_blocks_0
                             14 	.globl _sp_palette
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 	.area _CODE
   43C0                      47 _sp_palette:
   43C0 54                   48 	.db #0x54	; 84	'T'
   43C1 4D                   49 	.db #0x4d	; 77	'M'
   43C2 40                   50 	.db #0x40	; 64
   43C3 5C                   51 	.db #0x5c	; 92
   43C4 4C                   52 	.db #0x4c	; 76	'L'
   43C5 4E                   53 	.db #0x4e	; 78	'N'
   43C6 4A                   54 	.db #0x4a	; 74	'J'
   43C7 52                   55 	.db #0x52	; 82	'R'
   43C8 56                   56 	.db #0x56	; 86	'V'
   43C9 5E                   57 	.db #0x5e	; 94
   43CA 53                   58 	.db #0x53	; 83	'S'
   43CB 5F                   59 	.db #0x5f	; 95
   43CC 55                   60 	.db #0x55	; 85	'U'
   43CD 58                   61 	.db #0x58	; 88	'X'
   43CE 44                   62 	.db #0x44	; 68	'D'
   43CF 4B                   63 	.db #0x4b	; 75	'K'
   43D0                      64 _sp_blocks_0:
   43D0 14                   65 	.db #0x14	; 20
   43D1 3C                   66 	.db #0x3c	; 60
   43D2 00                   67 	.db #0x00	; 0
   43D3 3C                   68 	.db #0x3c	; 60
   43D4 BE                   69 	.db #0xbe	; 190
   43D5 28                   70 	.db #0x28	; 40
   43D6 7D                   71 	.db #0x7d	; 125
   43D7 3C                   72 	.db #0x3c	; 60
   43D8 28                   73 	.db #0x28	; 40
   43D9 7D                   74 	.db #0x7d	; 125
   43DA 3C                   75 	.db #0x3c	; 60
   43DB 28                   76 	.db #0x28	; 40
   43DC 3C                   77 	.db #0x3c	; 60
   43DD 3C                   78 	.db #0x3c	; 60
   43DE 28                   79 	.db #0x28	; 40
   43DF 14                   80 	.db #0x14	; 20
   43E0 3C                   81 	.db #0x3c	; 60
   43E1 00                   82 	.db #0x00	; 0
   43E2 00                   83 	.db #0x00	; 0
   43E3 00                   84 	.db #0x00	; 0
   43E4 00                   85 	.db #0x00	; 0
   43E5                      86 _sp_blocks_1:
   43E5 10                   87 	.db #0x10	; 16
   43E6 30                   88 	.db #0x30	; 48	'0'
   43E7 00                   89 	.db #0x00	; 0
   43E8 30                   90 	.db #0x30	; 48	'0'
   43E9 38                   91 	.db #0x38	; 56	'8'
   43EA 20                   92 	.db #0x20	; 32
   43EB 34                   93 	.db #0x34	; 52	'4'
   43EC 30                   94 	.db #0x30	; 48	'0'
   43ED 20                   95 	.db #0x20	; 32
   43EE 34                   96 	.db #0x34	; 52	'4'
   43EF 30                   97 	.db #0x30	; 48	'0'
   43F0 20                   98 	.db #0x20	; 32
   43F1 30                   99 	.db #0x30	; 48	'0'
   43F2 30                  100 	.db #0x30	; 48	'0'
   43F3 20                  101 	.db #0x20	; 32
   43F4 10                  102 	.db #0x10	; 16
   43F5 30                  103 	.db #0x30	; 48	'0'
   43F6 00                  104 	.db #0x00	; 0
   43F7 00                  105 	.db #0x00	; 0
   43F8 00                  106 	.db #0x00	; 0
   43F9 00                  107 	.db #0x00	; 0
   43FA                     108 _sp_blocks_2:
   43FA 11                  109 	.db #0x11	; 17
   43FB 33                  110 	.db #0x33	; 51	'3'
   43FC 00                  111 	.db #0x00	; 0
   43FD 33                  112 	.db #0x33	; 51	'3'
   43FE 1B                  113 	.db #0x1b	; 27
   43FF 22                  114 	.db #0x22	; 34
   4400 27                  115 	.db #0x27	; 39
   4401 33                  116 	.db #0x33	; 51	'3'
   4402 22                  117 	.db #0x22	; 34
   4403 27                  118 	.db #0x27	; 39
   4404 33                  119 	.db #0x33	; 51	'3'
   4405 22                  120 	.db #0x22	; 34
   4406 33                  121 	.db #0x33	; 51	'3'
   4407 33                  122 	.db #0x33	; 51	'3'
   4408 22                  123 	.db #0x22	; 34
   4409 11                  124 	.db #0x11	; 17
   440A 33                  125 	.db #0x33	; 51	'3'
   440B 00                  126 	.db #0x00	; 0
   440C 00                  127 	.db #0x00	; 0
   440D 00                  128 	.db #0x00	; 0
   440E 00                  129 	.db #0x00	; 0
                            130 	.area _INITIALIZER
                            131 	.area _CABS (ABS)
