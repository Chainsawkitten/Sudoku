extends Node2D

var WinScreenScene = preload("res://WinScreen.tscn")
var ControlsScene = preload("res://Controls.tscn")
var RuleExplanationScene = preload("res://RuleExplanation.tscn")
var HintScene = preload("res://Hint.tscn")
var activePopup

func _ready():
	# Setup the sudoku.
	var givens = [0, 0, 0, 0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0, 0, 0, 0]
	
	var solution = [4, 7, 1, 8, 2, 5, 3, 6, 9,
			8, 2, 5, 3, 6, 9, 7, 1, 4,
			3, 6, 9, 7, 1, 4, 2, 5, 8,
			7, 1, 4, 2, 5, 8, 6, 9, 3,
			2, 5, 8, 6, 9, 3, 1, 4, 7,
			6, 9, 3, 1, 4, 7, 5, 8, 2,
			1, 4, 7, 5, 8, 2, 9, 3, 6,
			5, 8, 2, 9, 3, 6, 4, 7, 1,
			9, 3, 6, 4, 7, 1, 8, 2, 5]
	
	# Cages
	var cages = [
		[9, [Vector2i(9, 1)]],
		[9, [Vector2i(6, 2)]],
		[9, [Vector2i(3, 3)]],
		[9, [Vector2i(8, 4)]],
		[9, [Vector2i(5, 5)]],
		[9, [Vector2i(2, 6)]],
		[8, [Vector2i(8, 6)]],
		[7, [Vector2i(3, 7)]],
		[8, [Vector2i(5, 7)]],
		[9, [Vector2i(7, 7)]],
		[6, [Vector2i(9, 7)]],
		[8, [Vector2i(2, 8)]],
		[9, [Vector2i(4, 8)]],
		[6, [Vector2i(6, 8)]],
		[7, [Vector2i(8, 8)]],
		[9, [Vector2i(1, 9)]],
		[6, [Vector2i(3, 9)]],
		[7, [Vector2i(5, 9)]],
		[36, [Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1), Vector2i(4, 1), Vector2i(5, 1), Vector2i(6, 1), Vector2i(7, 1), Vector2i(8, 1)]],
		[30, [Vector2i(1, 4), Vector2i(2, 4), Vector2i(3, 4), Vector2i(1, 5), Vector2i(2, 5), Vector2i(3, 5), Vector2i(3, 6)]],
		[36, [Vector2i(4, 4), Vector2i(5, 4), Vector2i(6, 4), Vector2i(4, 5), Vector2i(6, 5), Vector2i(4, 6), Vector2i(5, 6), Vector2i(6, 6)]]
		]
	
	$Grid.setup_sudoku(givens, solution, cages, [], true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Show the win screen.
func show_win_screen():
	Global.paused = true
	$Fade.set_visible(true)
	activePopup = WinScreenScene.instantiate()
	activePopup.position = Vector2(320, 181)
	add_child(activePopup)
	
	# Show how long it took to beat
	var seconds = Time.get_ticks_msec() / 1000
	var minutes = seconds / 60
	seconds = seconds % 60
	var hours = minutes / 60
	minutes = minutes % 60
	var text = "Time: "
	if hours > 0:
		text += str(hours) + ":"
	text += "%02d:%02d" % [minutes, seconds]
	activePopup.get_node("Outer/Inner/Time").set_text(text)

func show_controls():
	Global.paused = true
	$Fade.set_visible(true)
	activePopup = ControlsScene.instantiate()
	activePopup.position = Vector2(320, 181)
	add_child(activePopup)

func show_rule_explanation(ruleState):
	Global.paused = true
	$Fade.set_visible(true)
	activePopup = RuleExplanationScene.instantiate()
	activePopup.position = Vector2(320, 181)
	add_child(activePopup)
	activePopup.setup(ruleState)

func show_hint(hints):
	Global.paused = true
	$Fade.set_visible(true)
	activePopup = HintScene.instantiate()
	activePopup.position = Vector2(320, 181)
	add_child(activePopup)
	activePopup.set_hint($Grid, hints)

# Destroy whatever the current popup is.
func hide_popup():
	Global.paused = false
	$Fade.set_visible(false)
	activePopup.queue_free()
