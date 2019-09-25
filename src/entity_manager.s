;;
;;  ENTITY MANAGER
;;

entity_size == 7
max_entities == 3

_num_entities::  .db 0
_last_elem_ptr::  .dw _entity_array 
_entity_array:: 
    .ds entity_size*max_entities

;;INPUT
;;      HL: Pointer to entity intializer
entityman_create::
    ld  de, (_last_elem_ptr)
    ld  bc, #entity_size
    ldir

    ld  a, (_num_entities)
    inc a
    ld (_num_entities), a

    ld hl, (_last_elem_ptr)
    ld bc, #entity_size
    add hl, bc
    ld (_last_elem_ptr), hl
ret
;;Getters
entityman_getEntityArray_IX::
    ld ix, #_entity_array
ret

entityman_getNumEntities_A::
    ld a, (_num_entities)
ret