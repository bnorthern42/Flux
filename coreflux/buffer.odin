package coreflux

import "core:unicode/utf8"
import "core:sync"
import "core:os"


getIncrementID :: proc(bf: ^Buffer) -> int{
	return sync.atomic_add(&bf.id,1)
}

Buffer :: struct {
	id : int,
	data: []rune, //atm use simple unicode type array thing, TODO: mv to ropes
	fileName: string,

}
bytesToRune :: proc(bytes: []byte) -> []rune {
	runes, _ := make([dynamic]rune, 0, len(bytes))
	i:=0
	for i < len(bytes){
		r, size := utf8.decode_rune(bytes[i:])
		append(&runes, r)
		i+= size
	}
	return runes[:]
}

getOrCreateBuffer :: proc(ed: ^Editor, path: string) -> ^Buffer{
	if buf, ok := ed.buffers[path]; ok{
		return buf
	}
	buf:= new(Buffer)
	buf.id = getIncrementID(buf)
	buf.fileName = path
	ed.buffers[path] = buf
	data, _:= os.read_entire_file_from_path(path,context.temp_allocator)
	buf.data = bytesToRune(data)
	return buf
}
insertText :: proc(bf: ^Buffer, pos: int, text: []rune){
	//TODO: implement
}

deleteText :: proc(bf: ^Buffer, pos: int, len: int){
	//TODO: implement
}



RopeNode :: struct {
	left: ^RopeNode,
	right: ^RopeNode,
	parent: ^RopeNode,
	row: int,
	data: string,
	size: int,
}
Rope :: struct{
	root: ^RopeNode,
	size: int,
}
