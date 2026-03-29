package coreflux

CursorType :: enum {BAR, BLOCK}

Cursor :: struct {
	id: int,
	posRow: i32,
	posCol: i32,
	shape : CursorType,
}

BarCursor :: proc() ->Cursor{
	return Cursor{
		shape = CursorType.BAR,
	}
}
BlockCursor :: proc() -> Cursor{
	return Cursor{
		shape = CursorType.BLOCK,

	}
}
SetPos :: proc(row, col: i32, c: ^Cursor){
	c.posCol = col
	c.posRow = row

}
