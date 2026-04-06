package input

import sdl "vendor:sdl3"
import coreflux "../../coreflux"
import v "../../utils"

Mouse :: struct {
    pos: v.Vector2, // pixels
}

handleMouse :: proc(input: ^InputState, event: ^sdl.Event) {
    ed := input.editor

    switch event.type {
    case sdl.EventType.MOUSE_BUTTON_DOWN:
        setCursorFromMouse(ed, event.button.x, event.button.y)

    case sdl.EventType.MOUSE_MOTION:
        if event.motion.state & sdl.BUTTON_LMASK != 0 {
            updateSelection(ed, event.motion.x, event.motion.y)
        }
    }
}
