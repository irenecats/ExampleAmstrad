;;
;;  ENTITYMANAGER
;;

;; GLOBAL FUNCTIONS
.globl entityman_create
.globl entityman_getEntityArray_IX
.globl entityman_getNumEntities_A

;;  GLOBAL CONSTANTS
.globl entity_size

;;
.macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _color
_name::
   .db _x
   .db _y
   .db _w
   .db _h
   .db _vx
   .db _vy   
   .db _color
.endm
DefineEntity player, 0, 20, 2, 8, 1, 1, #0xf0
DefineEntity enemy, 40, 80, 3, 12, -1, 0, #0xff

e_x = 0
e_y = 1
e_vx = 2
e_vy = 3
e_w = 4
e_h = 5
e_c = 6
e_sizeof =7