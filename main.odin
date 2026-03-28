package main

import "vendor:sdl3/ttf"
import "core:fmt"
import "core:os"
import "core:time"
import sdl "vendor:sdl3"
import v "utils"
import pform "platform"
import render "render"

main :: proc() {
	if !sdl.Init({sdl.InitFlags.VIDEO}) {
		return
	}
	defer sdl.Quit()
	editorWindow, editorRenderer, ok:=pform.initWindow()
	if !ok {
		return
	}
	defer sdl.DestroyRenderer(editorRenderer)
	defer sdl.DestroyWindow(editorWindow)
	render_state := render.init(editorRenderer)

	running := true
	vec:= v.Vec2(1.0, 1.0)
	for running {
		event: sdl.Event

		for sdl.PollEvent(&event) {
			if event.type == sdl.EventType.QUIT {
				running = false
			}
		}

		editorFont:= ttf.OpenFont("assets/SUSEMono[wght].ttf",16)
		textEngine:= ttf.CreateRendererTextEngine(editorRenderer)
		render.clear(&render_state)

	    // Draw a white cursor block as a test (x: 100, y: 100, width: 10, height: 20)
	    render.draw_rect(&render_state, 100, 100, 10, 20, 255, 255, 255, 255)

	    render.present(&render_state)
	}
}
