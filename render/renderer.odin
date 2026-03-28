package render

import sdl "vendor:sdl3"

// We store the SDL renderer here, plus any future rendering state
// like loaded fonts, glyph caches, or theme colors.
RendererState :: struct {
    sdlRenderer: ^sdl.Renderer,
    // font: ^ttf.Font, // We'll need this later!
}

// Initialize our wrapper
init :: proc(sdlRenderer: ^sdl.Renderer) -> RendererState {
    return RendererState{
        sdlRenderer = sdlRenderer,
    }
}

// Wipes the screen fresh every frame
clear :: proc(state: ^RendererState) {
    // A nice, easy-on-the-eyes dark gray background
    sdl.SetRenderDrawColor(state.sdlRenderer, 30, 30, 30, 255)
    sdl.RenderClear(state.sdlRenderer)
}

// Draws a solid rectangle (perfect for drawing your cursor!)
draw_rect :: proc(state: ^RendererState, x, y, w, h: f32, r, g, b, a: u8) {
    sdl.SetRenderDrawColor(state.sdlRenderer, r, g, b, a)

    // SDL3 uses FRect (floats) for rendering
    rect := sdl.FRect{x, y, w, h}
    sdl.RenderFillRect(state.sdlRenderer, &rect)
}

// Swaps the backbuffer to the screen
present :: proc(state: ^RendererState) {
    sdl.RenderPresent(state.sdlRenderer)
}
