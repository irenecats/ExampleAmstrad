ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;
                              2 ;; RENDER SYSTEM
                              3 ;;
                              4 .module render_system
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              5 .include "cpctelera_functions.h.s"
                              1 ;;
                              2 ;;  CPCTELERA   FUNCTIONS
                              3 ;;
                              4 .globl cpct_disableFirmware_asm
                              5 .globl cpct_getScreenPtr_asm
                              6 .globl cpct_drawSolidBox_asm
                              7 .globl cpct_waitVSYNC_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                              6 .include "entity_manager.h.s"
                              1 ;;
                              2 ;;  ENTITYMANAGER
                              3 ;;
                              4 
                              5 ;; GLOBAL FUNCTIONS
                              6 .globl entity_man_init
                              7 .globl entity_man_new
                              8 .globl entity_man_create
                              9 .globl entity_man_getArray
                             10 
                             11 ;;  GLOBAL CONSTANTS
                             12 .globl _entity_size
                             13 
                             14 ;;
                             15 .macro DefineEntityAnnonimous  _x, _y, _vx, _vy, _w, _h, _color 
                             16    .db _x
                             17    .db _y
                             18    .db _w
                             19    .db _h
                             20    .db _vx
                             21    .db _vy   
                             22    .db _color
                             23 .endm
                             24 
                             25 .macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _color
                             26 _name::
                             27    DefineEntityAnnonimous _x, _y, _vx, _vy, _w, _h, _color
                             28 .endm
                     0000    29 e_x = 0
                     0001    30 e_y = 1
                     0002    31 e_vx = 2
                     0003    32 e_vy = 3
                     0004    33 e_w = 4
                     0005    34 e_h = 5
                     0006    35 e_c = 6
                     0007    36 e_sizeof =7
                             37 
                             38 .macro DefineEntityArray _name,_N
                             39 _name::
                             40    .rept _N
                             41       DefineEntityAnnonimous 0xDE, 0xAD, 0xDE, 0xAD, 0xDE, 0xAD, 0xAA
                             42    .endm
                             43 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                              7 
   4085                       8 render_sys_init::
                              9 
   4085 C9            [10]   10 ret
                             11 
                             12 ;;INPUT
                             13 ;;      IX: Pointer to fist element
                             14 ;;      A: Number of entities
   4086                      15 render_sys_update::
   4086                      16 _renloop:
   4086 F5            [11]   17     push af
                             18 
                             19     ;; Calculate a video-memory location for printing a string
   4087 11 00 C0      [10]   20     ld de, #0xc000
   408A DD 4E 00      [19]   21     ld c, e_x(ix)     ;;X
   408D DD 46 01      [19]   22     ld b, e_y(ix)     ;;Y
   4090 CD 6F 41      [17]   23     call cpct_getScreenPtr_asm
                             24 
   4093 EB            [ 4]   25     ex de,hl
   4094 DD 7E 06      [19]   26     ld a, e_c(ix)     ;;Color
   4097 DD 4E 04      [19]   27     ld c, e_w(ix)     ;;Ancho
   409A DD 46 05      [19]   28     ld b, e_h(ix)     ;;Alto
   409D CD C2 40      [17]   29     call cpct_drawSolidBox_asm
                             30 
   40A0 F1            [10]   31     pop af
   40A1 3D            [ 4]   32     dec a
                             33 
   40A2 C8            [11]   34     ret z
                             35 
   40A3 01 07 00      [10]   36     ld bc, #_entity_size
   40A6 DD 09         [15]   37     add ix,bc
   40A8 18 DC         [12]   38     jr _renloop
