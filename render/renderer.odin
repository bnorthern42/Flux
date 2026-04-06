package render

import sdl "vendor:sdl3"
import "core:unicode/utf8"
import "core:strings"
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


renderView :: proc(state: ^RendererState, fontState: ^FontState, v: ^cflux.View) {
    setColor(state, 50, 50, 50, 255)
    drawRect(state, v.x, v.y, v.w, v.h)

    if v.buffer == nil do return

    lineHeight: f32 = 18.0
    currentY: f32 = v.y
    startX: f32 = v.x + 5.0

    start_idx := 0
    buf_len := len(v.buffer.data)

    for i := 0; i <= buf_len; i += 1 {
        is_end := i == buf_len
        is_newline := !is_end && v.buffer.data[i] == '\n'

        if is_newline || is_end {
            line_runes := v.buffer.data[start_idx:i]

            if len(line_runes) > 0 {

                // -----------------------
                // Use a string builder on the temp allocator to dynamically
                // swap out unprintable characters just for the screen.
                builder := strings.builder_make(context.temp_allocator)

                for r in line_runes {
                    if r == '\t' {
                        // Expand tab to 4 spaces (or whatever your editor setting is)
                        strings.write_string(&builder, "    ")
                    } else if r != '\r' {
                        // Ignore Windows carriage returns, write everything else normally
                        strings.write_rune(&builder, r)
                    }
                }

                line_str := strings.to_string(builder)
                // -----------------------

                if len(line_str) > 0 {
                    drawText(fontState, line_str, startX, currentY)
                }
            }

            currentY += lineHeight
            start_idx = i + 1
        }
    }
}


renderEditor :: proc(state: ^RendererState, fontState: ^FontState, e: ^cflux.Editor) {
    for &view in e.views {
        renderView(state, fontState, &view)
    }
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
