;;-----------------------------LICENSE NOTICE------------------------------------
;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
;;
;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU Lesser General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.
;;
;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU Lesser General Public License for more details.
;;
;;  You should have received a copy of the GNU Lesser General Public License
;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;-------------------------------------------------------------------------------

;; Include all CPCtelera constant definitions, macros and variables
.include "cpctelera.h.s"
.include "main.h.s"

;;===============================================================================
;; DEFINED CONSTANTS
;;===============================================================================

palette_size   = 16              ;; Number of total palette colours
blocks_width = 3        ;; Width of block sprite
blocks_height = 7       ;; Height of block sprite
screen_max_X = 80
min_X = 0
max_X = 80
min_Y = 0
max_Y = 200

;;
;; Start of _DATA area 
;;  SDCC requires at least _DATA and _CODE areas to be declared, but you may use
;;  any one of them for any purpose. Usually, compiler puts _DATA area contents
;;  right after _CODE area contents.
;;
.area _DATA

;;
;; Start of _CODE area
;; 
.area _CODE

;;
;; Macro: struct Player
;;    Macro that creates a new initialized instance of Player Struct
;; 
;; Parameters:
;;    instanceName: name of the variable that will be created as an instance of Player struct
;;    st:           status of the player
;;    x:            X location of the Entity (bytes)
;;    y:            Y location of the Entity (pixels)
;;    px:           Prevoius X location of the Entity (bytes)
;;    py:           Previous Y location of the Entity (pixels)
;;    wi:           Width of the Player Sprite (bytes)
;;    he:           Height of the Player Sprite (bytes)
;;    sp:       Pointer to the player sprite
;;
.macro defineEntity name, st, x, y, px, py wi, he, sp
   ;; Struct data
   name:
      .db st     ;; Status of the Player
      .db x     ;; X location of the Player (bytes)
      .db y     ;; Y location of the Player (pixels)
      .db px     ;; X location of the Player (bytes)
      .db py     ;; Y location of the Player (pixels)
      .db wi     ;; Width of the Player Sprite (bytes)
      .db he     ;; Height of the Player Sprite (bytes)
      .dw sp ;; Pointer to the player sprite
.endm
;; Entinty Offset constants
e_status = 0  ;; Status byte: bit7: moved
e_x = 1
e_y = 2
e_px = 3
e_py = 4
e_width = 5
e_height = 6
e_sprite = 7

;; Define Entity Player
defineEntity player, 0, 58, 60, 58, 60, blocks_width, blocks_height, #_sp_blocks_0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: _move_entity_right
;;  INPUT: IX pointer to the entity
;;  OUTPUT:
;;  DESTROYS: A
_move_entity_right:
    ld a, e_x(ix)
    ;; check screen border
    cp #(screen_max_X - blocks_width)
    jp z, no_move_right
    inc a
    ld e_x(ix), a
    ;; Update status
    ld a, e_status(ix)      ;; Load status byte into A
    or #0b10000000       ;; Set active bit of entity to 1
    ld e_status(ix),a       ;; load back the state byte in the entity
no_move_right:    
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: _move_entity_left
;;  INPUT: IX pointer to the entity
;;  OUTPUT:
;;  DESTROYS: A
_move_entity_left:
    ld a, e_x(ix)
    ;; check screen border
    or a
    jp z, no_move_left
    dec a
    ld e_x(ix), a
    ;; Update status
    ld a, e_status(ix)      ;; Load status byte into A
    or #0b10000000       ;; Set active bit of entity to 1
    ld e_status(ix),a       ;; load back the state byte in the entity
