package utils

import sdl "vendor:sdl3"
import "core:fmt"
import "core:os"

//Check PTR
scp :: proc($T: typeid, ptr: ^T) -> ^T{

	if ptr == nil{
		fmt.eprintln("SDL ERROR", sdl.GetError())
		os.exit(1)
	}
	return ptr
}
