package coreflux

NodeType :: enum {LEAF, SPLIT}

Node :: struct {
	nType: NodeType,
	splitVertical: bool,
	ratio: f32,

	left, right: ^Node,
	view: ^View
}
