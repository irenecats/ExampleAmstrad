ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;
                              2 ;;  ENTITY MANAGER
                              3 ;;
                              4 
                     0007     5 entity_size == 7
                     0003     6 max_entities == 3
                              7 
   4000 00                    8 _num_entities::  .db 0
   4001 03 40                 9 _last_elem_ptr::  .dw _entity_array 
   4003                      10 _entity_array:: 
   4003                      11     .ds entity_size*max_entities
                             12 
                             13 ;;INPUT
                             14 ;;      HL: Pointer to entity intializer
   4018                      15 entityman_create::
   4018 ED 5B 01 40   [20]   16     ld  de, (_last_elem_ptr)
   401C 01 07 00      [10]   17     ld  bc, #entity_size
   401F ED B0         [21]   18     ldir
                             19 
   4021 3A 00 40      [13]   20     ld  a, (_num_entities)
   4024 3C            [ 4]   21     inc a
   4025 32 00 40      [13]   22     ld (_num_entities), a
                             23 
   4028 2A 01 40      [16]   24     ld hl, (_last_elem_ptr)
   402B 01 07 00      [10]   25     ld bc, #entity_size
   402E 09            [11]   26     add hl, bc
   402F 22 01 40      [16]   27     ld (_last_elem_ptr), hl
   4032 C9            [10]   28 ret
                             29 ;;Getters
   4033                      30 entityman_getEntityArray_IX::
   4033 DD 21 03 40   [14]   31     ld ix, #_entity_array
   4037 C9            [10]   32 ret
                             33 
   4038                      34 entityman_getNumEntities_A::
   4038 3A 00 40      [13]   35     ld a, (_num_entities)
   403B C9            [10]   36 ret
