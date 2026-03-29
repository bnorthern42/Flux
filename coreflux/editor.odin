package coreflux

View :: struct {
	buffer: ^Buffer,
	x,y: f32,
	w,h: f32,
	cursor: ^Cursor,
	scroll: int,

}
Editor :: struct {
	buffers: map[string]^Buffer,
	views: []View,
	activeView: int,
	//for Splits later
//	layout: ^Node,
}
initEditor :: proc() -> Editor {
    return Editor{
        buffers = make(map[string]^Buffer),
        views = make([]View, 1), // Initialize with 1 empty view so we don't index out of bounds later
        activeView = 0,
    }
}
openFileInView :: proc(e: ^Editor, path: string, viewIndex: int) {
    buf := getOrCreateBuffer(e, path)
    e.views[viewIndex].buffer = buf
}
currentView :: proc(e: ^Editor) -> ^View {
    return &e.views[e.activeView]
}
handleInput :: proc(e: ^Editor, input: rune) {
    view := currentView(e)
    buf  := view.buffer

    // insert into rope at cursor
    // update cursor
}
