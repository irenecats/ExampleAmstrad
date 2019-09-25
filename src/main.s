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
.include "cpctelera_functions.h.s"
.include "entity_manager.h.s"
.include "render_system.h.s"

;;
;; Start of _DATA area 
;;  SDCC requires at least _DATA and _CODE areas to be declared, but you may use
;;  any one of them for any purpose. Usually, compiler puts _DATA area contents
;;  right after _CODE area contents.
;;
.area _DATA
.area _CODE
;;

;player: .db 0, 20, 2, 8, 1, 1, #0xf0
;enemy: .db  40, 80, 3, 12, -1, 0, #0xff




;;
;; MAIN function. This is the entry point of the application.
;;    _main:: global symbol is required for correctly compiling and linking
;;


_main::
   ;; Disable firmware to prevent it from interfering with string drawing
   call cpct_disableFirmware_asm
   
   call rendersys_init

   ld    hl, #player
   call entityman_create
   ;
   ld    hl, #enemy
   call entityman_create
   ;;;accedo a las variables mediante getters
   call entityman_getEntityArray_IX
   call entityman_getNumEntities_A
;
   call rendersys_update
loop:
jr loop
;loop:
;   ;; Calculate a video-memory location for printing a string
;   ld    de, #0xc000 ;; DE = Pointer to start of the screen
;   ld    hl, #7
;   ld    b, (hl)
;   inc   (hl)
;   inc   hl
;   ld    c, (hl)
;   inc   (hl)
;   call cpct_getScreenPtr_asm    ;; Calculate video memory location and return it in HL
;   
;   ex    de,hl
;   ld    a,#0xff
;   ld    bc,#0x0804
;  call cpct_drawSolidBox_asm
;   halt
;   halt
; ;; Loop forever
;   call cpct_waitVSYNC_asm
;   jr    loop