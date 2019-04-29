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
;; jump table
;;

jump_table:
    .db #-10
    .db #-6
    .db #-2
    .db #0
    .db #0
    .db #2
    .db #6
    .db #10

;;
;; Macro: struct Player
;;    Macro that creates a new initialized instance of Player Struct
;; 
;; Parameters:
;;    instanceName: name of the variable that will be created as an instance of Player struct
;;    st:           status of the player
;;                  bit 0-3 jump_step
;;                  bit 4 jump_status
;;                  bit 7 active 
;;    x:            X location of the Entity (bytes)
;;    y:            Y location of the Entity (pixels)
;;    px:           Prevoius X location of the Entity (bytes)
;;    py:           Previous Y location of the Entity (pixels)
;;    wi:           Width of the Player Sprite (bytes)
;;    he:           Height of the Player Sprite (bytes)
;;    sp:       Pointer to the player sprite
;;
.macro defineEntity name, st, x, y, px, py, vx, vy, wi, he, sp
   ;; Struct data
   name:
      .db st     ;; Status of the Player
      .db x     ;; X location of the Player (bytes)
      .db y     ;; Y location of the Player (pixels)
      .db px     ;; X location of the Player (bytes)
      .db py     ;; Y location of the Player (pixels)
      .db vx      ;; Speed X
      .db vy     ;; Speed Y 
      .db wi     ;; Width of the Player Sprite (bytes)
      .db he     ;; Height of the Player Sprite (bytes)
      .dw sp ;; Pointer to the player sprite
    name'_size = . - name
.endm

;; Entinty Offset constants
e_status = 0  ;; Status byte: bit7: moved - bytes 0-3 jump status
e_x = 1
e_y = 2
e_px = 3
e_py = 4
e_vx = 5
e_vy = 6
e_width = 7
e_height = 8
e_sprite = 9

;; Define Entity Player
defineEntity player, 0, 40, 100, 40, 100, 1, 1, blocks_width, blocks_height, #_sp_blocks_0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: _move_entity_right
;;  INPUT: IX pointer to the entity
;;  OUTPUT:
;;  DESTROYS: A
move_entity_right::
    ld a, e_x(ix)
    ;; check screen border
    cp #(screen_max_X - blocks_width -1)
    jp nc, no_move_right
    add e_vx(ix)
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
move_entity_left::
    ld a, e_x(ix)
    ;; check screen border
    or a
    jp z, no_move_left
    sub e_vx(ix)
    ld e_x(ix), a
    ;; Update status
    ld a, e_status(ix)      ;; Load status byte into A
    or #0b10000000       ;; Set active bit of entity to 1
    ld e_status(ix),a       ;; load back the state byte in the entity
no_move_left:
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: activate_jump_entity
;;  INPUT: IX pointer to the entity
;;  OUTPUT:
;;  DESTROYS: A
activate_jump_entity::
    ld a, e_status(ix)   ;; Load status byte into A
    or #0b00001000       ;; Set jump_status bit of entity to 1
    ld e_status(ix),a    ;; load back the state byte in the entity
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: jump_entity
;;  INPUT: IX pointer to the entity
;;  OUTPUT:
;;  DESTROYS: A
jump_entity::
    ;; Update Y during the jump
    ld a, e_status(ix)
    and #0b00000111     ;; Extract the jump step from status
    ld d, #0
    ld e, a             ;; Move junp step to DE
    ld hl, #jump_table  ;; Load  jump talbe address in HL
    add hl,de           ;; move  index 
    ld b, (hl)          ;; Load jump table value into b
    ld a, e_y(ix)       ;; Load current Y position
    add b               ;; add jump step offset
    ld e_y(ix), a       ;; Load back the Y position
    ;; check jump step
    ld a, e_status(ix)
    and #0b00000111     ;; Extract the jump step from status
    cp #7
    jr z, jump_end       ;; if the end of the table is reached
inc_jump_step:
    inc a               ;; Increment jump_step   
    ld b, a             ;; load new jump_step into B
    ld a, e_status(ix)
    and #0b11111000     ;; Extract the jump step from status
    or b
    ld e_status(ix), a  ;; store new jump_status step
    jr end_jump_entity
jump_end:
    ld a, e_status(ix)
    and #0b11110000     ;; reset 0-3 bits of the status
    ld e_status(ix), a  ;; store new jump_status step
end_jump_entity:
    call set_active    
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: _set_active
;;  INPUT: IX pointer to the entity
;;  OUTPUT:
;;  DESTROYS: AF, BC, DE, HL
set_active::
    ;; Update status
    ld a, e_status(ix)   ;; Load status byte into A
    or #0b10000000       ;; Set active bit of entity to 1
    ld e_status(ix),a    ;; load back the state byte in the entity
    ret
 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: _draw_entity
;;  INPUT: IX pointer to the entity
;;  OUTPUT:
;;  DESTROYS: AF, BC, DE, HL
draw_entity::
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
update_entity::
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


scroll_offset: .dw 0

