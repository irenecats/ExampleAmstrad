ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;; includes
                              2 
                              3 .module gameManager
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              4 .include "entity_manager.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                              5 .include "render_system.h.s"
                              1 ;;
                              2 ;; RENDER SYSTEM
                              3 ;;
                              4 .globl render_sys_init
                              5 .globl render_sys_update
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                              6 
   4048                       7 ent1: DefineEntity player, 0, 20, 2, 8, 1, 1, #0xf0
   0000                       1 player::
   0000                       2    DefineEntityAnnonimous 0, 20, 2, 8, 1, 1, #0xf0
   4048 00                    1    .db 0
   4049 14                    2    .db 20
   404A 01                    3    .db 1
   404B 01                    4    .db 1
   404C 02                    5    .db 2
   404D 08                    6    .db 8   
   404E F0                    7    .db #0xf0
   404F                       8 ent2: DefineEntity enemy1, 0, 40, 80, 3, 12, -1, #0xff
   0007                       1 enemy1::
   0007                       2    DefineEntityAnnonimous 0, 40, 80, 3, 12, -1, #0xff
   404F 00                    1    .db 0
   4050 28                    2    .db 40
   4051 0C                    3    .db 12
   4052 FF                    4    .db -1
   4053 50                    5    .db 80
   4054 03                    6    .db 3   
   4055 FF                    7    .db #0xff
                              9 
   4056                      10 game_man_init::
                             11     ;;init managers
   4056 CD 18 40      [17]   12     call entity_man_init
                             13 
                             14     ;;init systems
   4059 CD 85 40      [17]   15     call render_sys_init
                             16     ;call physic_sys_init
                             17     ;call inpunt_sys_init
                             18 
                             19     ;;init entities
   405C 21 48 40      [10]   20     ld hl, #ent1
   405F CD 34 40      [17]   21     call entity_man_create
   4062 21 4F 40      [10]   22     ld hl, #ent2
   4065 CD 34 40      [17]   23     call entity_man_create
   4068 C9            [10]   24 ret
   4069                      25 game_man_update::
   4069 CD 40 40      [17]   26     call entity_man_getArray
                             27     ;call input_sys_update
                             28     
                             29     ;call entity_man_getArray
                             30     ;call phisic_sys_update
                             31 
   406C C9            [10]   32 ret
   406D                      33 game_man_render::
   406D CD 40 40      [17]   34  call entity_man_getArray
   4070 CD 86 40      [17]   35  call render_sys_update
   4073 C9            [10]   36 ret
                             37 
                             38 
                             39 
                             40 
