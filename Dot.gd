extends Node2D

func _draw():
	draw_circle(Vector2(0, 0), 4, Color(1, 1, 1))
	draw_arc(Vector2(0, 0), 4, 0, 2 * PI, 50, Color(0, 0, 0), 0.4, true)