no_move_left:
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: _draw_entity
;;  INPUT: IX pointer to the entity
;;  OUTPUT:
;;  DESTROYS: AF, BC, DE, HL
_draw_entity:
   ;; Calculate a video-memory location for drawing the entity
   ld   de, #CPCT_VMEM_START_ASM    ;; DE = Pointer to start of the screen
   ld   b, e_y(ix)                      ;; B = y coordinate 
   ld   c, e_x(ix)                      ;; C = x coordinate 

   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
   
   ;; Draw Sprite
   ex  de, hl                       ;; DE = Pointer to Video Memory (X,Y) location
   ld   h, e_sprite + 1(ix)    ;; | HL = Pointer to Player Sprite
   ld   l, e_sprite + 0(ix)    ;; |
   ld   b, e_width(ix)         ;; B = Player Width (bytes)
   ld   c, e_height(ix)        ;; C = Player Height (pixels)
   call cpct_drawSpriteBlended_asm         ;; Draw the sprite
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: _update_entity
;;  INPUT: IX pointer to the entity
;;  OUTPUT:
;;  DESTROYS: AF, BC, DE, HL
_update_entity:
    ;; Erase Sprite
   ;; Calculate a video-memory location for drawing the entity
   ld   de, #CPCT_VMEM_START_ASM    ;; DE = Pointer to start of the screen
   ld   b, e_py(ix)                      ;; B = y coordinate 
   ld   c, e_px(ix)                      ;; C = x coordinate 
   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
   ;; Draw Sprite
   ex  de, hl                       ;; DE = Pointer to Video Memory (X,Y) location
   ld   h, e_sprite + 1(ix)    ;; | HL = Pointer to Player Sprite
   ld   l, e_sprite + 0(ix)    ;; |
   ld   b, e_width(ix)         ;; B = Player Width (bytes)
   ld   c, e_height(ix)        ;; C = Player Height (pixels)
   call cpct_drawSpriteBlended_asm         ;; Draw the sprite
   
   
   ;; Update previous coordinates
   ld a, e_x(ix)
   ld e_px(ix), a 
   ld a, e_y(ix)
   ld e_py(ix), a 
   
   
   ;; Draw Sprite
   ;; Calculate a video-memory location for drawing the entity
   ld   de, #CPCT_VMEM_START_ASM    ;; DE = Pointer to start of the screen
   ld   b, e_y(ix)                      ;; B = y coordinate 
   ld   c, e_x(ix)                      ;; C = x coordinate 
   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
   ;; Draw Sprite
   ex  de, hl                       ;; DE = Pointer to Video Memory (X,Y) location
   ld   h, e_sprite + 1(ix)    ;; | HL = Pointer to Player Sprite
   ld   l, e_sprite + 0(ix)    ;; |
   ld   b, e_width(ix)         ;; B = Player Width (bytes)
   ld   c, e_height(ix)        ;; C = Player Height (pixels)
   call cpct_drawSpriteBlended_asm         ;; Draw the sprite
   
   ;; Update status
   ld a, e_status(ix)
   and #0b01111111
   ld e_status(ix),a
ret

;;
;; define board a matrix of 19x8 bytes
;;
board_width: .db 8
board_height: .db 19
board1:
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0
    .db 0,0,0,0,0,0,0,0

;;  DrawBoard
;;  
;;
_draw_board:

ret



;;
;; Init Function
;;
;;
_init_main:
 ;; Set Palette
   ld    hl, #_sp_palette           ;; HL = pointer to the start of the palette array
   ld    de, #palette_size           ;; DE = Size of the palette array (num of colours)
   call  cpct_setPalette_asm        ;; Set the new palette

    ld  c, #0                     ;; C = 0 (Mode 0)
    call cpct_setVideoMode_asm    ;; Set Mode 0



    ld h, #0                ;; left pixel color
    ld l, #0                ;; right pixel color 
    call cpct_px2byteM0_asm

    ld hl, #CPCT_VMEM_START_ASM
    ld (hl), a         ;; color definido antes 
    ld de, #0xc001
    ld bc, #0x4000
    ldir
    ret 

;;
;; MAIN function. This is the entry point of the application.
;;    _main:: global symbol is required for correctly compiling and linking
;;
_main::
    ;; Disable firmware to prevent it from interfering with string drawing
    call cpct_disableFirmware_asm
    ;; Call to de main initialization
    call _init_main
    ;; First sprite draw
    ld ix, #player
    call _draw_entity
  
;; Main loop
main_loop:
    call cpct_scanKeyboard_asm  ;; Reads keyboard
    
    ;; Check right movement
    ld hl, #Key_P               
    call cpct_isKeyPressed_asm
    or a
    jp z, no_right
    call _move_entity_right
no_right:

;; Check left movement
    ld hl, #Key_O               
    call cpct_isKeyPressed_asm
    or a
    jp z, no_left
    call _move_entity_left
no_left:

    ld a, e_status(ix)
    and #0b10000000
    jp z, no_update
    call _update_entity
 no_update:
    jr    main_loop