package main

import "core:fmt"
import "core:os"
import "core:time"
import sdl "vendor:sdl3"


main :: proc() {
	if !sdl.Init({sdl.InitFlags.VIDEO}) {
		return
	}
	defer sdl.Quit()
	editorWindow: ^sdl.Window
	editorRenderer: ^sdl.Renderer
	sdl.CreateWindowAndRenderer(
		"Flux Editor",
		1200,
		800,
		{sdl.WindowFlags.OPENGL},
		&editorWindow,
		&editorRenderer,
	)
	running := true

	for running {
		event: sdl.Event

		for sdl.PollEvent(&event) {
			if event.type == sdl.EventType.QUIT {
				running = false
			}
		}

		sdl.SetRenderDrawColor(editorRenderer, 30, 30, 30, 255)
		sdl.RenderClear(editorRenderer)
		sdl.RenderPresent(editorRenderer)
	}
}
