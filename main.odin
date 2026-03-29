package main

import "vendor:sdl3/ttf"
import "core:fmt"
import "core:os"
import "core:time"
import sdl "vendor:sdl3"
import v "utils"
import pform "platform"
import render "render"
import cflux "coreflux"

main :: proc() {
	if !sdl.Init({sdl.InitFlags.VIDEO}) {
		return
	}
	defer sdl.Quit()
	editorWindow, editorRenderer, ok:=pform.initWindow(800, 700)
	if !ok {
		return
	}
	defer sdl.DestroyRenderer(editorRenderer)
	defer sdl.DestroyWindow(editorWindow)
	renderState := render.init(editorRenderer)

	running := true
	vec:= v.Vec2(1.0, 1.0)
	ttf.Init()
	fontSt:= render.initFont(editorRenderer)
	render.setFontFile("assets/DejaVuSansMono.ttf",16, &fontSt)
	textEngine:= render.getTextEngine(&fontSt)
	editor := cflux.initEditor()
	cflux.openFileInView(&editor, "main.odin", 0)
	for running {
		event: sdl.Event

		for sdl.PollEvent(&event) {
			if event.type == sdl.EventType.QUIT {
				running = false
			}
		}


		render.clear(&renderState)
		render.setColor(&renderState, 0, 0, 0, 255)
	   	render.drawRect(&renderState, 100, 100, 10, 20)
		//render.drawText(&fontSt, "I'm a text viewer now", 200, 100)
		render.renderEditor(&renderState, &fontSt,&editor)
	    render.present(&renderState)
		free_all(context.temp_allocator)
	}
	defer ttf.Quit()
}
