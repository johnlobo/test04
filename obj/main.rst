ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;; Include all CPCtelera constant definitions, macros and variables
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             20 .include "cpctelera.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;; All CPCtelera include files
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             20 .include "macros/allmacros.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             19 .include "macros/cpct_maths.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Math Macros
                             21 ;;
                             22 ;;    Useful assembler macros for doing common math operations
                             23 ;;
                             24 
                             25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             26 ;; Macro: add_REGPAIR_a 
                             27 ;;
                             28 ;;    Performs the operation REGPAIR = REGPAIR + A. REGPAIR is any given pair of 8-bit registers.
                             29 ;;
                             30 ;; ASM Definition:
                             31 ;;    .macro <add_REGPAIR_a> RH, RL
                             32 ;;
                             33 ;; Parameters:
                             34 ;;    RH    - Register 1 of the REGPAIR. Holds higher-byte value
                             35 ;;    RL    - Register 2 of the REGPAIR. Holds lower-byte value
                             36 ;; 
                             37 ;; Input Registers: 
                             38 ;;    RH:RL - 16-value used as left-operand and final storage for the sum
                             39 ;;    A     - Second sum operand
                             40 ;;
                             41 ;; Return Value:
                             42 ;;    RH:RL - Holds the sum of RH:RL + A
                             43 ;;
                             44 ;; Details:
                             45 ;;    This macro performs the sum of RH:RL + A and stores it directly on RH:RL.
                             46 ;; It uses only RH:RL and A to perform the operation.
                             47 ;;
                             48 ;; Modified Registers: 
                             49 ;;    A, RH, RL
                             50 ;;
                             51 ;; Required memory:
                             52 ;;    5 bytes
                             53 ;;
                             54 ;; Time Measures:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             55 ;; (start code)
                             56 ;;  Case | microSecs(us) | CPU Cycles
                             57 ;; ------------------------------------
                             58 ;;  Any  |       5       |     20
                             59 ;; ------------------------------------
                             60 ;; (end code)
                             61 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             62 .macro add_REGPAIR_a rh, rl
                             63    ;; First Perform RH = E + A
                             64    add rl    ;; [1] A' = RL + A 
                             65    ld  rl, a ;; [1] RL' = A' = RL + A. It might generate Carry that must be added to RH
                             66    
                             67    ;; Then Perform RH = RH + Carry 
                             68    adc rh    ;; [1] A'' = A' + RH + Carry = RL + A + RH + Carry
                             69    sub rl    ;; [1] Remove RL'. A''' = A'' - RL' = RL + A + RH + Carry - (RL + A) = RH + Carry
                             70    ld  rh, a ;; [1] Save into RH (RH' = A''' = RH + Carry)
                             71 .endm
                             72 
                             73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             74 ;; Macro: add_de_a
                             75 ;;
                             76 ;;    Performs the operation DE = DE + A
                             77 ;;
                             78 ;; ASM Definition:
                             79 ;;    .macro <add_de_a>
                             80 ;;
                             81 ;; Parameters:
                             82 ;;    None
                             83 ;; 
                             84 ;; Input Registers: 
                             85 ;;    DE    - First sum operand and Destination Register
                             86 ;;    A     - Second sum operand
                             87 ;;
                             88 ;; Return Value:
                             89 ;;    DE - Holds the sum of DE + A
                             90 ;;
                             91 ;; Details:
                             92 ;;    This macro performs the sum of DE + A and stores it directly on DE.
                             93 ;; It uses only DE and A to perform the operation.
                             94 ;;    This macro is a direct instantiation of the macro <add_REGPAIR_a>.
                             95 ;;
                             96 ;; Modified Registers: 
                             97 ;;    A, DE
                             98 ;;
                             99 ;; Required memory:
                            100 ;;    5 bytes
                            101 ;;
                            102 ;; Time Measures:
                            103 ;; (start code)
                            104 ;;  Case | microSecs(us) | CPU Cycles
                            105 ;; ------------------------------------
                            106 ;;  Any  |       5       |     20
                            107 ;; ------------------------------------
                            108 ;; (end code)
                            109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                            110 .macro add_de_a
                            111    add_REGPAIR_a  d, e
                            112 .endm
                            113 
                            114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            115 ;; Macro: add_hl_a
                            116 ;;
                            117 ;;    Performs the operation HL = HL + A
                            118 ;;
                            119 ;; ASM Definition:
                            120 ;;    .macro <add_hl_a>
                            121 ;;
                            122 ;; Parameters:
                            123 ;;    None
                            124 ;; 
                            125 ;; Input Registers: 
                            126 ;;    HL    - First sum operand and Destination Register
                            127 ;;    A     - Second sum operand
                            128 ;;
                            129 ;; Return Value:
                            130 ;;    HL - Holds the sum of HL + A
                            131 ;;
                            132 ;; Details:
                            133 ;;    This macro performs the sum of HL + A and stores it directly on HL.
                            134 ;; It uses only HL and A to perform the operation.
                            135 ;;    This macro is a direct instantiation of the macro <add_REGPAIR_a>.
                            136 ;;
                            137 ;; Modified Registers: 
                            138 ;;    A, HL
                            139 ;;
                            140 ;; Required memory:
                            141 ;;    5 bytes
                            142 ;;
                            143 ;; Time Measures:
                            144 ;; (start code)
                            145 ;;  Case | microSecs(us) | CPU Cycles
                            146 ;; ------------------------------------
                            147 ;;  Any  |       5       |     20
                            148 ;; ------------------------------------
                            149 ;; (end code)
                            150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            151 .macro add_hl_a
                            152    add_REGPAIR_a  h, l
                            153 .endm
                            154 
                            155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            156 ;; Macro: add_bc_a
                            157 ;;
                            158 ;;    Performs the operation BC = BC + A
                            159 ;;
                            160 ;; ASM Definition:
                            161 ;;    .macro <add_bc_a>
                            162 ;;
                            163 ;; Parameters:
                            164 ;;    None
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                            165 ;; 
                            166 ;; Input Registers: 
                            167 ;;    BC    - First sum operand and Destination Register
                            168 ;;    A     - Second sum operand
                            169 ;;
                            170 ;; Return Value:
                            171 ;;    BC - Holds the sum of BC + A
                            172 ;;
                            173 ;; Details:
                            174 ;;    This macro performs the sum of BC + A and stores it directly on BC.
                            175 ;; It uses only BC and A to perform the operation.
                            176 ;;    This macro is a direct instantiation of the macro <add_REGPAIR_a>.
                            177 ;;
                            178 ;; Modified Registers: 
                            179 ;;    A, BC
                            180 ;;
                            181 ;; Required memory:
                            182 ;;    5 bytes
                            183 ;;
                            184 ;; Time Measures:
                            185 ;; (start code)
                            186 ;;  Case | microSecs(us) | CPU Cycles
                            187 ;; ------------------------------------
                            188 ;;  Any  |       5       |     20
                            189 ;; ------------------------------------
                            190 ;; (end code)
                            191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            192 .macro add_bc_a
                            193    add_REGPAIR_a  b, c
                            194 .endm
                            195 
                            196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            197 ;; Macro: sub_REGPAIR_a 
                            198 ;;
                            199 ;;    Performs the operation REGPAIR = REGPAIR - A. REGPAIR is any given pair of 8-bit registers.
                            200 ;;
                            201 ;; ASM Definition:
                            202 ;;    .macro <sub_REGPAIR_a> RH, RL
                            203 ;;
                            204 ;; Parameters:
                            205 ;;    RH    - Register 1 of the REGPAIR. Holds higher-byte value
                            206 ;;    RL    - Register 2 of the REGPAIR. Holds lower-byte value
                            207 ;;  ?JMPLBL - Optional Jump label. A temporal one will be produced if none is given.
                            208 ;; 
                            209 ;; Input Registers: 
                            210 ;;    RH:RL - 16-value used as left-operand and final storage for the subtraction
                            211 ;;    A     - Second subtraction operand
                            212 ;;
                            213 ;; Return Value:
                            214 ;;    RH:RL - Holds the result of RH:RL - A
                            215 ;;
                            216 ;; Details:
                            217 ;;    This macro performs the subtraction of RH:RL - A and stores it directly on RH:RL.
                            218 ;; It uses only RH:RL and A to perform the operation.
                            219 ;;    With respect to the optional label ?JMPLBL, it is often better not to provide 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            220 ;; this parameter. A temporal local symbol will be automatically generated for that label.
                            221 ;; Only provide it when you have a specific reason to do that.
                            222 ;;
                            223 ;; Modified Registers: 
                            224 ;;    A, RH, RL
                            225 ;;
                            226 ;; Required memory:
                            227 ;;    7 bytes
                            228 ;;
                            229 ;; Time Measures:
                            230 ;; (start code)
                            231 ;;  Case | microSecs(us) | CPU Cycles
                            232 ;; ------------------------------------
                            233 ;;  Any  |       7       |     28
                            234 ;; ------------------------------------
                            235 ;; (end code)
                            236 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            237 .macro sub_REGPAIR_a rh, rl, ?jmplbl
                            238    ;; First Perform A' = A - 1 - RL 
                            239    ;; (Inverse subtraction minus 1, used  to test for Carry, needed to know when to subtract 1 from RH)
                            240    dec    a          ;; [1] --A (In case A == RL, inverse subtraction should produce carry not to decrement RH)
                            241    sub   rl          ;; [1] A' = A - 1 - RL
                            242    jr     c, jmplbl  ;; [2/3] If A <= RL, Carry will be produced, and no decrement of RH is required, so jump over it
                            243      dec   rh        ;; [1] --RH (A > RL, so RH must be decremented)
                            244 jmplbl:   
                            245    ;; Now invert A to get the subtraction we wanted 
                            246    ;; { RL' = -A' - 1 = -(A - 1 - RL) - 1 = RL - A }
                            247    cpl            ;; [1] A'' = RL - A (Original subtraction we wanted, calculated trough one's complement of A')
                            248    ld    rl, a    ;; [1] Save into RL (RL' = RL - A)
                            249 .endm
                            250 
                            251 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            252 ;; Macro: sub_de_a 
                            253 ;;
                            254 ;;    Performs the operation DE = DE - A. DE is any given pair of 8-bit registers.
                            255 ;;
                            256 ;; ASM Definition:
                            257 ;;    .macro <sub_de_a>
                            258 ;; 
                            259 ;; Input Registers: 
                            260 ;;    DE - 16-value used as left-operand and final storage for the subtraction
                            261 ;;    A  - Second subtraction operand
                            262 ;;
                            263 ;; Return Value:
                            264 ;;    DE - Holds the result of DE - A
                            265 ;;
                            266 ;; Details:
                            267 ;;    This macro performs the subtraction of DE - A and stores it directly on DE.
                            268 ;; It uses only DE and A to perform the operation.
                            269 ;;
                            270 ;; Modified Registers: 
                            271 ;;    A, DE
                            272 ;;
                            273 ;; Required memory:
                            274 ;;    7 bytes
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                            275 ;;
                            276 ;; Time Measures:
                            277 ;; (start code)
                            278 ;;  Case | microSecs(us) | CPU Cycles
                            279 ;; ------------------------------------
                            280 ;;  Any  |       7       |     28
                            281 ;; ------------------------------------
                            282 ;; (end code)
                            283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            284 .macro sub_de_a
                            285    sub_REGPAIR_a  d, e
                            286 .endm
                            287 
                            288 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            289 ;; Macro: sub_hl_a 
                            290 ;;
                            291 ;;    Performs the operation HL = HL - A. HL is any given pair of 8-bit registers.
                            292 ;;
                            293 ;; ASM Definition:
                            294 ;;    .macro <sub_hl_a>
                            295 ;; 
                            296 ;; Input Registers: 
                            297 ;;    HL - 16-value used as left-operand and final storage for the subtraction
                            298 ;;    A  - Second subtraction operand
                            299 ;;
                            300 ;; Return Value:
                            301 ;;    HL - Holds the result of HL - A
                            302 ;;
                            303 ;; Details:
                            304 ;;    This macro performs the subtraction of HL - A and stores it directly on HL.
                            305 ;; It uses only HL and A to perform the operation.
                            306 ;;
                            307 ;; Modified Registers: 
                            308 ;;    A, HL
                            309 ;;
                            310 ;; Required memory:
                            311 ;;    7 bytes
                            312 ;;
                            313 ;; Time Measures:
                            314 ;; (start code)
                            315 ;;  Case | microSecs(us) | CPU Cycles
                            316 ;; ------------------------------------
                            317 ;;  Any  |       7       |     28
                            318 ;; ------------------------------------
                            319 ;; (end code)
                            320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            321 .macro sub_hl_a
                            322    sub_REGPAIR_a  h, l
                            323 .endm
                            324 
                            325 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            326 ;; Macro: sub_bc_a 
                            327 ;;
                            328 ;;    Performs the operation BC = BC - A. BC is any given pair of 8-bit registers.
                            329 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            330 ;; ASM Definition:
                            331 ;;    .macro <sub_bc_a>
                            332 ;; 
                            333 ;; Input Registers: 
                            334 ;;    BC - 16-value used as left-operand and final storage for the subtraction
                            335 ;;    A  - Second subtraction operand
                            336 ;;
                            337 ;; Return Value:
                            338 ;;    BC - Holds the result of BC - A
                            339 ;;
                            340 ;; Details:
                            341 ;;    This macro performs the subtraction of BC - A and stores it directly on BC.
                            342 ;; It uses only BC and A to perform the operation.
                            343 ;;
                            344 ;; Modified Registers: 
                            345 ;;    A, BC
                            346 ;;
                            347 ;; Required memory:
                            348 ;;    7 bytes
                            349 ;;
                            350 ;; Time Measures:
                            351 ;; (start code)
                            352 ;;  Case | microSecs(us) | CPU Cycles
                            353 ;; ------------------------------------
                            354 ;;  Any  |       7       |     28
                            355 ;; ------------------------------------
                            356 ;; (end code)
                            357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            358 .macro sub_bc_a
                            359    sub_REGPAIR_a  b, c
                            360 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                             20 .include "macros/cpct_opcodeConstants.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Opcodes
                             21 ;;
                             22 ;;    Constant definitions of Z80 opcodes. This will be normally used as data
                             23 ;; for self-modifying code.
                             24 ;;
                             25 
                             26 ;; Constant: opc_JR
                             27 ;;    Opcode for "JR xx" instruction. Requires 1-byte parameter (xx)
                     0018    28 opc_JR   = 0x18
                             29 
                             30 ;; Constant: opc_LD_D
                             31 ;;    Opcode for "LD d, xx" instruction. Requires 1-byte parameter (xx)
                     0016    32 opc_LD_D = 0x16
                             33 
                             34 ;; Constant: opc_EI
                             35 ;;    Opcode for "EI" instruction. 
                     00FB    36 opc_EI = 0xFB
                             37 
                             38 ;; Constant: opc_DI
                             39 ;;    Opcode for "DI" instruction. 
                     00F3    40 opc_DI = 0xF3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                             21 .include "macros/cpct_reverseBits.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Reverse Bits
                             21 ;;
                             22 ;;    Useful macros for bit reversing and selecting in different ways. Only
                             23 ;; valid to be used from assembly language (not from C).
                             24 ;;
                             25 
                             26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             27 ;; Macro: cpctm_reverse_and_select_bits_of_A
                             28 ;;
                             29 ;;    Reorders the bits of A and mixes them letting the user select the 
                             30 ;; new order for the bits by using a selection mask.
                             31 ;;
                             32 ;; Parameters:
                             33 ;;    TReg          - An 8-bits register that will be used for intermediate calculations.
                             34 ;; This register may be one of these: B, C, D, E, H, L
                             35 ;;    SelectionMask - An 8-bits mask that will be used to select the bits to get from 
                             36 ;; the reordered bits. It might be an 8-bit register or even (hl).
                             37 ;; 
                             38 ;; Input Registers: 
                             39 ;;    A     - Byte to be reversed
                             40 ;;    TReg  - Should have a copy of A (same exact value)
                             41 ;;
                             42 ;; Return Value:
                             43 ;;    A - Resulting value with bits reversed and selected 
                             44 ;;
                             45 ;; Details:
                             46 ;;    This macro reorders the bits in A and mixes them with the same bits in
                             47 ;; their original order by using a *SelectionMask*. The process is as follows:
                             48 ;;
                             49 ;;    1. Consider the 8 bits of A = TReg = [01234567]
                             50 ;;    2. Reorder the 8 bits of A, producing A2 = [32547610]
                             51 ;;    2. Reorder the bits of TReg, producing TReg2 = [76103254]
                             52 ;;    3. Combines both reorders into final result using a *SelectionMask*. Each 
                             53 ;; 0 bit from the selection mask means "select bit from A2", whereas each 1 bit
                             54 ;; means "select bit from TReg2".
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



                             55 ;;
                             56 ;;    For instance, a selection mask 0b11001100 will produce this result:
                             57 ;;
                             58 ;; (start code)
                             59 ;;       A2 = [ 32 54 76 10 ]
                             60 ;;    TReg2 = [ 76 10 32 54 ]
                             61 ;;  SelMask = [ 11 00 11 00 ] // 1 = TReg2-bits, 0 = A2-bits
                             62 ;;  ---------------------------
                             63 ;;   Result = [ 76 54 32 10 ]
                             64 ;; (end code)
                             65 ;;
                             66 ;;    Therefore, mask 0b11001100 produces the effect of reversing the bits of A
                             67 ;; completely. Other masks will produce different reorders of the bits in A, for
                             68 ;; different requirements or needs.
                             69 ;;
                             70 ;; Modified Registers: 
                             71 ;;    AF, TReg
                             72 ;;
                             73 ;; Required memory:
                             74 ;;    16 bytes
                             75 ;;
                             76 ;; Time Measures:
                             77 ;; (start code)
                             78 ;;  Case | microSecs(us) | CPU Cycles
                             79 ;; ------------------------------------
                             80 ;;  Any  |      16       |     64
                             81 ;; ------------------------------------
                             82 ;; (end code)
                             83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             84 .macro cpctm_reverse_and_select_bits_of_A  TReg, SelectionMask
                             85    rlca            ;; [1] | Rotate left twice so that...
                             86    rlca            ;; [1] | ... A=[23456701]
                             87 
                             88    ;; Mix bits of TReg and A so that all bits are in correct relative order
                             89    ;; but displaced from their final desired location
                             90    xor TReg        ;; [1] TReg = [01234567] (original value)
                             91    and #0b01010101 ;; [2]    A = [23456701] (bits rotated twice left)
                             92    xor TReg        ;; [1]   A2 = [03254761] (TReg mixed with A to get bits in order)
                             93    
                             94    ;; Now get bits 54 and 10 in their right location and save them into TReg
                             95    rlca            ;; [1]    A = [ 32 54 76 10 ] (54 and 10 are in their desired place)
                             96    ld TReg, a      ;; [1] TReg = A (Save this bit location into TReg)
                             97    
                             98    ;; Now get bits 76 and 32 in their right location in A
                             99    rrca            ;; [1] | Rotate A right 4 times to...
                            100    rrca            ;; [1] | ... get bits 76 and 32 located at their ...
                            101    rrca            ;; [1] | ... desired location :
                            102    rrca            ;; [1] | ... A = [ 76 10 32 54 ] (76 and 32 are in their desired place)
                            103    
                            104    ;; Finally, mix bits from TReg and A to get all bits reversed and selected
                            105    xor TReg          ;; [1] TReg = [32547610] (Mixed bits with 54 & 10 in their right place)
                            106    and SelectionMask ;; [2]    A = [76103254] (Mixed bits with 76 & 32 in their right place)
                            107    xor TReg          ;; [1]   A2 = [xxxxxxxx] final value: bits of A reversed and selected using *SelectionMask*
                            108 .endm
                            109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



                            110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            111 ;; Macro: cpctm_reverse_bits_of_A 
                            112 ;; Macro: cpctm_reverse_mode_2_pixels_of_A
                            113 ;;
                            114 ;;    Reverses the 8-bits of A, from [01234567] to [76543210]. This also reverses
                            115 ;; all pixels contained in A when A is in screen pixel format, mode 2.
                            116 ;;
                            117 ;; Parameters:
                            118 ;;    TReg - An 8-bits register that will be used for intermediate calculations.
                            119 ;; This register may be one of these: B, C, D, E, H, L
                            120 ;; 
                            121 ;; Input Registers: 
                            122 ;;    A    - Byte to be reversed
                            123 ;;    TReg - Should have a copy of A (same exact value)
                            124 ;;
                            125 ;; Return Value:
                            126 ;;    A - Resulting value with bits reversed 
                            127 ;;
                            128 ;; Requires:
                            129 ;;   - Uses the macro <cpctm_reverse_and_select_bits_of_A>.
                            130 ;;
                            131 ;; Details:
                            132 ;;    This macro reverses the bits in A. If bits of A = [01234567], the final
                            133 ;; result after processing this macro will be A = [76543210]. Register TReg is
                            134 ;; used for intermediate calculations and its value is destroyed.
                            135 ;;
                            136 ;; Modified Registers: 
                            137 ;;    AF, TReg
                            138 ;;
                            139 ;; Required memory:
                            140 ;;    16 bytes
                            141 ;;
                            142 ;; Time Measures:
                            143 ;; (start code)
                            144 ;;  Case | microSecs(us) | CPU Cycles
                            145 ;; ------------------------------------
                            146 ;;  Any  |      16       |     64
                            147 ;; ------------------------------------
                            148 ;; (end code)
                            149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            150 .macro cpctm_reverse_bits_of_A  TReg
                            151    cpctm_reverse_and_select_bits_of_A  TReg, #0b11001100
                            152 .endm
                            153 .macro cpctm_reverse_mode_2_pixels_of_A   TReg
                            154    cpctm_reverse_bits_of_A  TReg
                            155 .endm
                            156 
                            157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            158 ;; Macro: cpctm_reverse_mode_1_pixels_of_A
                            159 ;;
                            160 ;;    Reverses the order of pixel values contained in register A, assuming A is 
                            161 ;; in screen pixel format, mode 1.
                            162 ;;
                            163 ;; Parameters:
                            164 ;;    TReg - An 8-bits register that will be used for intermediate calculations.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



                            165 ;; This register may be one of these: B, C, D, E, H, L
                            166 ;; 
                            167 ;; Input Registers: 
                            168 ;;    A    - Byte with pixel values to be reversed
                            169 ;;    TReg - Should have a copy of A (same exact value)
                            170 ;;
                            171 ;; Return Value:
                            172 ;;    A - Resulting byte with the 4 pixels values reversed in order
                            173 ;;
                            174 ;; Requires:
                            175 ;;   - Uses the macro <cpctm_reverse_and_select_bits_of_A>.
                            176 ;;
                            177 ;; Details:
                            178 ;;    This macro considers that A contains a byte that codifies 4 pixels in 
                            179 ;; screen pixel format, mode 1. It modifies A to reverse the order of its 4 
                            180 ;; contained pixel values left-to-right (1234 -> 4321). With respect to the 
                            181 ;; order of the 8-bits of A, the concrete operations performed is:
                            182 ;; (start code)
                            183 ;;    A = [01234567] == reverse-pixels ==> [32107654] = A2
                            184 ;; (end code)
                            185 ;;    You may want to check <cpct_px2byteM1> to know how bits codify both pixels
                            186 ;; in one single byte for screen pixel format, mode 1.
                            187 ;;
                            188 ;;    *TReg* is an 8-bit register that will be used for intermediate calculations,
                            189 ;; destroying its original value (that should be same as A, at the start).
                            190 ;;
                            191 ;; Modified Registers: 
                            192 ;;    AF, TReg
                            193 ;;
                            194 ;; Required memory:
                            195 ;;    16 bytes
                            196 ;;
                            197 ;; Time Measures:
                            198 ;; (start code)
                            199 ;;  Case | microSecs(us) | CPU Cycles
                            200 ;; ------------------------------------
                            201 ;;  Any  |      16       |     64
                            202 ;; ------------------------------------
                            203 ;; (end code)
                            204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            205 .macro cpctm_reverse_mode_1_pixels_of_A  TReg
                            206    cpctm_reverse_and_select_bits_of_A  TReg, #0b00110011
                            207 .endm
                            208 
                            209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            210 ;; Macro: cpctm_reverse_mode_0_pixels_of_A
                            211 ;;
                            212 ;;    Reverses the order of pixel values contained in register A, assuming A is 
                            213 ;; in screen pixel format, mode 0.
                            214 ;;
                            215 ;; Parameters:
                            216 ;;    TReg - An 8-bits register that will be used for intermediate calculations.
                            217 ;; This register may be one of these: B, C, D, E, H, L
                            218 ;; 
                            219 ;; Input Registers: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



                            220 ;;    A    - Byte with pixel values to be reversed
                            221 ;;    TReg - Should have a copy of A (same exact value)
                            222 ;;
                            223 ;; Return Value:
                            224 ;;    A - Resulting byte with the 2 pixels values reversed in order
                            225 ;;
                            226 ;; Details:
                            227 ;;    This macro considers that A contains a byte that codifies 2 pixels in 
                            228 ;; screen pixel format, mode 0. It modifies A to reverse the order of its 2 
                            229 ;; contained pixel values left-to-right (12 -> 21). With respect to the 
                            230 ;; order of the 8-bits of A, the concrete operation performed is:
                            231 ;; (start code)
                            232 ;;    A = [01234567] == reverse-pixels ==> [10325476] = A2
                            233 ;; (end code)
                            234 ;;    You may want to check <cpct_px2byteM0> to know how bits codify both pixels
                            235 ;; in one single byte for screen pixel format, mode 0.
                            236 ;;
                            237 ;;    *TReg* is an 8-bit register that will be used for intermediate calculations,
                            238 ;; destroying its original value (that should be same as A, at the start).
                            239 ;;
                            240 ;; Modified Registers: 
                            241 ;;    AF, TReg
                            242 ;;
                            243 ;; Required memory:
                            244 ;;    7 bytes
                            245 ;;
                            246 ;; Time Measures:
                            247 ;; (start code)
                            248 ;;  Case | microSecs(us) | CPU Cycles
                            249 ;; ------------------------------------
                            250 ;;  Any  |       7       |     28
                            251 ;; ------------------------------------
                            252 ;; (end code)
                            253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            254 .macro cpctm_reverse_mode_0_pixels_of_A  TReg
                            255    rlca            ;; [1] | Rotate A twice to the left to get bits ordered...
                            256    rlca            ;; [1] | ... in the way we need for mixing, A = [23456701]
                            257   
                            258    ;; Mix TReg with A to get pixels reversed by reordering bits
                            259    xor TReg        ;; [1] | TReg = [01234567]
                            260    and #0b01010101 ;; [2] |    A = [23456701]
                            261    xor TReg        ;; [1] |   A2 = [03254761]
                            262    rrca            ;; [1] Rotate right to get pixels reversed A = [10325476]
                            263 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



                             22 .include "macros/cpct_undocumentedOpcodes.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Undocumented Opcodes
                             21 ;;
                             22 ;;    Macros to clarify source code when using undocumented opcodes. Only
                             23 ;; valid to be used from assembly language (not from C).
                             24 ;;
                             25 
                             26 ;; Macro: jr__0
                             27 ;;    Opcode for "JR #0" instruction
                             28 ;; 
                             29 .macro jr__0
                             30    .DW #0x0018  ;; JR #00 (Normally used as a modifiable jump, as jr 0 is an infinite loop)
                             31 .endm
                             32 
                             33 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             35 ;; SLL Instructions
                             36 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             37 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             38 
                             39 ;; Macro: sll__b
                             40 ;;    Opcode for "SLL b" instruction
                             41 ;; 
                             42 .macro sll__b
                             43    .db #0xCB, #0x30  ;; Opcode for sll b
                             44 .endm
                             45 
                             46 ;; Macro: sll__c
                             47 ;;    Opcode for "SLL c" instruction
                             48 ;; 
                             49 .macro sll__c
                             50    .db #0xCB, #0x31  ;; Opcode for sll c
                             51 .endm
                             52 
                             53 ;; Macro: sll__d
                             54 ;;    Opcode for "SLL d" instruction
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



                             55 ;; 
                             56 .macro sll__d
                             57    .db #0xCB, #0x32  ;; Opcode for sll d
                             58 .endm
                             59 
                             60 ;; Macro: sll__e
                             61 ;;    Opcode for "SLL e" instruction
                             62 ;; 
                             63 .macro sll__e
                             64    .db #0xCB, #0x33  ;; Opcode for sll e
                             65 .endm
                             66 
                             67 ;; Macro: sll__h
                             68 ;;    Opcode for "SLL h" instruction
                             69 ;; 
                             70 .macro sll__h
                             71    .db #0xCB, #0x34  ;; Opcode for sll h
                             72 .endm
                             73 
                             74 ;; Macro: sll__l
                             75 ;;    Opcode for "SLL l" instruction
                             76 ;; 
                             77 .macro sll__l
                             78    .db #0xCB, #0x35  ;; Opcode for sll l
                             79 .endm
                             80 
                             81 ;; Macro: sll___hl_
                             82 ;;    Opcode for "SLL (hl)" instruction
                             83 ;; 
                             84 .macro sll___hl_
                             85    .db #0xCB, #0x36  ;; Opcode for sll (hl)
                             86 .endm
                             87 
                             88 ;; Macro: sll__a
                             89 ;;    Opcode for "SLL a" instruction
                             90 ;; 
                             91 .macro sll__a
                             92    .db #0xCB, #0x37  ;; Opcode for sll a
                             93 .endm
                             94 
                             95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             96 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             97 ;; IXL Related Macros
                             98 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             99 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            100 
                            101 ;; Macro: ld__ixl    Value
                            102 ;;    Opcode for "LD ixl, Value" instruction
                            103 ;;  
                            104 ;; Parameters:
                            105 ;;    Value - An inmediate 8-bits value that will be loaded into ixl
                            106 ;; 
                            107 .macro ld__ixl    Value 
                            108    .db #0xDD, #0x2E, Value  ;; Opcode for ld ixl, Value
                            109 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



                            110 
                            111 ;; Macro: ld__ixl_a
                            112 ;;    Opcode for "LD ixl, a" instruction
                            113 ;; 
                            114 .macro ld__ixl_a
                            115    .dw #0x6FDD  ;; Opcode for ld ixl, a
                            116 .endm
                            117 
                            118 ;; Macro: ld__ixl_b
                            119 ;;    Opcode for "LD ixl, B" instruction
                            120 ;; 
                            121 .macro ld__ixl_b
                            122    .dw #0x68DD  ;; Opcode for ld ixl, b
                            123 .endm
                            124 
                            125 ;; Macro: ld__ixl_c
                            126 ;;    Opcode for "LD ixl, C" instruction
                            127 ;; 
                            128 .macro ld__ixl_c
                            129    .dw #0x69DD  ;; Opcode for ld ixl, c
                            130 .endm
                            131 
                            132 ;; Macro: ld__ixl_d
                            133 ;;    Opcode for "LD ixl, D" instruction
                            134 ;; 
                            135 .macro ld__ixl_d
                            136    .dw #0x6ADD  ;; Opcode for ld ixl, d
                            137 .endm
                            138 
                            139 ;; Macro: ld__ixl_e
                            140 ;;    Opcode for "LD ixl, E" instruction
                            141 ;; 
                            142 .macro ld__ixl_e
                            143    .dw #0x6BDD  ;; Opcode for ld ixl, e
                            144 .endm
                            145 
                            146 ;; Macro: ld__ixl_ixh
                            147 ;;    Opcode for "LD ixl, IXH" instruction
                            148 ;; 
                            149 .macro ld__ixl_ixh
                            150    .dw #0x6CDD  ;; Opcode for ld ixl, ixh
                            151 .endm
                            152 
                            153 ;; Macro: ld__a_ixl
                            154 ;;    Opcode for "LD A, ixl" instruction
                            155 ;; 
                            156 .macro ld__a_ixl
                            157    .dw #0x7DDD  ;; Opcode for ld a, ixl
                            158 .endm
                            159 
                            160 ;; Macro: ld__b_ixl
                            161 ;;    Opcode for "LD B, ixl" instruction
                            162 ;; 
                            163 .macro ld__b_ixl
                            164    .dw #0x45DD  ;; Opcode for ld b, ixl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



                            165 .endm
                            166 
                            167 ;; Macro: ld__c_ixl
                            168 ;;    Opcode for "LD c, ixl" instruction
                            169 ;; 
                            170 .macro ld__c_ixl
                            171    .dw #0x4DDD  ;; Opcode for ld c, ixl
                            172 .endm
                            173 
                            174 ;; Macro: ld__d_ixl
                            175 ;;    Opcode for "LD D, ixl" instruction
                            176 ;; 
                            177 .macro ld__d_ixl
                            178    .dw #0x55DD  ;; Opcode for ld d, ixl
                            179 .endm
                            180 
                            181 ;; Macro: ld__e_ixl
                            182 ;;    Opcode for "LD e, ixl" instruction
                            183 ;; 
                            184 .macro ld__e_ixl
                            185    .dw #0x5DDD  ;; Opcode for ld e, ixl
                            186 .endm
                            187 
                            188 ;; Macro: add__ixl
                            189 ;;    Opcode for "Add ixl" instruction
                            190 ;; 
                            191 .macro add__ixl
                            192    .dw #0x85DD  ;; Opcode for add ixl
                            193 .endm
                            194 
                            195 ;; Macro: sub__ixl
                            196 ;;    Opcode for "SUB ixl" instruction
                            197 ;; 
                            198 .macro sub__ixl
                            199    .dw #0x95DD  ;; Opcode for sub ixl
                            200 .endm
                            201 
                            202 ;; Macro: adc__ixl
                            203 ;;    Opcode for "ADC ixl" instruction
                            204 ;; 
                            205 .macro adc__ixl
                            206    .dw #0x8DDD  ;; Opcode for adc ixl
                            207 .endm
                            208 
                            209 ;; Macro: sbc__ixl
                            210 ;;    Opcode for "SBC ixl" instruction
                            211 ;; 
                            212 .macro sbc__ixl
                            213    .dw #0x9DDD  ;; Opcode for sbc ixl
                            214 .endm
                            215 
                            216 ;; Macro: and__ixl
                            217 ;;    Opcode for "AND ixl" instruction
                            218 ;; 
                            219 .macro and__ixl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



                            220    .dw #0xA5DD  ;; Opcode for and ixl
                            221 .endm
                            222 
                            223 ;; Macro: or__ixl
                            224 ;;    Opcode for "OR ixl" instruction
                            225 ;; 
                            226 .macro or__ixl
                            227    .dw #0xB5DD  ;; Opcode for or ixl
                            228 .endm
                            229 
                            230 ;; Macro: xor__ixl
                            231 ;;    Opcode for "XOR ixl" instruction
                            232 ;; 
                            233 .macro xor__ixl
                            234    .dw #0xADDD  ;; Opcode for xor ixl
                            235 .endm
                            236 
                            237 ;; Macro: cp__ixl
                            238 ;;    Opcode for "CP ixl" instruction
                            239 ;; 
                            240 .macro cp__ixl
                            241    .dw #0xBDDD  ;; Opcode for cp ixl
                            242 .endm
                            243 
                            244 ;; Macro: dec__ixl
                            245 ;;    Opcode for "DEC ixl" instruction
                            246 ;; 
                            247 .macro dec__ixl
                            248    .dw #0x2DDD  ;; Opcode for dec ixl
                            249 .endm
                            250 
                            251 ;; Macro: inc__ixl
                            252 ;;    Opcode for "INC ixl" instruction
                            253 ;; 
                            254 .macro inc__ixl
                            255    .dw #0x2CDD  ;; Opcode for inc ixl
                            256 .endm
                            257 
                            258 
                            259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            261 ;; IXH Related Macros
                            262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            264 
                            265 ;; Macro: ld__ixh    Value
                            266 ;;    Opcode for "LD IXH, Value" instruction
                            267 ;;  
                            268 ;; Parameters:
                            269 ;;    Value - An inmediate 8-bits value that will be loaded into IXH
                            270 ;; 
                            271 .macro ld__ixh    Value 
                            272    .db #0xDD, #0x26, Value  ;; Opcode for ld ixh, Value
                            273 .endm
                            274 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 22.
Hexadecimal [16-Bits]



                            275 ;; Macro: ld__ixh_a
                            276 ;;    Opcode for "LD IXH, a" instruction
                            277 ;; 
                            278 .macro ld__ixh_a
                            279    .dw #0x67DD  ;; Opcode for ld ixh, a
                            280 .endm
                            281 
                            282 ;; Macro: ld__ixh_b
                            283 ;;    Opcode for "LD IXH, B" instruction
                            284 ;; 
                            285 .macro ld__ixh_b
                            286    .dw #0x60DD  ;; Opcode for ld ixh, b
                            287 .endm
                            288 
                            289 ;; Macro: ld__ixh_c
                            290 ;;    Opcode for "LD IXH, C" instruction
                            291 ;; 
                            292 .macro ld__ixh_c
                            293    .dw #0x61DD  ;; Opcode for ld ixh, c
                            294 .endm
                            295 
                            296 ;; Macro: ld__ixh_d
                            297 ;;    Opcode for "LD IXH, D" instruction
                            298 ;; 
                            299 .macro ld__ixh_d
                            300    .dw #0x62DD  ;; Opcode for ld ixh, d
                            301 .endm
                            302 
                            303 ;; Macro: ld__ixh_e
                            304 ;;    Opcode for "LD IXH, E" instruction
                            305 ;; 
                            306 .macro ld__ixh_e
                            307    .dw #0x63DD  ;; Opcode for ld ixh, e
                            308 .endm
                            309 
                            310 ;; Macro: ld__ixh_ixl
                            311 ;;    Opcode for "LD IXH, IXL" instruction
                            312 ;; 
                            313 .macro ld__ixh_ixl
                            314    .dw #0x65DD  ;; Opcode for ld ixh, ixl
                            315 .endm
                            316 
                            317 ;; Macro: ld__a_ixh
                            318 ;;    Opcode for "LD A, IXH" instruction
                            319 ;; 
                            320 .macro ld__a_ixh
                            321    .dw #0x7CDD  ;; Opcode for ld a, ixh
                            322 .endm
                            323 
                            324 ;; Macro: ld__b_ixh
                            325 ;;    Opcode for "LD B, IXH" instruction
                            326 ;; 
                            327 .macro ld__b_ixh
                            328    .dw #0x44DD  ;; Opcode for ld b, ixh
                            329 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 23.
Hexadecimal [16-Bits]



                            330 
                            331 ;; Macro: ld__c_ixh
                            332 ;;    Opcode for "LD c, IXH" instruction
                            333 ;; 
                            334 .macro ld__c_ixh
                            335    .dw #0x4CDD  ;; Opcode for ld c, ixh
                            336 .endm
                            337 
                            338 ;; Macro: ld__d_ixh
                            339 ;;    Opcode for "LD D, IXH" instruction
                            340 ;; 
                            341 .macro ld__d_ixh
                            342    .dw #0x54DD  ;; Opcode for ld d, ixh
                            343 .endm
                            344 
                            345 ;; Macro: ld__e_ixh
                            346 ;;    Opcode for "LD e, IXH" instruction
                            347 ;; 
                            348 .macro ld__e_ixh
                            349    .dw #0x5CDD  ;; Opcode for ld e, ixh
                            350 .endm
                            351 
                            352 ;; Macro: add__ixh
                            353 ;;    Opcode for "ADD IXH" instruction
                            354 ;; 
                            355 .macro add__ixh
                            356    .dw #0x84DD  ;; Opcode for add ixh
                            357 .endm
                            358 
                            359 ;; Macro: sub__ixh
                            360 ;;    Opcode for "SUB IXH" instruction
                            361 ;; 
                            362 .macro sub__ixh
                            363    .dw #0x94DD  ;; Opcode for sub ixh
                            364 .endm
                            365 
                            366 ;; Macro: adc__ixh
                            367 ;;    Opcode for "ADC IXH" instruction
                            368 ;; 
                            369 .macro adc__ixh
                            370    .dw #0x8CDD  ;; Opcode for adc ixh
                            371 .endm
                            372 
                            373 ;; Macro: sbc__ixh
                            374 ;;    Opcode for "SBC IXH" instruction
                            375 ;; 
                            376 .macro sbc__ixh
                            377    .dw #0x9CDD  ;; Opcode for sbc ixh
                            378 .endm
                            379 
                            380 ;; Macro: and__ixh
                            381 ;;    Opcode for "AND IXH" instruction
                            382 ;; 
                            383 .macro and__ixh
                            384    .dw #0xA4DD  ;; Opcode for and ixh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 24.
Hexadecimal [16-Bits]



                            385 .endm
                            386 
                            387 ;; Macro: or__ixh
                            388 ;;    Opcode for "OR IXH" instruction
                            389 ;; 
                            390 .macro or__ixh
                            391    .dw #0xB4DD  ;; Opcode for or ixh
                            392 .endm
                            393 
                            394 ;; Macro: xor__ixh
                            395 ;;    Opcode for "XOR IXH" instruction
                            396 ;; 
                            397 .macro xor__ixh
                            398    .dw #0xACDD  ;; Opcode for xor ixh
                            399 .endm
                            400 
                            401 ;; Macro: cp__ixh
                            402 ;;    Opcode for "CP IXH" instruction
                            403 ;; 
                            404 .macro cp__ixh
                            405    .dw #0xBCDD  ;; Opcode for cp ixh
                            406 .endm
                            407 
                            408 ;; Macro: dec__ixh
                            409 ;;    Opcode for "DEC IXH" instruction
                            410 ;; 
                            411 .macro dec__ixh
                            412    .dw #0x25DD  ;; Opcode for dec ixh
                            413 .endm
                            414 
                            415 ;; Macro: inc__ixh
                            416 ;;    Opcode for "INC IXH" instruction
                            417 ;; 
                            418 .macro inc__ixh
                            419    .dw #0x24DD  ;; Opcode for inc ixh
                            420 .endm
                            421 
                            422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            424 ;; IYL Related Macros
                            425 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            427 
                            428 ;; Macro: ld__iyl    Value
                            429 ;;    Opcode for "LD iyl, Value" instruction
                            430 ;;  
                            431 ;; Parameters:
                            432 ;;    Value - An inmediate 8-bits value that will be loaded into iyl
                            433 ;; 
                            434 .macro ld__iyl    Value 
                            435    .db #0xFD, #0x2E, Value  ;; Opcode for ld iyl, Value
                            436 .endm
                            437 
                            438 ;; Macro: ld__iyl_a
                            439 ;;    Opcode for "LD iyl, a" instruction
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 25.
Hexadecimal [16-Bits]



                            440 ;; 
                            441 .macro ld__iyl_a
                            442    .dw #0x6FFD  ;; Opcode for ld iyl, a
                            443 .endm
                            444 
                            445 ;; Macro: ld__iyl_b
                            446 ;;    Opcode for "LD iyl, B" instruction
                            447 ;; 
                            448 .macro ld__iyl_b
                            449    .dw #0x68FD  ;; Opcode for ld iyl, b
                            450 .endm
                            451 
                            452 ;; Macro: ld__iyl_c
                            453 ;;    Opcode for "LD iyl, C" instruction
                            454 ;; 
                            455 .macro ld__iyl_c
                            456    .dw #0x69FD  ;; Opcode for ld iyl, c
                            457 .endm
                            458 
                            459 ;; Macro: ld__iyl_d
                            460 ;;    Opcode for "LD iyl, D" instruction
                            461 ;; 
                            462 .macro ld__iyl_d
                            463    .dw #0x6AFD  ;; Opcode for ld iyl, d
                            464 .endm
                            465 
                            466 ;; Macro: ld__iyl_e
                            467 ;;    Opcode for "LD iyl, E" instruction
                            468 ;; 
                            469 .macro ld__iyl_e
                            470    .dw #0x6BFD  ;; Opcode for ld iyl, e
                            471 .endm
                            472 
                            473 ;; Macro: ld__iyl_iyh
                            474 ;;    Opcode for "LD iyl, IXL" instruction
                            475 ;; 
                            476 .macro ld__iyl_iyh
                            477    .dw #0x6CFD  ;; Opcode for ld iyl, ixl
                            478 .endm
                            479 
                            480 ;; Macro: ld__a_iyl
                            481 ;;    Opcode for "LD A, iyl" instruction
                            482 ;; 
                            483 .macro ld__a_iyl
                            484    .dw #0x7DFD  ;; Opcode for ld a, iyl
                            485 .endm
                            486 
                            487 ;; Macro: ld__b_iyl
                            488 ;;    Opcode for "LD B, iyl" instruction
                            489 ;; 
                            490 .macro ld__b_iyl
                            491    .dw #0x45FD  ;; Opcode for ld b, iyl
                            492 .endm
                            493 
                            494 ;; Macro: ld__c_iyl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 26.
Hexadecimal [16-Bits]



                            495 ;;    Opcode for "LD c, iyl" instruction
                            496 ;; 
                            497 .macro ld__c_iyl
                            498    .dw #0x4DFD  ;; Opcode for ld c, iyl
                            499 .endm
                            500 
                            501 ;; Macro: ld__d_iyl
                            502 ;;    Opcode for "LD D, iyl" instruction
                            503 ;; 
                            504 .macro ld__d_iyl
                            505    .dw #0x55FD  ;; Opcode for ld d, iyl
                            506 .endm
                            507 
                            508 ;; Macro: ld__e_iyl
                            509 ;;    Opcode for "LD e, iyl" instruction
                            510 ;; 
                            511 .macro ld__e_iyl
                            512    .dw #0x5DFD  ;; Opcode for ld e, iyl
                            513 .endm
                            514 
                            515 ;; Macro: add__iyl
                            516 ;;    Opcode for "Add iyl" instruction
                            517 ;; 
                            518 .macro add__iyl
                            519    .dw #0x85FD  ;; Opcode for add iyl
                            520 .endm
                            521 
                            522 ;; Macro: sub__iyl
                            523 ;;    Opcode for "SUB iyl" instruction
                            524 ;; 
                            525 .macro sub__iyl
                            526    .dw #0x95FD  ;; Opcode for sub iyl
                            527 .endm
                            528 
                            529 ;; Macro: adc__iyl
                            530 ;;    Opcode for "ADC iyl" instruction
                            531 ;; 
                            532 .macro adc__iyl
                            533    .dw #0x8DFD  ;; Opcode for adc iyl
                            534 .endm
                            535 
                            536 ;; Macro: sbc__iyl
                            537 ;;    Opcode for "SBC iyl" instruction
                            538 ;; 
                            539 .macro sbc__iyl
                            540    .dw #0x9DFD  ;; Opcode for sbc iyl
                            541 .endm
                            542 
                            543 ;; Macro: and__iyl
                            544 ;;    Opcode for "AND iyl" instruction
                            545 ;; 
                            546 .macro and__iyl
                            547    .dw #0xA5FD  ;; Opcode for and iyl
                            548 .endm
                            549 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 27.
Hexadecimal [16-Bits]



                            550 ;; Macro: or__iyl
                            551 ;;    Opcode for "OR iyl" instruction
                            552 ;; 
                            553 .macro or__iyl
                            554    .dw #0xB5FD  ;; Opcode for or iyl
                            555 .endm
                            556 
                            557 ;; Macro: xor__iyl
                            558 ;;    Opcode for "XOR iyl" instruction
                            559 ;; 
                            560 .macro xor__iyl
                            561    .dw #0xADFD  ;; Opcode for xor iyl
                            562 .endm
                            563 
                            564 ;; Macro: cp__iyl
                            565 ;;    Opcode for "CP iyl" instruction
                            566 ;; 
                            567 .macro cp__iyl
                            568    .dw #0xBDFD  ;; Opcode for cp iyl
                            569 .endm
                            570 
                            571 ;; Macro: dec__iyl
                            572 ;;    Opcode for "DEC iyl" instruction
                            573 ;; 
                            574 .macro dec__iyl
                            575    .dw #0x2DFD  ;; Opcode for dec iyl
                            576 .endm
                            577 
                            578 ;; Macro: inc__iyl
                            579 ;;    Opcode for "INC iyl" instruction
                            580 ;; 
                            581 .macro inc__iyl
                            582    .dw #0x2CFD  ;; Opcode for inc iyl
                            583 .endm
                            584 
                            585 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            587 ;; IYH Related Macros
                            588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            589 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            590 
                            591 ;; Macro: ld__iyh    Value
                            592 ;;    Opcode for "LD iyh, Value" instruction
                            593 ;;  
                            594 ;; Parameters:
                            595 ;;    Value - An inmediate 8-bits value that will be loaded into iyh
                            596 ;; 
                            597 .macro ld__iyh    Value 
                            598    .db #0xFD, #0x26, Value  ;; Opcode for ld iyh, Value
                            599 .endm
                            600 
                            601 ;; Macro: ld__iyh_a
                            602 ;;    Opcode for "LD iyh, a" instruction
                            603 ;; 
                            604 .macro ld__iyh_a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 28.
Hexadecimal [16-Bits]



                            605    .dw #0x67FD  ;; Opcode for ld iyh, a
                            606 .endm
                            607 
                            608 ;; Macro: ld__iyh_b
                            609 ;;    Opcode for "LD iyh, B" instruction
                            610 ;; 
                            611 .macro ld__iyh_b
                            612    .dw #0x60FD  ;; Opcode for ld iyh, b
                            613 .endm
                            614 
                            615 ;; Macro: ld__iyh_c
                            616 ;;    Opcode for "LD iyh, C" instruction
                            617 ;; 
                            618 .macro ld__iyh_c
                            619    .dw #0x61FD  ;; Opcode for ld iyh, c
                            620 .endm
                            621 
                            622 ;; Macro: ld__iyh_d
                            623 ;;    Opcode for "LD iyh, D" instruction
                            624 ;; 
                            625 .macro ld__iyh_d
                            626    .dw #0x62FD  ;; Opcode for ld iyh, d
                            627 .endm
                            628 
                            629 ;; Macro: ld__iyh_e
                            630 ;;    Opcode for "LD iyh, E" instruction
                            631 ;; 
                            632 .macro ld__iyh_e
                            633    .dw #0x63FD  ;; Opcode for ld iyh, e
                            634 .endm
                            635 
                            636 ;; Macro: ld__iyh_iyl
                            637 ;;    Opcode for "LD iyh, IyL" instruction
                            638 ;; 
                            639 .macro ld__iyh_iyl
                            640    .dw #0x65FD  ;; Opcode for ld iyh, iyl
                            641 .endm
                            642 
                            643 ;; Macro: ld__a_iyh
                            644 ;;    Opcode for "LD A, iyh" instruction
                            645 ;; 
                            646 .macro ld__a_iyh
                            647    .dw #0x7CFD  ;; Opcode for ld a, iyh
                            648 .endm
                            649 
                            650 ;; Macro: ld__b_iyh
                            651 ;;    Opcode for "LD B, iyh" instruction
                            652 ;; 
                            653 .macro ld__b_iyh
                            654    .dw #0x44FD  ;; Opcode for ld b, iyh
                            655 .endm
                            656 
                            657 ;; Macro: ld__c_iyh
                            658 ;;    Opcode for "LD c, iyh" instruction
                            659 ;; 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 29.
Hexadecimal [16-Bits]



                            660 .macro ld__c_iyh
                            661    .dw #0x4CFD  ;; Opcode for ld c, iyh
                            662 .endm
                            663 
                            664 ;; Macro: ld__d_iyh
                            665 ;;    Opcode for "LD D, iyh" instruction
                            666 ;; 
                            667 .macro ld__d_iyh
                            668    .dw #0x54FD  ;; Opcode for ld d, iyh
                            669 .endm
                            670 
                            671 ;; Macro: ld__e_iyh
                            672 ;;    Opcode for "LD e, iyh" instruction
                            673 ;; 
                            674 .macro ld__e_iyh
                            675    .dw #0x5CFD  ;; Opcode for ld e, iyh
                            676 .endm
                            677 
                            678 ;; Macro: add__iyh
                            679 ;;    Opcode for "Add iyh" instruction
                            680 ;; 
                            681 .macro add__iyh
                            682    .dw #0x84FD  ;; Opcode for add iyh
                            683 .endm
                            684 
                            685 ;; Macro: sub__iyh
                            686 ;;    Opcode for "SUB iyh" instruction
                            687 ;; 
                            688 .macro sub__iyh
                            689    .dw #0x94FD  ;; Opcode for sub iyh
                            690 .endm
                            691 
                            692 ;; Macro: adc__iyh
                            693 ;;    Opcode for "ADC iyh" instruction
                            694 ;; 
                            695 .macro adc__iyh
                            696    .dw #0x8CFD  ;; Opcode for adc iyh
                            697 .endm
                            698 
                            699 ;; Macro: sbc__iyh
                            700 ;;    Opcode for "SBC iyh" instruction
                            701 ;; 
                            702 .macro sbc__iyh
                            703    .dw #0x9CFD  ;; Opcode for sbc iyh
                            704 .endm
                            705 
                            706 ;; Macro: and__iyh
                            707 ;;    Opcode for "AND iyh" instruction
                            708 ;; 
                            709 .macro and__iyh
                            710    .dw #0xA4FD  ;; Opcode for and iyh
                            711 .endm
                            712 
                            713 ;; Macro: or__iyh
                            714 ;;    Opcode for "OR iyh" instruction
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 30.
Hexadecimal [16-Bits]



                            715 ;; 
                            716 .macro or__iyh
                            717    .dw #0xB4FD  ;; Opcode for or iyh
                            718 .endm
                            719 
                            720 ;; Macro: xor__iyh
                            721 ;;    Opcode for "XOR iyh" instruction
                            722 ;; 
                            723 .macro xor__iyh
                            724    .dw #0xACFD  ;; Opcode for xor iyh
                            725 .endm
                            726 
                            727 ;; Macro: cp__iyh
                            728 ;;    Opcode for "CP iyh" instruction
                            729 ;; 
                            730 .macro cp__iyh
                            731    .dw #0xBCFD  ;; Opcode for cp iyh
                            732 .endm
                            733 
                            734 ;; Macro: dec__iyh
                            735 ;;    Opcode for "DEC iyh" instruction
                            736 ;; 
                            737 .macro dec__iyh
                            738    .dw #0x25FD  ;; Opcode for dec iyh
                            739 .endm
                            740 
                            741 ;; Macro: inc__iyh
                            742 ;;    Opcode for "INC iyh" instruction
                            743 ;; 
                            744 .macro inc__iyh
                            745    .dw #0x24FD  ;; Opcode for inc iyh
                            746 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 31.
Hexadecimal [16-Bits]



                             23 
                             24 ;;//////////////////////////////////////////////////////////////////////
                             25 ;; Group: General Useful Macros
                             26 ;;//////////////////////////////////////////////////////////////////////
                             27 
                             28 ;;
                             29 ;; Macro: cpctm_produceHalts_asm
                             30 ;;
                             31 ;;   Produce a set of consecutive halt instructions in order to wait for 
                             32 ;; a given number of interrupts.
                             33 ;;
                             34 ;; C Definition:
                             35 ;;   .macro <cpctm_produceHalts_asm> *N*
                             36 ;;
                             37 ;; Input Parameters:
                             38 ;;   (_) N - Number of consecutive halts to be produced
                             39 ;;
                             40 ;; Known issues:
                             41 ;;    * *N* must be a constant expression that can evaluate to a number
                             42 ;; at compile time.
                             43 ;;    * If the code generated by this macro is executed with interrupts
                             44 ;; being disabled, your CPU will effectively hang forever.
                             45 ;;    * This macro can only be used from assembler code. For C callings
                             46 ;; use <cpctm_produceHalts> instead.
                             47 ;;
                             48 ;; Size of generated code:
                             49 ;;    * *N* bytes (1 byte each halt instruction produced)
                             50 ;;
                             51 ;; Time Measures:
                             52 ;;    * Time depends on the exact moment of execution and the status of
                             53 ;; interrupts. *N* interrupts will pass.
                             54 ;;
                             55 ;; Details:
                             56 ;;    This macro produces a set of *N* consecutive *halt* assembly 
                             57 ;; instructions. Each *halt* instruction stops de Z80 CPU until 
                             58 ;; an interrupt is received. Therefore, this waits for *N* interrupts
                             59 ;; to be produced. This can be used for waiting or synchronization 
                             60 ;; purposes.
                             61 ;;
                             62 ;;    Please, take into account that this is a macro, and not a function.
                             63 ;; Each time this macro is used in your code it will produce the requested
                             64 ;; amount of halts. That can produce more code than you effectively need.
                             65 ;; For a unique function that controls a loop of *halt* waiting use
                             66 ;; <cpct_waitHalts> instead.
                             67 ;;
                             68 ;;
                             69 .macro cpctm_produceHalts N
                             70    .rept N
                             71       halt
                             72    .endm
                             73 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 32.
Hexadecimal [16-Bits]



                             21 .include "keyboard/keyboard.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 .module cpct_keyboard
                             19 
                             20 ;;
                             21 ;; Constant: Key Definitions (asm)
                             22 ;;
                             23 ;;    Definitions of the KeyCodes required by <cpct_isKeyPressed> 
                             24 ;; function for assembler programs. These are 16-bit values that define 
                             25 ;; matrix line in the keyboard layout (Most Significant Byte) and bit to
                             26 ;; be tested in that matrix line status for the given key (Least Significant
                             27 ;; byte). Each matrix line in the keyboard returns a byte containing the
                             28 ;; status of 8 keys, 1 bit each.
                             29 ;;
                             30 ;; CPCtelera include file:
                             31 ;;    _keyboard/keyboard.h.s_
                             32 ;;
                             33 ;; Keycode constant names:
                             34 ;; (start code)
                             35 ;;  KeyCode | Constant        || KeyCode | Constant      || KeyCode |  Constant
                             36 ;; -------------------------------------------------------------------------------
                             37 ;;   0x0100 | Key_CursorUp    ||  0x0803 | Key_P         ||  0x4006 |  Key_B
                             38 ;;          |                 ||         |               ||     ''  |  Joy1_Fire3
                             39 ;;   0x0200 | Key_CursorRight ||  0x1003 | Key_SemiColon ||  0x8006 |  Key_V
                             40 ;;   0x0400 | Key_CursorDown  ||  0x2003 | Key_Colon     ||  0x0107 |  Key_4
                             41 ;;   0x0800 | Key_F9          ||  0x4003 | Key_Slash     ||  0x0207 |  Key_3
                             42 ;;   0x1000 | Key_F6          ||  0x8003 | Key_Dot       ||  0x0407 |  Key_E
                             43 ;;   0x2000 | Key_F3          ||  0x0104 | Key_0         ||  0x0807 |  Key_W
                             44 ;;   0x4000 | Key_Enter       ||  0x0204 | Key_9         ||  0x1007 |  Key_S
                             45 ;;   0x8000 | Key_FDot        ||  0x0404 | Key_O         ||  0x2007 |  Key_D
                             46 ;;   0x0101 | Key_CursorLeft  ||  0x0804 | Key_I         ||  0x4007 |  Key_C
                             47 ;;   0x0201 | Key_Copy        ||  0x1004 | Key_L         ||  0x8007 |  Key_X
                             48 ;;   0x0401 | Key_F7          ||  0x2004 | Key_K         ||  0x0108 |  Key_1
                             49 ;;   0x0801 | Key_F8          ||  0x4004 | Key_M         ||  0x0208 |  Key_2
                             50 ;;   0x1001 | Key_F5          ||  0x8004 | Key_Comma     ||  0x0408 |  Key_Esc
                             51 ;;   0x2001 | Key_F1          ||  0x0105 | Key_8         ||  0x0808 |  Key_Q
                             52 ;;   0x4001 | Key_F2          ||  0x0205 | Key_7         ||  0x1008 |  Key_Tab
                             53 ;;   0x8001 | Key_F0          ||  0x0405 | Key_U         ||  0x2008 |  Key_A
                             54 ;;   0x0102 | Key_Clr         ||  0x0805 | Key_Y         ||  0x4008 |  Key_CapsLock
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 33.
Hexadecimal [16-Bits]



                             55 ;;   0x0202 | Key_OpenBracket ||  0x1005 | Key_H         ||  0x8008 |  Key_Z
                             56 ;;   0x0402 | Key_Return      ||  0x2005 | Key_J         ||  0x0109 |  Joy0_Up
                             57 ;;   0x0802 | Key_CloseBracket||  0x4005 | Key_N         ||  0x0209 |  Joy0_Down
                             58 ;;   0x1002 | Key_F4          ||  0x8005 | Key_Space     ||  0x0409 |  Joy0_Left
                             59 ;;   0x2002 | Key_Shift       ||  0x0106 | Key_6         ||  0x0809 |  Joy0_Right
                             60 ;;          |                 ||     ''  | Joy1_Up       ||         |
                             61 ;;   0x4002 | Key_BackSlash   ||  0x0206 | Key_5         ||  0x1009 |  Joy0_Fire1
                             62 ;;          |                 ||     ''  | Joy1_Down     ||         |
                             63 ;;   0x8002 | Key_Control     ||  0x0406 | Key_R         ||  0x2009 |  Joy0_Fire2
                             64 ;;          |                 ||     ''  | Joy1_Left     ||         |
                             65 ;;   0x0103 | Key_Caret       ||  0x0806 | Key_T         ||  0x4009 |  Joy0_Fire3
                             66 ;;          |                 ||     ''  | Joy1 Right    ||
                             67 ;;   0x0203 | Key_Hyphen      ||  0x1006 | Key_G         ||  0x8009 |  Key_Del
                             68 ;;          |                 ||     ''  | Joy1_Fire1    ||
                             69 ;;   0x0403 | Key_At          ||  0x2006 | Key_F         ||
                             70 ;;          |                 ||     ''  | Joy1_Fire2    ||
                             71 ;; -------------------------------------------------------------------------------
                             72 ;;  Table 1. KeyCodes defined for each possible key, ordered by KeyCode
                             73 ;; (end)
                             74 ;;
                             75 
                             76 ;; Matrix Line 0x00
                     0100    77 Key_CursorUp     = #0x0100  ;; Bit 0 (01h) => | 0000 0001 |
                     0200    78 Key_CursorRight  = #0x0200  ;; Bit 1 (02h) => | 0000 0010 |
                     0400    79 Key_CursorDown   = #0x0400  ;; Bit 2 (04h) => | 0000 0100 |
                     0800    80 Key_F9           = #0x0800  ;; Bit 3 (08h) => | 0000 1000 |
                     1000    81 Key_F6           = #0x1000  ;; Bit 4 (10h) => | 0001 0000 |
                     2000    82 Key_F3           = #0x2000  ;; Bit 5 (20h) => | 0010 0000 |
                     4000    83 Key_Enter        = #0x4000  ;; Bit 6 (40h) => | 0100 0000 |
                     8000    84 Key_FDot         = #0x8000  ;; Bit 7 (80h) => | 1000 0000 |
                             85 ;; Matrix Line 0x01
                     0101    86 Key_CursorLeft   = #0x0101
                     0201    87 Key_Copy         = #0x0201
                     0401    88 Key_F7           = #0x0401
                     0801    89 Key_F8           = #0x0801
                     1001    90 Key_F5           = #0x1001
                     2001    91 Key_F1           = #0x2001
                     4001    92 Key_F2           = #0x4001
                     8001    93 Key_F0           = #0x8001
                             94 ;; Matrix Line 0x02
                     0102    95 Key_Clr          = #0x0102
                     0202    96 Key_OpenBracket  = #0x0202
                     0402    97 Key_Return       = #0x0402
                     0802    98 Key_CloseBracket = #0x0802
                     1002    99 Key_F4           = #0x1002
                     2002   100 Key_Shift        = #0x2002
                     4002   101 Key_BackSlash    = #0x4002
                     8002   102 Key_Control      = #0x8002
                            103 ;; Matrix Line 0x03
                     0103   104 Key_Caret        = #0x0103
                     0203   105 Key_Hyphen       = #0x0203
                     0403   106 Key_At           = #0x0403
                     0803   107 Key_P            = #0x0803
                     1003   108 Key_SemiColon    = #0x1003
                     2003   109 Key_Colon        = #0x2003
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 34.
Hexadecimal [16-Bits]



                     4003   110 Key_Slash        = #0x4003
                     8003   111 Key_Dot          = #0x8003
                            112 ;; Matrix Line 0x04
                     0104   113 Key_0            = #0x0104
                     0204   114 Key_9            = #0x0204
                     0404   115 Key_O            = #0x0404
                     0804   116 Key_I            = #0x0804
                     1004   117 Key_L            = #0x1004
                     2004   118 Key_K            = #0x2004
                     4004   119 Key_M            = #0x4004
                     8004   120 Key_Comma        = #0x8004
                            121 ;; Matrix Line 0x05
                     0105   122 Key_8            = #0x0105
                     0205   123 Key_7            = #0x0205
                     0405   124 Key_U            = #0x0405
                     0805   125 Key_Y            = #0x0805
                     1005   126 Key_H            = #0x1005
                     2005   127 Key_J            = #0x2005
                     4005   128 Key_N            = #0x4005
                     8005   129 Key_Space        = #0x8005
                            130 ;; Matrix Line 0x06
                     0106   131 Key_6            = #0x0106
                     0106   132 Joy1_Up          = #0x0106
                     0206   133 Key_5            = #0x0206
                     0206   134 Joy1_Down        = #0x0206
                     0406   135 Key_R            = #0x0406
                     0406   136 Joy1_Left        = #0x0406
                     0806   137 Key_T            = #0x0806
                     0806   138 Joy1_Right       = #0x0806
                     1006   139 Key_G            = #0x1006
                     1006   140 Joy1_Fire1       = #0x1006
                     2006   141 Key_F            = #0x2006
                     2006   142 Joy1_Fire2       = #0x2006
                     4006   143 Key_B            = #0x4006
                     4006   144 Joy1_Fire3       = #0x4006
                     8006   145 Key_V            = #0x8006
                            146 ;; Matrix Line 0x07
                     0107   147 Key_4            = #0x0107
                     0207   148 Key_3            = #0x0207
                     0407   149 Key_E            = #0x0407
                     0807   150 Key_W            = #0x0807
                     1007   151 Key_S            = #0x1007
                     2007   152 Key_D            = #0x2007
                     4007   153 Key_C            = #0x4007
                     8007   154 Key_X            = #0x8007
                            155 ;; Matrix Line 0x08
                     0108   156 Key_1            = #0x0108
                     0208   157 Key_2            = #0x0208
                     0408   158 Key_Esc          = #0x0408
                     0808   159 Key_Q            = #0x0808
                     1008   160 Key_Tab          = #0x1008
                     2008   161 Key_A            = #0x2008
                     4008   162 Key_CapsLock     = #0x4008
                     8008   163 Key_Z            = #0x8008
                            164 ;; Matrix Line 0x09
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 35.
Hexadecimal [16-Bits]



                     0109   165 Joy0_Up          = #0x0109
                     0209   166 Joy0_Down        = #0x0209
                     0409   167 Joy0_Left        = #0x0409
                     0809   168 Joy0_Right       = #0x0809
                     1009   169 Joy0_Fire1       = #0x1009
                     2009   170 Joy0_Fire2       = #0x2009
                     4009   171 Joy0_Fire3       = #0x4009
                     8009   172 Key_Del          = #0x8009
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 36.
Hexadecimal [16-Bits]



                             22 .include "video/videomode.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 .module cpct_video
                             19    
                             20 ;;
                             21 ;; Includes
                             22 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 37.
Hexadecimal [16-Bits]



                             23 .include "video/video_macros.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;//////////////////////////////////////////////////////////////////////
                             20 ;;//////////////////////////////////////////////////////////////////////
                             21 ;; File: Macros (asm)
                             22 ;;//////////////////////////////////////////////////////////////////////
                             23 ;;//////////////////////////////////////////////////////////////////////
                             24 
                             25 ;;//////////////////////////////////////////////////////////////////////
                             26 ;; Group: Video memory manipulation
                             27 ;;//////////////////////////////////////////////////////////////////////
                             28 
                             29 ;;
                             30 ;; Constant: CPCT_VMEM_START_ASM
                             31 ;;
                             32 ;;    The address where screen video memory starts by default in the Amstrad CPC.
                             33 ;;
                             34 ;;    This address is exactly 0xC000, and this macro represents this number but
                             35 ;; automatically converted to <u8>* (Pointer to unsigned byte). You can use this
                             36 ;; macro for any function requiring the start of video memory, like 
                             37 ;; <cpct_getScreenPtr>.
                             38 ;;
                     C000    39 CPCT_VMEM_START_ASM = 0xC000
                             40 
                             41 ;;
                             42 ;; Constants: Video Memory Pages
                             43 ;;
                             44 ;; Useful constants defining some typical Video Memory Pages to be used as 
                             45 ;; parameters for <cpct_setVideoMemoryPage>
                             46 ;;
                             47 ;; cpct_pageCO - Video Memory Page 0xC0 (0xC0··)
                             48 ;; cpct_page8O - Video Memory Page 0x80 (0x80··)
                             49 ;; cpct_page4O - Video Memory Page 0x40 (0x40··)
                             50 ;; cpct_page0O - Video Memory Page 0x00 (0x00··)
                             51 ;;
                     0030    52 cpct_pageC0_asm = 0x30
                     0020    53 cpct_page80_asm = 0x20
                     0010    54 cpct_page40_asm = 0x10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 38.
Hexadecimal [16-Bits]



                     0000    55 cpct_page00_asm = 0x00
                             56 
                             57 ;;
                             58 ;; Macro: cpctm_memPage6_asm
                             59 ;;
                             60 ;;    Macro that encodes a video memory page in the 6 Least Significant bits (LSb)
                             61 ;; of a byte, required as parameter for <cpct_setVideoMemoryPage>. It loads resulting
                             62 ;; value into a given 8-bits register.
                             63 ;;
                             64 ;; ASM Definition:
                             65 ;; .macro <cpct_memPage6_asm> *REG8*, *PAGE*
                             66 ;;
                             67 ;; Parameters (1 byte):
                             68 ;; (__) REG8 - 8bits register where result will be loaded
                             69 ;; (1B) PAGE - Video memory page wanted 
                             70 ;;
                             71 ;; Known issues:
                             72 ;;   * This macro can only be used from assembler code. It is not accessible from 
                             73 ;; C scope. For C programs, please refer to <cpct_memPage6>
                             74 ;;   * This macro will work *only* with constant values, as its value needs to
                             75 ;; be calculated in compilation time. If fed with variable values, it will give 
                             76 ;; an assembler error.
                             77 ;;
                             78 ;; Destroyed Registers:
                             79 ;;    REG8
                             80 ;;
                             81 ;; Size of generated code:
                             82 ;;    2 bytes 
                             83 ;;
                             84 ;; Time Measures:
                             85 ;;    * 2 microseconds
                             86 ;;    * 8 CPU Cycles
                             87 ;;
                             88 ;; Details:
                             89 ;;  This is just a macro that shifts *PAGE* 2 bits to the right, to leave it
                             90 ;; with just 6 significant bits. For more information, check functions
                             91 ;; <cpct_setVideoMemoryPage> and <cpct_setVideoMemoryOffset>.
                             92 ;;
                             93 .macro cpctm_memPage6_asm REG8, PAGE 
                             94    ld REG8, #PAGE / 4      ;; [2] REG8 = PAGE/4
                             95 .endm
                             96 
                             97 ;;
                             98 ;; Macro: cpctm_screenPtr_asm
                             99 ;;
                            100 ;;    Macro that calculates the video memory location (byte pointer) of a 
                            101 ;; given pair of coordinates (*X*, *Y*). Value resulting from calculation 
                            102 ;; will be loaded into a 16-bits register.
                            103 ;;
                            104 ;; ASM Definition:
                            105 ;;    .macro <cpctm_screenPtr_asm> *REG16*, *VMEM*, *X*, *Y*
                            106 ;;
                            107 ;; Parameters:
                            108 ;;    (__) REG16 - 16-bits register where the resulting value will be loaded
                            109 ;;    (2B) VMEM  - Start of video memory buffer where (*X*, *Y*) coordinates will be calculated
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 39.
Hexadecimal [16-Bits]



                            110 ;;    (1B) X     - X Coordinate of the video memory location *in bytes* (*BEWARE! NOT in pixels!*)
                            111 ;;    (1B) Y     - Y Coordinate of the video memory location in pixels / bytes (they are same amount)
                            112 ;;
                            113 ;; Parameter Restrictions:
                            114 ;;    * *REG16* has to be a 16-bits register that can perform ld REG16, #value.
                            115 ;;    * *VMEM* will normally be the start of the video memory buffer where you want to 
                            116 ;; draw something. It could theoretically be any 16-bits value. 
                            117 ;;    * *X* must be in the range [0-79] for normal screen sizes (modes 0,1,2). Screen is
                            118 ;; always 80 bytes wide in these modes and this function is byte-aligned, so you have to 
                            119 ;; give it a byte coordinate (*NOT a pixel one!*).
                            120 ;;    * *Y* must be in the range [0-199] for normal screen sizes (modes 0,1,2). Screen is 
                            121 ;; always 200 pixels high in these modes. Pixels and bytes always coincide in vertical
                            122 ;; resolution, so this coordinate is the same in bytes that in pixels.
                            123 ;;    * If you give incorrect values to this function, the returned pointer could
                            124 ;; point anywhere in memory. This function will not cause any damage by itself, 
                            125 ;; but you may destroy important parts of your memory if you use its result to 
                            126 ;; write to memory, and you gave incorrect parameters by mistake. Take always
                            127 ;; care.
                            128 ;;
                            129 ;; Known issues:
                            130 ;;   * This macro can only be used from assembler code. It is not accessible from 
                            131 ;; C scope. For C programs, please refer to <cpct_getScreenPtr>
                            132 ;;   * This macro will work *only* with constant values, as calculations need to be 
                            133 ;; performed at assembler time.
                            134 ;;
                            135 ;; Destroyed Registers:
                            136 ;;    REG16
                            137 ;;
                            138 ;; Size of generated code:
                            139 ;;    3 bytes 
                            140 ;;
                            141 ;; Time Measures:
                            142 ;;    * 3 microseconds
                            143 ;;    * 12 CPU Cycles
                            144 ;;
                            145 ;; Details:
                            146 ;;    This macro does the same calculation than the function <cpct_getScreenPtr>. However,
                            147 ;; as it is a macro, if all 3 parameters (*VMEM*, *X*, *Y*) are constants, the calculation
                            148 ;; will be done at compile-time. This will free the binary from code or data, just putting in
                            149 ;; the result of this calculation (2 bytes with the resulting address). It is highly 
                            150 ;; recommended to use this macro instead of the function <cpct_getScreenPtr> when values
                            151 ;; involved are all constant. 
                            152 ;;
                            153 ;; Recommendations:
                            154 ;;    All constant values - Use this macro <cpctm_screenPtr_asm>
                            155 ;;    Any variable value  - Use the function <cpct_getScreenPtr>
                            156 ;;
                            157 .macro cpctm_screenPtr_asm REG16, VMEM, X, Y 
                            158    ld REG16, #VMEM + 80 * (Y / 8) + 2048 * (Y & 7) + X   ;; [3] REG16 = screenPtr
                            159 .endm
                            160 
                            161 ;;
                            162 ;; Macro: cpctm_setCRTCReg
                            163 ;;
                            164 ;;    Macro that sets a new value for a given CRTC register.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 40.
Hexadecimal [16-Bits]



                            165 ;;
                            166 ;; ASM Definition:
                            167 ;;    .macro <cpctm_setCRTCReg> *HEXREG*, *HEXVAL*
                            168 ;;
                            169 ;; Parameters:
                            170 ;;    (1B) HEXREG - New value to be set for the register (in hexadecimal)
                            171 ;;    (1B) HEXVAL - Number of the register to be set (in hexadecimal)
                            172 ;;
                            173 ;; Parameter Restrictions:
                            174 ;;    * *HEXREG* has to be an hexadecimal value from 00 to 1F
                            175 ;;    * *HEXVAL* has to be an hexadecimal value. Its valid range will depend
                            176 ;;          upon the selected register that will be modified. 
                            177 ;;
                            178 ;; Known issues:
                            179 ;;   * This macro can *only* be used from assembler code. It is not accessible from 
                            180 ;; C scope. 
                            181 ;;   * This macro can only be used with *constant values*. As given values are 
                            182 ;; concatenated with a number, they must also be hexadecimal numbers. If a 
                            183 ;; register or other value is given, this macro will not work.
                            184 ;;   * Using values out of range have unpredicted behaviour and can even 
                            185 ;; potentially cause damage to real Amstrad CPC monitors. Please, use with care.
                            186 ;;
                            187 ;; Destroyed Registers:
                            188 ;;    BC
                            189 ;;
                            190 ;; Size of generated code:
                            191 ;;    10 bytes 
                            192 ;;
                            193 ;; Time Measures:
                            194 ;;    * 14 microseconds
                            195 ;;    * 56 CPU Cycles
                            196 ;;
                            197 ;; Details:
                            198 ;;    This macro expands to two CRTC commands: Register selection and Register setting.
                            199 ;; It selects the register given as first parameter, then sets its new value to 
                            200 ;; that given as second parameter. Both given parameters must be of exactly 1 byte
                            201 ;; in size and the have to be provided in hexadecimal. This is due to the way
                            202 ;; that macro expansion and concatenation works. Given values will be concatenated
                            203 ;; with another 8-bit hexadecimal value to form a unique 16-bits hexadecimal value.
                            204 ;; Therefore, any parameter given will always be considered hexadecimal.
                            205 ;;
                            206 .macro cpctm_setCRTCReg_asm HEXREG, HEXVAL
                            207    ld    bc, #0xBC'HEXREG  ;; [3] B=0xBC CRTC Select Register, C=register number to be selected
                            208    out  (c), c             ;; [4] Select register
                            209    ld    bc, #0xBD'HEXVAL  ;; [3] B=0xBD CRTC Set Register, C=Value to be set
                            210    out  (c), c             ;; [4] Set the value
                            211 .endm
                            212 
                            213 ;;//////////////////////////////////////////////////////////////////////
                            214 ;; Group: Setting the border
                            215 ;;//////////////////////////////////////////////////////////////////////
                            216 
                            217 ;;
                            218 ;; Macro: cpctm_setBorder_asm
                            219 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 41.
Hexadecimal [16-Bits]



                            220 ;;   Changes the colour of the screen border.
                            221 ;;
                            222 ;; ASM Definition:
                            223 ;;   .macro <cpctm_setBorder_asm> HWC 
                            224 ;;
                            225 ;; Input Parameters (1 Byte):
                            226 ;;   (1B) HWC - Hardware colour value for the screen border in *hexadecimal [00-1B]*.
                            227 ;;
                            228 ;; Known issues:
                            229 ;;   * *Beware!* *HWC* colour value must be given in *hexadecimal*, as it is
                            230 ;; substituted in place, and must be in the range [00-1B].
                            231 ;;   * This macro can only be used from assembler code. It is not accessible from 
                            232 ;; C scope. For C programs, please refer to <cpct_setBorder>
                            233 ;;   * This macro will work *only* with constant values, as calculations need to be 
                            234 ;; performed at assembler time.
                            235 ;;
                            236 ;; Destroyed Registers:
                            237 ;;    HL
                            238 ;;
                            239 ;; Size of generated code:
                            240 ;;    * 16 bytes 
                            241 ;;     6b - generated code
                            242 ;;    10b - cpct_setPALColour_asm code
                            243 ;;
                            244 ;; Time Measures:
                            245 ;;    * 28 microseconds
                            246 ;;    * 112 CPU Cycles
                            247 ;;
                            248 ;; Details:
                            249 ;;   This is not a real function, but an assembler macro. Beware of using it along
                            250 ;; with complex expressions or calculations, as it may expand in non-desired
                            251 ;; ways.
                            252 ;;
                            253 ;;   For more information, check the real function <cpct_setPALColour>, which
                            254 ;; is called when using <cpctm_setBorder_asm> (It is called using 16 as *pen*
                            255 ;; argument, which identifies the border).
                            256 ;;
                            257 .macro cpctm_setBorder_asm HWC
                            258    .radix h
                            259    cpctm_setBorder_raw_asm \HWC ;; [28] Macro that does the job, but requires a number value to be passed
                            260    .radix d
                            261 .endm
                            262 .macro cpctm_setBorder_raw_asm HWC
                            263    .globl cpct_setPALColour_asm
                            264    ld   hl, #0x'HWC'10         ;; [3]  H=Hardware value of desired colour, L=Border INK (16)
                            265    call cpct_setPALColour_asm  ;; [25] Set Palette colour of the border
                            266 .endm
                            267 
                            268 ;;//////////////////////////////////////////////////////////////////////
                            269 ;; Group: Screen clearing
                            270 ;;//////////////////////////////////////////////////////////////////////
                            271 
                            272 ;;
                            273 ;; Macro: cpctm_clearScreen_asm
                            274 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 42.
Hexadecimal [16-Bits]



                            275 ;;    Macro to simplify clearing the screen.
                            276 ;;
                            277 ;; ASM Definition:
                            278 ;;   .macro <cpct_clearScreen_asm> COL
                            279 ;;
                            280 ;; Input Parameters (1 byte):
                            281 ;;   (1B) COL - Colour pattern to be used for screen clearing. 
                            282 ;;
                            283 ;; Parameters:
                            284 ;;    *COL* - Any 8-bits value or the A register are valid. Typically, a 0x00 is used 
                            285 ;; to fill up all the screen with 0's (firmware colour 0). However, you may use it in 
                            286 ;; combination with <cpct_px2byteM0>, <cpct_px2byteM1> or a manually created colour pattern.
                            287 ;;
                            288 ;; Known issues:
                            289 ;;   * This macro can only be used from assembler code. It is not accessible from 
                            290 ;; C scope. For C programs, please refer to <cpct_clearScreen>
                            291 ;;
                            292 ;; Details:
                            293 ;;   Fills up all the standard screen (range [0xC000-0xFFFF]) with *COL* byte, the colour 
                            294 ;; pattern given.
                            295 ;;
                            296 ;; Destroyed Registers:
                            297 ;;    BC, DE, HL
                            298 ;;
                            299 ;; Size of generated code:
                            300 ;;    13 bytes 
                            301 ;;
                            302 ;; Time Measures:
                            303 ;;    98309 microseconds (*4.924 VSYNCs* on a 50Hz display).
                            304 ;;    393236 CPU Cycles 
                            305 ;;
                            306 .macro cpctm_clearScreen_asm COL
                            307    ld    hl, #0xC000    ;; [3] HL Points to Start of Video Memory
                            308    ld    de, #0xC001    ;; [3] DE Points to the next byte
                            309    ld    bc, #0x4000    ;; [3] BC = 16384 bytes to be copied
                            310    ld   (hl), #COL      ;; [3] First Byte = given Colour
                            311    ldir                 ;; [98297] Perform the copy
                            312 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 43.
Hexadecimal [16-Bits]



                             24 .include "video/colours.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;; File: Colours (asm)
                             20 ;;
                             21 ;;    Constants and utilities to manage the 27 colours from
                             22 ;; the CPC Palette comfortably in assembler.
                             23 ;;
                             24 
                             25 ;; Constant: Firmware colour values
                             26 ;;
                             27 ;;    Enumerates all 27 firmware colours for assembler programs
                             28 ;;
                             29 ;; Values:
                             30 ;; (start code)
                             31 ;;   [=================================================]
                             32 ;;   | Identifier        | Val| Identifier        | Val|
                             33 ;;   |-------------------------------------------------|
                             34 ;;   | FW_BLACK          |  0 | FW_BLUE           |  1 |
                             35 ;;   | FW_BRIGHT_BLUE    |  2 | FW_RED            |  3 |
                             36 ;;   | FW_MAGENTA        |  4 | FW_MAUVE          |  5 |
                             37 ;;   | FW_BRIGHT_RED     |  6 | FW_PURPLE         |  7 |
                             38 ;;   | FW_BRIGHT_MAGENTA |  8 | FW_GREEN          |  9 |
                             39 ;;   | FW_CYAN           | 10 | FW_SKY_BLUE       | 11 |
                             40 ;;   | FW_YELLOW         | 12 | FW_WHITE          | 13 |
                             41 ;;   | FW_PASTEL_BLUE    | 14 | FW_ORANGE         | 15 |
                             42 ;;   | FW_PINK           | 16 | FW_PASTEL_MAGENTA | 17 |
                             43 ;;   | FW_BRIGHT_GREEN   | 18 | FW_SEA_GREEN      | 19 |
                             44 ;;   | FW_BRIGHT_CYAN    | 20 | FW_LIME           | 21 |
                             45 ;;   | FW_PASTEL_GREEN   | 22 | FW_PASTEL_CYAN    | 23 |
                             46 ;;   | FW_BRIGHT_YELLOW  | 24 | FW_PASTEL_YELLOW  | 25 |
                             47 ;;   | FW_BRIGHT_WHITE   | 26 |                   |    |
                             48 ;;   [=================================================]
                             49 ;;(end code)
                             50 ;;
                     0000    51 FW_BLACK          =  0
                     0001    52 FW_BLUE           =  1
                     0002    53 FW_BRIGHT_BLUE    =  2
                     0003    54 FW_RED            =  3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 44.
Hexadecimal [16-Bits]



                     0004    55 FW_MAGENTA        =  4
                     0005    56 FW_MAUVE          =  5
                     0006    57 FW_BRIGHT_RED     =  6
                     0007    58 FW_PURPLE         =  7
                     0008    59 FW_BRIGHT_MAGENTA =  8
                     0009    60 FW_GREEN          =  9
                     000A    61 FW_CYAN           = 10
                     000B    62 FW_SKY_BLUE       = 11
                     000C    63 FW_YELLOW         = 12
                     000D    64 FW_WHITE          = 13
                     000E    65 FW_PASTEL_BLUE    = 14
                     000F    66 FW_ORANGE         = 15
                     0010    67 FW_PINK           = 16
                     0011    68 FW_PASTEL_MAGENTA = 17
                     0012    69 FW_BRIGHT_GREEN   = 18
                     0013    70 FW_SEA_GREEN      = 19
                     0014    71 FW_BRIGHT_CYAN    = 20
                     0015    72 FW_LIME           = 21
                     0016    73 FW_PASTEL_GREEN   = 22
                     0017    74 FW_PASTEL_CYAN    = 23
                     0018    75 FW_BRIGHT_YELLOW  = 24
                     0019    76 FW_PASTEL_YELLOW  = 25
                     001A    77 FW_BRIGHT_WHITE   = 26
                             78 
                             79 ;; Constant: Hardware colour values
                             80 ;;
                             81 ;;    Enumerates all 27 hardware colours for assembler programs
                             82 ;;
                             83 ;; Values:
                             84 ;; (start code)
                             85 ;;   [=====================================================]
                             86 ;;   | Identifier        | Value| Identifier        | Value|
                             87 ;;   |-----------------------------------------------------|
                             88 ;;   | HW_BLACK          | 0x14 | HW_BLUE           | 0x04 |
                             89 ;;   | HW_BRIGHT_BLUE    | 0x15 | HW_RED            | 0x1C |
                             90 ;;   | HW_MAGENTA        | 0x18 | HW_MAUVE          | 0x1D |
                             91 ;;   | HW_BRIGHT_RED     | 0x0C | HW_PURPLE         | 0x05 |
                             92 ;;   | HW_BRIGHT_MAGENTA | 0x0D | HW_GREEN          | 0x16 |
                             93 ;;   | HW_CYAN           | 0x06 | HW_SKY_BLUE       | 0x17 |
                             94 ;;   | HW_YELLOW         | 0x1E | HW_WHITE          | 0x00 |
                             95 ;;   | HW_PASTEL_BLUE    | 0x1F | HW_ORANGE         | 0x0E |
                             96 ;;   | HW_PINK           | 0x07 | HW_PASTEL_MAGENTA | 0x0F |
                             97 ;;   | HW_BRIGHT_GREEN   | 0x12 | HW_SEA_GREEN      | 0x02 |
                             98 ;;   | HW_BRIGHT_CYAN    | 0x13 | HW_LIME           | 0x1A |
                             99 ;;   | HW_PASTEL_GREEN   | 0x19 | HW_PASTEL_CYAN    | 0x1B |
                            100 ;;   | HW_BRIGHT_YELLOW  | 0x0A | HW_PASTEL_YELLOW  | 0x03 |
                            101 ;;   | HW_BRIGHT_WHITE   | 0x0B |                   |      |
                            102 ;;   [=====================================================]
                            103 ;;(end code)
                            104 ;;
                     0014   105 HW_BLACK          = 0x14
                     0004   106 HW_BLUE           = 0x04
                     0015   107 HW_BRIGHT_BLUE    = 0x15
                     001C   108 HW_RED            = 0x1C
                     0018   109 HW_MAGENTA        = 0x18
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 45.
Hexadecimal [16-Bits]



                     001D   110 HW_MAUVE          = 0x1D
                     000C   111 HW_BRIGHT_RED     = 0x0C
                     0005   112 HW_PURPLE         = 0x05
                     000D   113 HW_BRIGHT_MAGENTA = 0x0D
                     0016   114 HW_GREEN          = 0x16
                     0006   115 HW_CYAN           = 0x06
                     0017   116 HW_SKY_BLUE       = 0x17
                     001E   117 HW_YELLOW         = 0x1E
                     0000   118 HW_WHITE          = 0x00
                     001F   119 HW_PASTEL_BLUE    = 0x1F
                     000E   120 HW_ORANGE         = 0x0E
                     0007   121 HW_PINK           = 0x07
                     000F   122 HW_PASTEL_MAGENTA = 0x0F
                     0012   123 HW_BRIGHT_GREEN   = 0x12
                     0002   124 HW_SEA_GREEN      = 0x02
                     0013   125 HW_BRIGHT_CYAN    = 0x13
                     001A   126 HW_LIME           = 0x1A
                     0019   127 HW_PASTEL_GREEN   = 0x19
                     001B   128 HW_PASTEL_CYAN    = 0x1B
                     000A   129 HW_BRIGHT_YELLOW  = 0x0A
                     0003   130 HW_PASTEL_YELLOW  = 0x03
                     000B   131 HW_BRIGHT_WHITE   = 0x0B
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 46.
Hexadecimal [16-Bits]



                             25 
                             26 ;;
                             27 ;; Constant values
                             28 ;;
                     7F00    29 GA_port        = 0x7F00  ;; 16-bit Port of the Gate Array (for the use with BC register)
                     007F    30 GA_port_byte   = 0x7F    ;; 8-bit Port of the Gate Array
                     0000    31 PAL_PENR       = 0x00    ;; Command to select a PEN register in the PAL chip
                     0040    32 PAL_INKR       = 0x40    ;; Command to set the INK of a previously selected PEN register in the PAL chip
                     00F5    33 PPI_PORT_B     = 0xF5    ;; Port B of the PPI, used to read Vsync/Jumpers/PrinterBusy/CasIn/Exp information
                     00BC    34 CRTC_SELECTREG = 0xBC    ;; CRTC Port and command "Select Register"
                     00BD    35 CRTC_SETVAL    = 0xBD    ;; CRTC Port and command "Set Value"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 47.
Hexadecimal [16-Bits]



                             23 .include "sprites/sprites.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;#####################################################################
                             20 ;;### MODULE: Sprites
                             21 ;;#####################################################################
                             22 ;;### Functions, macros and definitions used for managing sprites
                             23 ;;### in assembler code
                             24 ;;#####################################################################
                             25 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 48.
Hexadecimal [16-Bits]



                             26 .include "sprites/flipping/flipping_macros.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;#####################################################################
                             20 ;;### MODULE: Sprites
                             21 ;;### SUBMODULE: flipping.macros
                             22 ;;#####################################################################
                             23 ;;### Macros used to speed up calculations required for to assist
                             24 ;;### flipping functions. Assembler version.
                             25 ;;#####################################################################
                             26 
                             27 ;;
                             28 ;; Macro: cpctm_ld_spbloff
                             29 ;;
                             30 ;;    Macro that calculates the offset to add to a sprite pointer to point 
                             31 ;; to its bottom left pixel.
                             32 ;;
                             33 ;; ASM Definition:
                             34 ;;    .macro <cpctm_ld_spbloff> *REG*, *W*, *H*
                             35 ;;
                             36 ;; Acronym stands for:
                             37 ;;    ld_sbloff = Load Sprite Bottom Left Offset
                             38 ;;
                             39 ;; Parameters:
                             40 ;;    (1-2B) REG - Register that will load the resulting offset (8 or 16 bits)
                             41 ;;    (1B) W     - Width of the sprite in *bytes*
                             42 ;;    (1B) H     - Height of the sprite in pixels
                             43 ;;
                             44 ;; Parameter Restrictions:
                             45 ;;    *REG* - Must be a valid 8/16 bits register that can be immediately loaded
                             46 ;; using ld REG, #immediate.
                             47 ;;    *W*   - Must be an immediate value representing the width of the sprite 
                             48 ;; in *bytes* (Beware! Not in pixels). For sprites having interlaced mask, you 
                             49 ;; may input 2 times the width of the sprite for appropriate results.
                             50 ;;    *H*   - Must be an immediate value representing the height of the sprite 
                             51 ;; in pixels.
                             52 ;;
                             53 ;; Returns:
                             54 ;; (start code)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 49.
Hexadecimal [16-Bits]



                             55 ;;    REG = W * (H - 1) ;; Register loaded with the offset
                             56 ;; (end code)
                             57 ;;
                             58 ;; Details:
                             59 ;;    This macro calculates the offset of the initial byte of the last row 
                             60 ;; of a given sprite (i.e. its bottom-left byte), with respect to its first
                             61 ;; byte (top-left corner). This value can easily be added to any sprite 
                             62 ;; pointer to get a pointer to the bottom-left byte. This pointer is required
                             63 ;; byte many flipping functions (like <cpct_vflipSprite>). Values for width
                             64 ;; and height of the sprite must be constant immediate values. Otherwise, this
                             65 ;; macro will generate incorrect code that will fail to compile. 
                             66 ;;    The macro calculates *W* * (*H*-1) at compile-time and loads it into
                             67 ;; the given register. Please, take into account that the macro does no check
                             68 ;; about the size of the resulting values. If multiplication results in a value
                             69 ;; greater than 255, you will need to load it into a 16-bit register. You must
                             70 ;; take care of the expected size of the offset value.
                             71 ;;
                             72 ;; Known issues:
                             73 ;;    * This is a assembler macro. It cannot be called or used from C code.
                             74 ;;
                             75 .macro cpctm_ld_spbloff REG, W, H
                             76    ld    REG, #W * (H-1)
                             77 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 50.
Hexadecimal [16-Bits]



                             21 .include "main.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;; 
                             20 ;; Declare all function entry points as global symbols for the compiler.
                             21 ;; (The linker will know what to do with them)
                             22 ;; WARNING: Every global symbol declared will be linked, so DO NOT declare 
                             23 ;; symbols for functions you do not use.
                             24 ;;
                             25 .globl cpct_disableFirmware_asm
                             26 .globl cpct_getScreenPtr_asm
                             27 .globl cpct_drawSpriteBlended_asm
                             28 .globl cpct_setVideoMode_asm
                             29 .globl cpct_scanKeyboard_asm
                             30 .globl cpct_isKeyPressed_asm
                             31 .globl cpct_px2byteM0_asm
                             32 .globl cpct_setPalette_asm
                             33 .globl cpct_etm_setDrawTilemap4x8_ag_asm
                             34 .globl cpct_etm_drawTilemap4x8_ag_asm
                             35 .globl cpct_waitVSYNC_asm
                             36 .globl _sp_palette
                             37 .globl _sp_blocks_0
                             38 .globl _sp_blocks_1
                             39 .globl _sp_blocks_2
                             40 .globl _g_tileset_00
                             41 .globl _g_tilemap
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 51.
Hexadecimal [16-Bits]



                             22 
                             23 ;;===============================================================================
                             24 ;; DEFINED CONSTANTS
                             25 ;;===============================================================================
                             26 
                     0010    27 palette_size   = 16              ;; Number of total palette colours
                     0003    28 blocks_width = 3        ;; Width of block sprite
                     0007    29 blocks_height = 7       ;; Height of block sprite
                     0050    30 screen_max_X = 80
                     0000    31 min_X = 0
                     0050    32 max_X = 80
                     0000    33 min_Y = 0
                     00C8    34 max_Y = 200
                             35 
                             36 ;;
                             37 ;; Start of _DATA area 
                             38 ;;  SDCC requires at least _DATA and _CODE areas to be declared, but you may use
                             39 ;;  any one of them for any purpose. Usually, compiler puts _DATA area contents
                             40 ;;  right after _CODE area contents.
                             41 ;;
                             42 .area _DATA
                             43 
                             44 ;;
                             45 ;; Start of _CODE area
                             46 ;; 
                             47 .area _CODE
                             48 
                             49 ;;
                             50 ;; jump table
                             51 ;;
                             52 
   4A4F                      53 jump_table:
   4A4F F6                   54     .db #-10
   4A50 FA                   55     .db #-6
   4A51 FE                   56     .db #-2
   4A52 00                   57     .db #0
   4A53 00                   58     .db #0
   4A54 02                   59     .db #2
   4A55 06                   60     .db #6
   4A56 0A                   61     .db #10
                             62 
                             63 ;;
                             64 ;; Macro: struct Player
                             65 ;;    Macro that creates a new initialized instance of Player Struct
                             66 ;; 
                             67 ;; Parameters:
                             68 ;;    instanceName: name of the variable that will be created as an instance of Player struct
                             69 ;;    st:           status of the player
                             70 ;;                  bit 0-3 jump_step
                             71 ;;                  bit 4 jump_status
                             72 ;;                  bit 7 active 
                             73 ;;    x:            X location of the Entity (bytes)
                             74 ;;    y:            Y location of the Entity (pixels)
                             75 ;;    px:           Prevoius X location of the Entity (bytes)
                             76 ;;    py:           Previous Y location of the Entity (pixels)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 52.
Hexadecimal [16-Bits]



                             77 ;;    wi:           Width of the Player Sprite (bytes)
                             78 ;;    he:           Height of the Player Sprite (bytes)
                             79 ;;    sp:       Pointer to the player sprite
                             80 ;;
                             81 .macro defineEntity name, st, x, y, px, py, vx, vy, wi, he, sp
                             82    ;; Struct data
                             83    name:
                             84       .db st     ;; Status of the Player
                             85       .db x     ;; X location of the Player (bytes)
                             86       .db y     ;; Y location of the Player (pixels)
                             87       .db px     ;; X location of the Player (bytes)
                             88       .db py     ;; Y location of the Player (pixels)
                             89       .db vx      ;; Speed X
                             90       .db vy     ;; Speed Y 
                             91       .db wi     ;; Width of the Player Sprite (bytes)
                             92       .db he     ;; Height of the Player Sprite (bytes)
                             93       .dw sp ;; Pointer to the player sprite
                             94     name'_size = . - name
                             95 .endm
                             96 
                             97 ;; Entinty Offset constants
                     0000    98 e_status = 0  ;; Status byte: bit7: moved - bytes 0-3 jump status
                     0001    99 e_x = 1
                     0002   100 e_y = 2
                     0003   101 e_px = 3
                     0004   102 e_py = 4
                     0005   103 e_vx = 5
                     0006   104 e_vy = 6
                     0007   105 e_width = 7
                     0008   106 e_height = 8
                     0009   107 e_sprite = 9
                            108 
                            109 ;; Define Entity Player
   4A57                     110 defineEntity player, 0, 40, 100, 40, 100, 1, 1, blocks_width, blocks_height, #_sp_blocks_0
                              1    ;; Struct data
   0008                       2    player:
   4A57 00                    3       .db 0     ;; Status of the Player
   4A58 28                    4       .db 40     ;; X location of the Player (bytes)
   4A59 64                    5       .db 100     ;; Y location of the Player (pixels)
   4A5A 28                    6       .db 40     ;; X location of the Player (bytes)
   4A5B 64                    7       .db 100     ;; Y location of the Player (pixels)
   4A5C 01                    8       .db 1      ;; Speed X
   4A5D 01                    9       .db 1     ;; Speed Y 
   4A5E 03                   10       .db blocks_width     ;; Width of the Player Sprite (bytes)
   4A5F 07                   11       .db blocks_height     ;; Height of the Player Sprite (bytes)
   4A60 D0 43                12       .dw #_sp_blocks_0 ;; Pointer to the player sprite
                     000B    13     player_size = . - player
                            111 
                            112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            113 ;;  FUNC: _move_entity_right
                            114 ;;  INPUT: IX pointer to the entity
                            115 ;;  OUTPUT:
                            116 ;;  DESTROYS: A
   4A62                     117 move_entity_right::
   4A62 DD 7E 01      [19]  118     ld a, e_x(ix)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 53.
Hexadecimal [16-Bits]



                            119     ;; check screen border
   4A65 FE 4C         [ 7]  120     cp #(screen_max_X - blocks_width -1)
   4A67 D2 78 4A      [10]  121     jp nc, no_move_right
   4A6A DD 86 05      [19]  122     add e_vx(ix)
   4A6D DD 77 01      [19]  123     ld e_x(ix), a
                            124     ;; Update status
   4A70 DD 7E 00      [19]  125     ld a, e_status(ix)      ;; Load status byte into A
   4A73 F6 80         [ 7]  126     or #0b10000000       ;; Set active bit of entity to 1
   4A75 DD 77 00      [19]  127     ld e_status(ix),a       ;; load back the state byte in the entity
   4A78                     128 no_move_right:    
   4A78 C9            [10]  129     ret
                            130 
                            131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            132 ;;  FUNC: _move_entity_left
                            133 ;;  INPUT: IX pointer to the entity
                            134 ;;  OUTPUT:
                            135 ;;  DESTROYS: A
   4A79                     136 move_entity_left::
   4A79 DD 7E 01      [19]  137     ld a, e_x(ix)
                            138     ;; check screen border
   4A7C B7            [ 4]  139     or a
   4A7D CA 8E 4A      [10]  140     jp z, no_move_left
   4A80 DD 96 05      [19]  141     sub e_vx(ix)
   4A83 DD 77 01      [19]  142     ld e_x(ix), a
                            143     ;; Update status
   4A86 DD 7E 00      [19]  144     ld a, e_status(ix)      ;; Load status byte into A
   4A89 F6 80         [ 7]  145     or #0b10000000       ;; Set active bit of entity to 1
   4A8B DD 77 00      [19]  146     ld e_status(ix),a       ;; load back the state byte in the entity
   4A8E                     147 no_move_left:
   4A8E C9            [10]  148     ret
                            149 
                            150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            151 ;;  FUNC: activate_jump_entity
                            152 ;;  INPUT: IX pointer to the entity
                            153 ;;  OUTPUT:
                            154 ;;  DESTROYS: A
   4A8F                     155 activate_jump_entity::
   4A8F DD 7E 00      [19]  156     ld a, e_status(ix)   ;; Load status byte into A
   4A92 F6 08         [ 7]  157     or #0b00001000       ;; Set jump_status bit of entity to 1
   4A94 DD 77 00      [19]  158     ld e_status(ix),a    ;; load back the state byte in the entity
   4A97 C9            [10]  159     ret
                            160 
                            161 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            162 ;;  FUNC: jump_entity
                            163 ;;  INPUT: IX pointer to the entity
                            164 ;;  OUTPUT:
                            165 ;;  DESTROYS: A
   4A98                     166 jump_entity::
                            167     ;; Update Y during the jump
   4A98 DD 7E 00      [19]  168     ld a, e_status(ix)
   4A9B E6 07         [ 7]  169     and #0b00000111     ;; Extract the jump step from status
   4A9D 16 00         [ 7]  170     ld d, #0
   4A9F 5F            [ 4]  171     ld e, a             ;; Move junp step to DE
   4AA0 21 4F 4A      [10]  172     ld hl, #jump_table  ;; Load  jump talbe address in HL
   4AA3 19            [11]  173     add hl,de           ;; move  index 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 54.
Hexadecimal [16-Bits]



   4AA4 46            [ 7]  174     ld b, (hl)          ;; Load jump table value into b
   4AA5 DD 7E 02      [19]  175     ld a, e_y(ix)       ;; Load current Y position
   4AA8 80            [ 4]  176     add b               ;; add jump step offset
   4AA9 DD 77 02      [19]  177     ld e_y(ix), a       ;; Load back the Y position
                            178     ;; check jump step
   4AAC DD 7E 00      [19]  179     ld a, e_status(ix)
   4AAF E6 07         [ 7]  180     and #0b00000111     ;; Extract the jump step from status
   4AB1 FE 07         [ 7]  181     cp #7
   4AB3 28 0D         [12]  182     jr z, jump_end       ;; if the end of the table is reached
   4AB5                     183 inc_jump_step:
   4AB5 3C            [ 4]  184     inc a               ;; Increment jump_step   
   4AB6 47            [ 4]  185     ld b, a             ;; load new jump_step into B
   4AB7 DD 7E 00      [19]  186     ld a, e_status(ix)
   4ABA E6 F8         [ 7]  187     and #0b11111000     ;; Extract the jump step from status
   4ABC B0            [ 4]  188     or b
   4ABD DD 77 00      [19]  189     ld e_status(ix), a  ;; store new jump_status step
   4AC0 18 08         [12]  190     jr end_jump_entity
   4AC2                     191 jump_end:
   4AC2 DD 7E 00      [19]  192     ld a, e_status(ix)
   4AC5 E6 F0         [ 7]  193     and #0b11110000     ;; reset 0-3 bits of the status
   4AC7 DD 77 00      [19]  194     ld e_status(ix), a  ;; store new jump_status step
   4ACA                     195 end_jump_entity:
   4ACA CD CE 4A      [17]  196     call set_active    
   4ACD C9            [10]  197     ret
                            198 
                            199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            200 ;;  FUNC: _set_active
                            201 ;;  INPUT: IX pointer to the entity
                            202 ;;  OUTPUT:
                            203 ;;  DESTROYS: AF, BC, DE, HL
   4ACE                     204 set_active::
                            205     ;; Update status
   4ACE DD 7E 00      [19]  206     ld a, e_status(ix)   ;; Load status byte into A
   4AD1 F6 80         [ 7]  207     or #0b10000000       ;; Set active bit of entity to 1
   4AD3 DD 77 00      [19]  208     ld e_status(ix),a    ;; load back the state byte in the entity
   4AD6 C9            [10]  209     ret
                            210  
                            211 
                            212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            213 ;;  FUNC: _draw_entity
                            214 ;;  INPUT: IX pointer to the entity
                            215 ;;  OUTPUT:
                            216 ;;  DESTROYS: AF, BC, DE, HL
   4AD7                     217 draw_entity::
                            218    ;; Calculate a video-memory location for drawing the entity
   4AD7 11 00 C0      [10]  219    ld   de, #CPCT_VMEM_START_ASM    ;; DE = Pointer to start of the screen
   4ADA DD 46 02      [19]  220    ld   b, e_y(ix)                      ;; B = y coordinate 
   4ADD DD 4E 01      [19]  221    ld   c, e_x(ix)                      ;; C = x coordinate 
                            222 
   4AE0 CD 80 4D      [17]  223    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            224    
                            225    ;; Draw Sprite
   4AE3 EB            [ 4]  226    ex  de, hl                       ;; DE = Pointer to Video Memory (X,Y) location
   4AE4 DD 66 0A      [19]  227    ld   h, e_sprite + 1(ix)    ;; | HL = Pointer to Player Sprite
   4AE7 DD 6E 09      [19]  228    ld   l, e_sprite + 0(ix)    ;; |
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 55.
Hexadecimal [16-Bits]



   4AEA DD 46 07      [19]  229    ld   b, e_width(ix)         ;; B = Player Width (bytes)
   4AED DD 4E 08      [19]  230    ld   c, e_height(ix)        ;; C = Player Height (pixels)
   4AF0 CD 58 4D      [17]  231    call cpct_drawSpriteBlended_asm         ;; Draw the sprite
   4AF3 C9            [10]  232 ret
                            233 
                            234 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            235 ;;  FUNC: _update_entity
                            236 ;;  INPUT: IX pointer to the entity
                            237 ;;  OUTPUT:
                            238 ;;  DESTROYS: AF, BC, DE, HL
   4AF4                     239 update_entity::
                            240     ;; Erase Sprite
                            241    ;; Calculate a video-memory location for drawing the entity
   4AF4 11 00 C0      [10]  242    ld   de, #CPCT_VMEM_START_ASM    ;; DE = Pointer to start of the screen
   4AF7 DD 46 04      [19]  243    ld   b, e_py(ix)                      ;; B = y coordinate 
   4AFA DD 4E 03      [19]  244    ld   c, e_px(ix)                      ;; C = x coordinate 
   4AFD CD 80 4D      [17]  245    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            246    ;; Draw Sprite
   4B00 EB            [ 4]  247    ex  de, hl                       ;; DE = Pointer to Video Memory (X,Y) location
   4B01 DD 66 0A      [19]  248    ld   h, e_sprite + 1(ix)    ;; | HL = Pointer to Player Sprite
   4B04 DD 6E 09      [19]  249    ld   l, e_sprite + 0(ix)    ;; |
   4B07 DD 46 07      [19]  250    ld   b, e_width(ix)         ;; B = Player Width (bytes)
   4B0A DD 4E 08      [19]  251    ld   c, e_height(ix)        ;; C = Player Height (pixels)
   4B0D CD 58 4D      [17]  252    call cpct_drawSpriteBlended_asm         ;; Draw the sprite
                            253    
                            254    
                            255    ;; Update previous coordinates
   4B10 DD 7E 01      [19]  256    ld a, e_x(ix)
   4B13 DD 77 03      [19]  257    ld e_px(ix), a 
   4B16 DD 7E 02      [19]  258    ld a, e_y(ix)
   4B19 DD 77 04      [19]  259    ld e_py(ix), a 
                            260    
                            261    
                            262    ;; Draw Sprite
                            263    ;; Calculate a video-memory location for drawing the entity
   4B1C 11 00 C0      [10]  264    ld   de, #CPCT_VMEM_START_ASM    ;; DE = Pointer to start of the screen
   4B1F DD 46 02      [19]  265    ld   b, e_y(ix)                      ;; B = y coordinate 
   4B22 DD 4E 01      [19]  266    ld   c, e_x(ix)                      ;; C = x coordinate 
   4B25 CD 80 4D      [17]  267    call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
                            268    ;; Draw Sprite
   4B28 EB            [ 4]  269    ex  de, hl                       ;; DE = Pointer to Video Memory (X,Y) location
   4B29 DD 66 0A      [19]  270    ld   h, e_sprite + 1(ix)    ;; | HL = Pointer to Player Sprite
   4B2C DD 6E 09      [19]  271    ld   l, e_sprite + 0(ix)    ;; |
   4B2F DD 46 07      [19]  272    ld   b, e_width(ix)         ;; B = Player Width (bytes)
   4B32 DD 4E 08      [19]  273    ld   c, e_height(ix)        ;; C = Player Height (pixels)
   4B35 CD 58 4D      [17]  274    call cpct_drawSpriteBlended_asm         ;; Draw the sprite
                            275    
                            276    ;; Update status
   4B38 DD 7E 00      [19]  277    ld a, e_status(ix)
   4B3B E6 7F         [ 7]  278    and #0b01111111
   4B3D DD 77 00      [19]  279    ld e_status(ix),a
   4B40 C9            [10]  280 ret
                            281 
                            282 
   4B41 00 00               283 scroll_offset: .dw 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 56.
Hexadecimal [16-Bits]



                            284 
                            285 ;;  DrawScreen
                            286 ;;  
                            287 ;;
   4B43                     288 draw_screen::
                            289     ;;(2B HL) memory	Video memory location where to draw the tilemap (character & 4-byte aligned)
                            290     ;;(2B DE) tilemap	Pointer to the upper-left tile of the view to be drawn of the tilemap
   4B43 11 04 C0      [10]  291     ld de, #0xC004
   4B46 21 0F 44      [10]  292     ld hl, #_g_tilemap
   4B49 ED 4B 41 4B   [20]  293     ld bc, (scroll_offset)
   4B4D ED 4A         [15]  294     adc hl, bc
   4B4F EB            [ 4]  295     ex de, hl
   4B50 CD 76 4C      [17]  296     call cpct_etm_drawTilemap4x8_ag_asm
   4B53 C9            [10]  297     ret
                            298 
                            299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            300 ;;  FUNC: move_scroll_right
                            301 ;;  INPUT: 
                            302 ;;  OUTPUT:
                            303 ;;  DESTROYS: AF, BC, DE, HL
   4B54                     304 move_scroll_right::
   4B54 2A 41 4B      [16]  305     ld hl, (scroll_offset)
   4B57 11 01 00      [10]  306     ld de, #1
   4B5A ED 5A         [15]  307     adc hl,de
   4B5C 22 41 4B      [16]  308     ld (scroll_offset), hl
   4B5F CD 43 4B      [17]  309     call draw_screen
   4B62 C9            [10]  310     ret
                            311 
                            312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            313 ;;  FUNC: move_scroll_left
                            314 ;;  INPUT: 
                            315 ;;  OUTPUT:
                            316 ;;  DESTROYS: AF, BC, DE, HL
   4B63                     317 move_scroll_left::
   4B63 2A 41 4B      [16]  318     ld hl, (scroll_offset)
                            319     ;; If scroll_offset != 0
   4B66 7C            [ 4]  320     ld a, h
   4B67 B7            [ 4]  321     or a         ; a = 0 ??
   4B68 20 05         [12]  322     jr nz, not_equal_left
   4B6A 7D            [ 4]  323     ld a,l
   4B6B B7            [ 4]  324     or a         ; a = 0 ??
   4B6C 20 01         [12]  325     jr  nz, not_equal_left
   4B6E C9            [10]  326     ret
   4B6F                     327 not_equal_left:
   4B6F 11 FF FF      [10]  328     ld de, #-1
   4B72 ED 5A         [15]  329     adc hl,de
   4B74 22 41 4B      [16]  330     ld (scroll_offset), hl
   4B77 CD 43 4B      [17]  331     call draw_screen
   4B7A C9            [10]  332     ret
                            333 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            334 ;;  FUNC: move_scroll_down
                            335 ;;  INPUT: 
                            336 ;;  OUTPUT:
                            337 ;;  DESTROYS: AF, BC, DE, HL
   4B7B                     338 move_scroll_down::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 57.
Hexadecimal [16-Bits]



   4B7B 2A 41 4B      [16]  339     ld hl, (scroll_offset)
   4B7E 11 28 00      [10]  340     ld de, #40
   4B81 ED 5A         [15]  341     adc hl,de
   4B83 22 41 4B      [16]  342     ld (scroll_offset), hl
   4B86 CD 43 4B      [17]  343     call draw_screen
   4B89 C9            [10]  344     ret
                            345 
                            346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            347 ;;  FUNC: move_scroll_down
                            348 ;;  INPUT: 
                            349 ;;  OUTPUT:
                            350 ;;  DESTROYS: AF, BC, DE, HL
   4B8A                     351 move_scroll_up::
   4B8A 2A 41 4B      [16]  352     ld hl, (scroll_offset)
                            353     ;; If scroll_offset != 0
   4B8D 7C            [ 4]  354     ld a, h
   4B8E B7            [ 4]  355     or a         ; a = 0 ??
   4B8F 20 05         [12]  356     jr nz, not_equal_up
   4B91 7D            [ 4]  357     ld a,l
   4B92 B7            [ 4]  358     or a         ; a = 0 ??
   4B93 20 01         [12]  359     jr  nz, not_equal_up
   4B95 C9            [10]  360     ret
   4B96                     361 not_equal_up:
   4B96 11 D8 FF      [10]  362     ld de, #-40
   4B99 ED 5A         [15]  363     adc hl,de
   4B9B 22 41 4B      [16]  364     ld (scroll_offset), hl
   4B9E CD 43 4B      [17]  365     call draw_screen
   4BA1 C9            [10]  366     ret
                            367 
                            368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            369 ;;  FUNC: init_main
                            370 ;;  INPUT: 
                            371 ;;  OUTPUT:
                            372 ;;  DESTROYS: AF, BC, DE, HL
   4BA2                     373 init_main::
                            374  ;; Set Palette
   4BA2 21 C0 43      [10]  375    ld    hl, #_sp_palette           ;; HL = pointer to the start of the palette array
   4BA5 11 10 00      [10]  376    ld    de, #palette_size           ;; DE = Size of the palette array (num of colours)
   4BA8 CD 63 4C      [17]  377    call  cpct_setPalette_asm        ;; Set the new palette
                            378 
   4BAB 0E 00         [ 7]  379     ld  c, #0                     ;; C = 0 (Mode 0)
   4BAD CD 19 4D      [17]  380     call cpct_setVideoMode_asm    ;; Set Mode 0
                            381 
   4BB0 26 03         [ 7]  382     ld h, #3                ;; left pixel color
   4BB2 2E 03         [ 7]  383     ld l, #3                ;; right pixel color 
   4BB4 CD 2E 4D      [17]  384     call cpct_px2byteM0_asm
                            385 
   4BB7 21 00 C0      [10]  386     ld hl, #CPCT_VMEM_START_ASM
   4BBA 77            [ 7]  387     ld (hl), a         ;; color definido antes 
   4BBB 11 01 C0      [10]  388     ld de, #0xc001
   4BBE 01 00 40      [10]  389     ld bc, #0x4000
   4BC1 ED B0         [21]  390     ldir
                            391 
                            392     ;;(1B C) width	Width in tiles of the view window to be drawn
                            393     ;;(1B B) height	Height in tiles of the view window to be drawn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 58.
Hexadecimal [16-Bits]



                            394     ;;(2B DE) tilemapWidth	Width in tiles of the complete tilemap
                            395     ;;(2B HL) tileset	Pointer to the start of the tileset definition (list of 32-byte tiles).
                            396     ;;Note: it also uses current interrupt status (register I) as a value.  It should be considered as an additional parameter.
                            397 
   4BC3 0E 12         [ 7]  398     ld c, #18
   4BC5 06 14         [ 7]  399     ld b, #20
   4BC7 11 28 00      [10]  400     ld de, #40
   4BCA 21 00 40      [10]  401     ld hl, #_g_tileset_00
   4BCD CD CD 4D      [17]  402     call cpct_etm_setDrawTilemap4x8_ag_asm
                            403     
   4BD0 C3 43 4B      [10]  404     jp draw_screen
                            405 
   4BD3 C9            [10]  406     ret 
                            407 
                            408 ;;
                            409 ;; MAIN function. This is the entry point of the application.
                            410 ;;    _main:: global symbol is required for correctly compiling and linking
                            411 ;;
   4BD4                     412 _main::
                            413     ;; Disable firmware to prevent it from interfering with string drawing
   4BD4 CD 48 4D      [17]  414     call cpct_disableFirmware_asm
                            415     ;; Call to de main initialization
   4BD7 CD A2 4B      [17]  416     call init_main
                            417     ;; First sprite draw
   4BDA DD 21 57 4A   [14]  418     ld ix, #player
   4BDE CD D7 4A      [17]  419     call draw_entity
                            420   
                            421 ;; Main loop
   4BE1                     422 main_loop:
   4BE1 CD 9C 4D      [17]  423     call cpct_scanKeyboard_asm  ;; Reads keyboard
                            424     
                            425     ;; Check right movement
   4BE4 21 03 08      [10]  426     ld hl, #Key_P               
   4BE7 CD 57 4C      [17]  427     call cpct_isKeyPressed_asm
   4BEA B7            [ 4]  428     or a
   4BEB 28 03         [12]  429     jr z, no_right
   4BED CD 62 4A      [17]  430     call move_entity_right
   4BF0                     431 no_right:
                            432 
                            433 ;; Check left movement
   4BF0 21 04 04      [10]  434     ld hl, #Key_O               
   4BF3 CD 57 4C      [17]  435     call cpct_isKeyPressed_asm
   4BF6 B7            [ 4]  436     or a
   4BF7 28 03         [12]  437     jr z, no_left
   4BF9 CD 79 4A      [17]  438     call move_entity_left
   4BFC                     439 no_left:
                            440 
                            441 ;; Check jump movement
   4BFC 21 05 80      [10]  442     ld hl, #Key_Space               
   4BFF CD 57 4C      [17]  443     call cpct_isKeyPressed_asm
   4C02 B7            [ 4]  444     or a
   4C03 28 03         [12]  445     jr z, no_jump
   4C05 CD 8F 4A      [17]  446     call activate_jump_entity
   4C08                     447 no_jump:
                            448 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 59.
Hexadecimal [16-Bits]



   4C08 DD 7E 00      [19]  449     ld a, e_status(ix)
   4C0B E6 80         [ 7]  450     and #0b10000000
   4C0D 28 03         [12]  451     jr z, no_update
   4C0F CD F4 4A      [17]  452     call update_entity
   4C12                     453  no_update:
   4C12 DD 7E 00      [19]  454     ld a, e_status(ix)
   4C15 E6 08         [ 7]  455     and #0b00001000
   4C17 28 06         [12]  456     jr z, no_jump_active
   4C19 CD 98 4A      [17]  457     call jump_entity
   4C1C CD F4 4A      [17]  458     call update_entity
   4C1F                     459 no_jump_active:
                            460 
                            461 ;; Check right scroll
   4C1F 21 04 10      [10]  462     ld hl, #Key_L               
   4C22 CD 57 4C      [17]  463     call cpct_isKeyPressed_asm
   4C25 B7            [ 4]  464     or a
   4C26 28 03         [12]  465     jr z, no_right_scroll
   4C28 CD 54 4B      [17]  466     call move_scroll_right
   4C2B                     467 no_right_scroll:
                            468 
                            469 ;; Check left scroll
   4C2B 21 05 20      [10]  470     ld hl, #Key_J               
   4C2E CD 57 4C      [17]  471     call cpct_isKeyPressed_asm
   4C31 B7            [ 4]  472     or a
   4C32 28 03         [12]  473     jr z, no_left_scroll
   4C34 CD 63 4B      [17]  474     call move_scroll_left
   4C37                     475 no_left_scroll:
                            476 
                            477 ;; Check up scroll
   4C37 21 04 08      [10]  478     ld hl, #Key_I               
   4C3A CD 57 4C      [17]  479     call cpct_isKeyPressed_asm
   4C3D B7            [ 4]  480     or a
   4C3E 28 03         [12]  481     jr z, no_up_scroll
   4C40 CD 8A 4B      [17]  482     call move_scroll_up
   4C43                     483 no_up_scroll:
                            484 
                            485 ;; Check down scroll
   4C43 21 04 20      [10]  486     ld hl, #Key_K               
   4C46 CD 57 4C      [17]  487     call cpct_isKeyPressed_asm
   4C49 B7            [ 4]  488     or a
   4C4A 28 03         [12]  489     jr z, no_down_scroll
   4C4C CD 7B 4B      [17]  490     call move_scroll_down
   4C4F                     491 no_down_scroll:
                            492 
   4C4F CD 26 4D      [17]  493     call cpct_waitVSYNC_asm
   4C52 CD 26 4D      [17]  494     call cpct_waitVSYNC_asm
                            495 
   4C55 18 8A         [12]  496     jr    main_loop
