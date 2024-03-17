extends ColorRect

var rule = preload("res://Rule.tscn")
var rulePosition : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_rule("sudoku")
	add_rule("fog")
	add_rule("tabula_rasa")
	add_rule("anti_knight")
	add_rule("anti_king")
	add_rule("killer")
	add_rule("consecutive_pairs")

func add_rule(ruleName : String):
	var node = rule.instantiate()
	add_child(node)
	node.set_rule(ruleName)
	node.set_position(Vector2(2, rulePosition))
	rulePosition += node.get_height()