;;  DrawScreen
;;  
;;
draw_screen::
    ;;(2B HL) memory	Video memory location where to draw the tilemap (character & 4-byte aligned)
    ;;(2B DE) tilemap	Pointer to the upper-left tile of the view to be drawn of the tilemap
    ld de, #0xC004
    ld hl, #_g_tilemap
    ld bc, (scroll_offset)
    adc hl, bc
    ex de, hl
    call cpct_etm_drawTilemap4x8_ag_asm
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: move_scroll_right
;;  INPUT: 
;;  OUTPUT:
;;  DESTROYS: AF, BC, DE, HL
move_scroll_right::
    ld hl, (scroll_offset)
    ld de, #1
    adc hl,de
    ld (scroll_offset), hl
    call draw_screen
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: move_scroll_left
;;  INPUT: 
;;  OUTPUT:
;;  DESTROYS: AF, BC, DE, HL
move_scroll_left::
    ld hl, (scroll_offset)
    ;; If scroll_offset != 0
    ld a, h
    or a         ; a = 0 ??
    jr nz, not_equal_left
    ld a,l
    or a         ; a = 0 ??
    jr  nz, not_equal_left
    ret
not_equal_left:
    ld de, #-1
    adc hl,de
    ld (scroll_offset), hl
    call draw_screen
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: move_scroll_down
;;  INPUT: 
;;  OUTPUT:
;;  DESTROYS: AF, BC, DE, HL
move_scroll_down::
    ld hl, (scroll_offset)
    ld de, #40
    adc hl,de
    ld (scroll_offset), hl
    call draw_screen
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: move_scroll_down
;;  INPUT: 
;;  OUTPUT:
;;  DESTROYS: AF, BC, DE, HL
move_scroll_up::
    ld hl, (scroll_offset)
    ;; If scroll_offset != 0
    ld a, h
    or a         ; a = 0 ??
    jr nz, not_equal_up
    ld a,l
    or a         ; a = 0 ??
    jr  nz, not_equal_up
    ret
not_equal_up:
    ld de, #-40
    adc hl,de
    ld (scroll_offset), hl
    call draw_screen
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FUNC: init_main
;;  INPUT: 
;;  OUTPUT:
;;  DESTROYS: AF, BC, DE, HL
init_main::
 ;; Set Palette
   ld    hl, #_sp_palette           ;; HL = pointer to the start of the palette array
   ld    de, #palette_size           ;; DE = Size of the palette array (num of colours)
   call  cpct_setPalette_asm        ;; Set the new palette

    ld  c, #0                     ;; C = 0 (Mode 0)
    call cpct_setVideoMode_asm    ;; Set Mode 0

    ld h, #3                ;; left pixel color
    ld l, #3                ;; right pixel color 
    call cpct_px2byteM0_asm

    ld hl, #CPCT_VMEM_START_ASM
    ld (hl), a         ;; color definido antes 
    ld de, #0xc001
    ld bc, #0x4000
    ldir

    ;;(1B C) width	Width in tiles of the view window to be drawn
    ;;(1B B) height	Height in tiles of the view window to be drawn
    ;;(2B DE) tilemapWidth	Width in tiles of the complete tilemap
    ;;(2B HL) tileset	Pointer to the start of the tileset definition (list of 32-byte tiles).
    ;;Note: it also uses current interrupt status (register I) as a value.  It should be considered as an additional parameter.

    ld c, #18
    ld b, #20
    ld de, #40
    ld hl, #_g_tileset_00
    call cpct_etm_setDrawTilemap4x8_ag_asm
    
    jp draw_screen

    ret 

;;
;; MAIN function. This is the entry point of the application.
;;    _main:: global symbol is required for correctly compiling and linking
;;
_main::
    ;; Disable firmware to prevent it from interfering with string drawing
    call cpct_disableFirmware_asm
    ;; Call to de main initialization
    call init_main
    ;; First sprite draw
    ld ix, #player
    call draw_entity
  
;; Main loop
main_loop:
    call cpct_scanKeyboard_asm  ;; Reads keyboard
    
    ;; Check right movement
    ld hl, #Key_P               
    call cpct_isKeyPressed_asm
    or a
    jr z, no_right
    call move_entity_right
no_right:

;; Check left movement
    ld hl, #Key_O               
    call cpct_isKeyPressed_asm
    or a
    jr z, no_left
    call move_entity_left
no_left:

;; Check jump movement
    ld hl, #Key_Space               
    call cpct_isKeyPressed_asm
    or a
    jr z, no_jump
    call activate_jump_entity
no_jump:

    ld a, e_status(ix)
    and #0b10000000
    jr z, no_update
    call update_entity
 no_update:
    ld a, e_status(ix)
    and #0b00001000
    jr z, no_jump_active
    call jump_entity
    call update_entity
no_jump_active:

;; Check right scroll
    ld hl, #Key_L               
    call cpct_isKeyPressed_asm
    or a
    jr z, no_right_scroll
    call move_scroll_right
no_right_scroll:

;; Check left scroll
    ld hl, #Key_J               
    call cpct_isKeyPressed_asm
    or a
    jr z, no_left_scroll
    call move_scroll_left
no_left_scroll:

;; Check up scroll
    ld hl, #Key_I               
    call cpct_isKeyPressed_asm
    or a
    jr z, no_up_scroll
    call move_scroll_up
no_up_scroll:

;; Check down scroll
    ld hl, #Key_K               
    call cpct_isKeyPressed_asm
    or a
    jr z, no_down_scroll
    call move_scroll_down
no_down_scroll:

    call cpct_waitVSYNC_asm
    call cpct_waitVSYNC_asm

    jr    main_loop