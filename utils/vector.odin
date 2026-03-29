package utils

/*
*
* 2D Vector and common Ops
*
*/
Vector2 :: struct {
	x:f64,
	y: f64,
}

Vec2:: proc(x: f64, y: f64) -> Vector2{
	return Vector2{x=x, y=y}
}
Vec2scalar::proc(x:f64) -> Vector2{
	return Vector2{x=x, y=x}
}
vecAdd :: proc(a,b: Vector2) -> Vector2{
	return Vector2{x= a.x + b.x, y= a.y + b.y}
}
vecSub :: proc(a,b: Vector2) -> Vector2{
	return Vector2{x= a.x - b.x, y= a.y - b.y}
}
vecMult :: proc(a,b: Vector2) -> Vector2{
	return Vector2{x= a.x * b.x, y= a.y * b.y}
}
vecDiv :: proc(a,b: Vector2) -> Vector2{
	return Vector2{x= a.x / b.x, y= a.y / b.y}
}
