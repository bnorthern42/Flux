package platform
import sdl "vendor:sdl3"
import "core:fmt"

EditorName :: "Flux Editor"

initWindow :: proc(width, height: i32) ->(	eWindow: ^sdl.Window,
					eRenderer: ^sdl.Renderer, ok: bool){
	result:= sdl.CreateWindowAndRenderer(
		EditorName,
		width,
		height,
		{sdl.WindowFlags.OPENGL},
		&eWindow,
		&eRenderer,
	)
	if !result{
		fmt.eprintf("Failed to create SDL3 window/renderer: %s\n", sdl.GetError())
        return nil, nil, false
	}
	return eWindow, eRenderer, true
}
