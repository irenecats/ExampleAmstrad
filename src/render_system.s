;;
;; RENDER SYSTEM
;;
.include "cpctelera_functions.h.s"
.include "entity_manager.h.s"

rendersys_init::

ret

;;INPUT
;;      IX: Pointer to fist element
;;      A: Number of entities
rendersys_update::
_renloop:
    push af

    ;; Calculate a video-memory location for printing a string
    ld de, #0xc000
    ld c, e_x(ix)     ;;X
    ld b, e_y(ix)     ;;Y
    call cpct_getScreenPtr_asm

    ex de,hl
    ld a, e_c(ix)     ;;Color
    ld c, e_w(ix)     ;;Ancho
    ld b, e_h(ix)     ;;Alto
    call cpct_drawSolidBox_asm

    pop af
    dec a

    ret z

    ld bc, #entity_size
    add ix,bc
    jr _renloop
