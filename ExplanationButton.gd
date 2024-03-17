extends ColorRect

var ruleState

func set_rule_state(ruleState):
	self.ruleState = ruleState

func _input(event):
	if Global.paused:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var relativePos = event.position - global_position
			if relativePos.x >= 0 and relativePos.y >= 0 and relativePos.x < size.x and relativePos.y < size.y:
				$/root/Game.show_rule_explanation(ruleState)
