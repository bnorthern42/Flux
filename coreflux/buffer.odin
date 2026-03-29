package coreflux

Buffer :: struct {
	id: int,
	data: []rune, //atm use simple unicode type array thing, TODO: mv to ropes
	cursor: int,
	scroll: int,
}
