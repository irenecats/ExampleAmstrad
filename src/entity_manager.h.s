;;
;;  ENTITYMANAGER
;;

;; GLOBAL FUNCTIONS
.globl entity_man_init
.globl entity_man_new
.globl entity_man_create
.globl entity_man_getArray

;;  GLOBAL CONSTANTS
.globl _entity_size

;;
.macro DefineEntityAnnonimous  _x, _y, _vx, _vy, _w, _h, _color 
   .db _x
   .db _y
   .db _w
   .db _h
   .db _vx
   .db _vy   
   .db _color
.endm

.macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _color
_name::
   DefineEntityAnnonimous _x, _y, _vx, _vy, _w, _h, _color
.endm
e_x = 0
e_y = 1
e_vx = 2
e_vy = 3
e_w = 4
e_h = 5
e_c = 6
e_sizeof =7

.macro DefineEntityArray _name,_N
_name::
   .rept _N
      DefineEntityAnnonimous 0xDE, 0xAD, 0xDE, 0xAD, 0xDE, 0xAD, 0xAA
   .endm
.endm