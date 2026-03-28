package platform
import sdl "vendor:sdl3"
import "core:fmt"

initWindow :: proc() ->(	eWindow: ^sdl.Window,
					eRenderer: ^sdl.Renderer, ok: bool){
	result:= sdl.CreateWindowAndRenderer(
		"Flux Editor",
		1200,
		800,
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
