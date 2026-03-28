package render

import "vendor:sdl3/ttf"
import "core:strings"
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
	state.font = ttf.OpenFont( cStr , size ) //-1 for default size

}
getTextEngine :: proc(state: ^FontState) -> ^ttf.TextEngine{
	return ttf.CreateRendererTextEngine(state.sdlRenderer)
}
