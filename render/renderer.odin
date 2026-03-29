package render

import sdl "vendor:sdl3"
import cflux "../coreflux"

RendererState :: struct {
    sdlRenderer: ^sdl.Renderer,
    currentColor: [4]u8,
}

// ---------- INIT ----------

init :: proc(sdlRenderer: ^sdl.Renderer) -> RendererState {
    return RendererState{
        sdlRenderer = sdlRenderer,
        currentColor = [4]u8{255, 255, 255, 255}, // safe default
    }
}

// ---------- FRAME ----------

clear :: proc(state: ^RendererState) {
    sdl.SetRenderDrawColor(state.sdlRenderer, 30, 30, 30, 255)
    sdl.RenderClear(state.sdlRenderer)

    // keep state in sync
    state.currentColor = [4]u8{30, 30, 30, 255}
}

present :: proc(state: ^RendererState) {
    sdl.RenderPresent(state.sdlRenderer)
}

// ---------- COLOR ----------

setColor :: proc(state: ^RendererState, r, g, b, a: u8) {
    newColor := [4]u8{r, g, b, a}

    if state.currentColor != newColor {
        sdl.SetRenderDrawColor(state.sdlRenderer, r, g, b, a)
        state.currentColor = newColor
    }
}

// ---------- DRAW ----------

drawRect :: proc(state: ^RendererState, x, y, w, h: f32) {
    rect := sdl.FRect{x, y, w, h}
    sdl.RenderFillRect(state.sdlRenderer, &rect)
}

// ---------- VIEW ----------

// assuming View comes from coreflux
renderView :: proc(state: ^RendererState, v: ^cflux.View) {
    // example styling
    setColor(state, 50, 50, 50, 255)
    drawRect(state, v.x, v.y, v.w, v.h)
}
setClip :: proc(state: ^RendererState, x, y, w, h: f32) {
	rect := sdl.Rect{
	    i32(x),
	    i32(y),
	    i32(w),
	    i32(h),
	}
    sdl.SetRenderClipRect(state.sdlRenderer, &rect)
}
snap :: proc(v: f32) -> f32 {
    return f32(int(v))
}
