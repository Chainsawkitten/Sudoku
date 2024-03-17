extends ColorRect

var time = 0
const min : float = 0.1
const max : float = 0.3
const speed : float = 2.0

func _process(delta):
	time += delta
	color.a = min + (0.5 + 0.5 * sin(time * speed)) * (max - min)
