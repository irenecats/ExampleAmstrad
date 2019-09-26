;; includes

.module gameManager
.include "entity_manager.h.s"
.include "render_system.h.s"

ent1: DefineEntity player, 0, 20, 2, 8, 1, 1, #0xf0
ent2: DefineEntity enemy1, 0, 40, 80, 3, 12, -1, #0xff

game_man_init::
    ;;init managers
    call entity_man_init

    ;;init systems
    call render_sys_init
    ;call physic_sys_init
    ;call inpunt_sys_init

    ;;init entities
    ld hl, #ent1
    call entity_man_create
    ld hl, #ent2
    call entity_man_create
ret
game_man_update::
    call entity_man_getArray
    ;call input_sys_update
    
    ;call entity_man_getArray
    ;call phisic_sys_update

ret
game_man_render::
 call entity_man_getArray
 call render_sys_update
ret




