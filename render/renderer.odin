package render

import sdl "vendor:sdl3"

// We store the SDL renderer here, plus any future rendering state
// like loaded fonts, glyph caches, or theme colors.
Renderer_State :: struct {
    sdl_renderer: ^sdl.Renderer,
    // font: ^ttf.Font, // We'll need this later!
}

// Initialize our wrapper
init :: proc(sdl_renderer: ^sdl.Renderer) -> Renderer_State {
    return Renderer_State{
        sdl_renderer = sdl_renderer,
    }
}

// Wipes the screen fresh every frame
clear :: proc(state: ^Renderer_State) {
    // A nice, easy-on-the-eyes dark gray background
    sdl.SetRenderDrawColor(state.sdl_renderer, 30, 30, 30, 255)
    sdl.RenderClear(state.sdl_renderer)
}

// Draws a solid rectangle (perfect for drawing your cursor!)
draw_rect :: proc(state: ^Renderer_State, x, y, w, h: f32, r, g, b, a: u8) {
    sdl.SetRenderDrawColor(state.sdl_renderer, r, g, b, a)

    // SDL3 uses FRect (floats) for rendering
    rect := sdl.FRect{x, y, w, h}
    sdl.RenderFillRect(state.sdl_renderer, &rect)
}

// Swaps the backbuffer to the screen
present :: proc(state: ^Renderer_State) {
    sdl.RenderPresent(state.sdl_renderer)
}
