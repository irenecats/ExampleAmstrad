;;
;;  ENTITY MANAGER
;;
.module Entity_Manager
.include "entity_manager.h.s"
.include "cpctelera.h.s"
_entity_size == 7
max_entities == 3

_num_entities::  .db 0
_last_entity_ptr::  .dw _entity_array 

DefineEntityArray  _entity_array, max_entities

;;  --- ENTITY MANAGER INITIALICER  ---
;;  Allows restarting the game
;;
;;  INPUT:  NONE
;;  DESTROYS:   AF, HL      
entity_man_init::
    xor     a, a                    ;;reset A 
    ld      (_num_entities),a       ;;set number of entities to 0

    ld      hl, #_entity_array      ;;
    ld      (_last_entity_ptr), hl  ;;set the pointer to the fist position
ret

;;  --- ENITITY MANAGER NEW ---
;;  Creates new entity without values and updates _num_entities and _last_entity_ptr
;;  INPUT: NONE
;;  DESTROYS:   HL, DE, BC, F
;;  RETURNS:
;;          HL -> last entity pointer
;;          BC -> enitity size
entity_man_new::
    ld hl,#_num_entities
    inc (hl)                    ;;Increases num_enitities value

    ld hl, (_last_entity_ptr)   ;;HL = last entity mem. position
    ld d, h                     ;;DE register points to new entitys beginning 
    ld e, l                     ;;We cannot exchange DE and HL values because HL is needed later

    ld bc, #_entity_size        ;;BC = enitity size
    add hl, bc                  ;;
    ld (_last_entity_ptr), hl   ;;Updates _last_entity_ptr

ret

;;  --- ENTITY MANAGER CREATE
;;  INPUT: NONE
;;  DESTROYS:   HL, DE, BC, F
;;  RETURNS:
;;          HL -> last entity pointer
;;          BC -> enitity size  
entity_man_create::

    push    hl                  ;;Saves HL
    call    entity_man_new

    ld__ixh_d                  ;;loads D in IX FIRTST 8 bytes   [Non documented]
    ld__ixl_e                   ;;loads E in IX LASTS 8 bytes    [Non documented]
   
    pop     hl
    ldir   
ret
;;Getters
;;  Returns:
;;          IX -> Pointer to entity array 
;;           A -> Total entities
entity_man_getArray::
    ld ix, #_entity_array
    ld a, (_num_entities)
ret

