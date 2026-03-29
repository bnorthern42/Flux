package render

import "vendor:sdl3/ttf"
import "core:strings"
import "core:mem"
import "core:c"
import "core:fmt"
import sdl "vendor:sdl3"

FontState :: struct{
	sdlRenderer: ^sdl.Renderer,
	font: ^ttf.Font
}
//init the wrapper
initFont :: proc(sdlRenderer: ^sdl.Renderer) -> FontState{
	return FontState{
		sdlRenderer = sdlRenderer,
	}
}
setFontFile :: proc(fileName: string, size: f32, state: ^FontState){
	cStr:= strings.clone_to_cstring(fileName, context.temp_allocator)
	state.font = ttf.OpenFont( cStr , size )
}
getTextEngine :: proc(state: ^FontState) -> ^ttf.TextEngine{
	return ttf.CreateRendererTextEngine(state.sdlRenderer)
}
drawText :: proc(state: ^FontState, text: string, x, y: f32) {
    if len(text) == 0 {
        fmt.println("text empty")
        return
    }

    color := sdl.Color{255, 255, 255, 255}

    cstr := strings.clone_to_cstring(text, context.temp_allocator)
    defer mem.free(rawptr(cstr), context.temp_allocator)

    surface := ttf.RenderText_Blended(
        state.font,
        cstr,
        c.size_t(len(text)),
        color,
    )

    defer sdl.DestroySurface(surface)

    texture := sdl.CreateTextureFromSurface(state.sdlRenderer, surface)

    defer sdl.DestroyTexture(texture)

    rect := sdl.FRect{x, y, f32(surface.w), f32(surface.h)}

    sdl.RenderTexture(state.sdlRenderer, texture, nil, &rect)
}
