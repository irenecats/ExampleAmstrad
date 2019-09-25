ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;
                              2 ;; RENDER SYSTEM
                              3 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              4 .include "cpctelera_functions.h.s"
                              1 ;;
                              2 ;;  CPCTELERA   FUNCTIONS
                              3 ;;
                              4 .globl cpct_disableFirmware_asm
                              5 .globl cpct_getScreenPtr_asm
                              6 .globl cpct_drawSolidBox_asm
                              7 .globl cpct_waitVSYNC_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                              5 .include "entity_manager.h.s"
                              1 ;;
                              2 ;;  ENTITYMANAGER
                              3 ;;
                              4 
                              5 ;; GLOBAL FUNCTIONS
                              6 .globl entityman_create
                              7 .globl entityman_getEntityArray_IX
                              8 .globl entityman_getNumEntities_A
                              9 
                             10 ;;  GLOBAL CONSTANTS
                             11 .globl entity_size
                             12 
                             13 ;;
                             14 
                             15 
                     0000    16 e_x = 0
                     0001    17 e_y = 1
                     0002    18 e_vx = 2
                     0003    19 e_vy = 3
                     0004    20 e_w = 4
                     0005    21 e_h = 5
                     0006    22 e_c = 6
                     0007    23 e_sizeof =7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                              6 
   4067                       7 rendersys_init::
                              8 
   4067 C9            [10]    9 ret
                             10 
                             11 ;;INPUT
                             12 ;;      IX: Pointer to fist element
                             13 ;;      A: Number of entities
   4068                      14 rendersys_update::
   4068                      15 _renloop:
   4068 F5            [11]   16     push af
                             17 
                             18     ;; Calculate a video-memory location for printing a string
   4069 11 00 C0      [10]   19     ld de, #0xc000
   406C DD 4E 00      [19]   20     ld c, e_x(ix)     ;;X
   406F DD 46 01      [19]   21     ld b, e_y(ix)     ;;Y
   4072 CD 51 41      [17]   22     call cpct_getScreenPtr_asm
                             23 
   4075 EB            [ 4]   24     ex de,hl
   4076 DD 7E 06      [19]   25     ld a, e_c(ix)     ;;Color
   4079 DD 4E 04      [19]   26     ld c, e_w(ix)     ;;Ancho
   407C DD 46 05      [19]   27     ld b, e_h(ix)     ;;Alto
   407F CD A4 40      [17]   28     call cpct_drawSolidBox_asm
                             29 
   4082 F1            [10]   30     pop af
   4083 3D            [ 4]   31     dec a
                             32 
   4084 C8            [11]   33     ret z
                             34 
   4085 01 07 00      [10]   35     ld bc, #entity_size
   4088 DD 09         [15]   36     add ix,bc
   408A 18 DC         [12]   37     jr _renloop
