ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



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
