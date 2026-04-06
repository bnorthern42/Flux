package input
import sdl "vendor:sdl3"
import coreflux "../../coreflux"
import v "../../utils"

InputState :: struct {
 	editor: ^coreflux.Editor,
	event: []sdl.Event,
	mousePos: v.Vector2,

}

//Dispatcher
handleEvent :: proc(input : ^InputState, event: ^sdl.Event){

	#partial switch event.type {
	case sdl.EventType.KEY_DOWN:
		       handleKey(input, &event.key)
	case sdl.EventType.TEXT_INPUT:
		        handleTextInput(input, &event.text)
	case sdl.EventType.MOUSE_BUTTON_DOWN,
		     sdl.EventType.MOUSE_MOTION:
		        handleMouse(input, event)
    }
}
