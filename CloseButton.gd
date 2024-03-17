extends ColorRect

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var relativePos = event.position - global_position
			if relativePos.x >= 0 and relativePos.y >= 0 and relativePos.x < size.x and relativePos.y < size.y:
				$/root/Game.hide_popup()
