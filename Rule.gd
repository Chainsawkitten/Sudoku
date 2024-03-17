extends Node2D

class RuleState:
	var givens = [0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0]
	var cages = []
	var explanation : String
	var hasFog = false
	var highlight = []
	var dots = []

func set_rule(rule):
	if rule == "sudoku":
		$RuleTitle.set_text("Sudoku")
		$RuleDescription.set_text("Normal sudoku rules apply.")
	elif rule == "fog":
		$RuleTitle.set_text("Fog of War")
		$RuleDescription.set_text("The grid is covered in fog. Placing correct digits reveals more of the grid.")
	elif rule == "tabula_rasa":
		$RuleTitle.set_text("Tabula Rasa")
		$RuleDescription.set_text("No cell must correctly show the number of nines prior in the grid (to the left in the same row and anywhere in rows above).")
	elif rule == "anti_knight":
		$RuleTitle.set_text("Anti-Knight")
		$RuleDescription.set_text("No two cells a knight's move apart can contain the same digit.")
	elif rule == "anti_king":
		$RuleTitle.set_text("Anti-King")
		$RuleDescription.set_text("No two cells a king's move apart can contain the same digit.")
	elif rule == "killer":
		$RuleTitle.set_text("Killer")
		$RuleDescription.set_text("Digits can not repeat within a cage and must sum to the total given.")
	elif rule == "consecutive_pairs":
		$RuleTitle.set_text("Consecutive Pairs")
		$RuleDescription.set_text("All adjacent cells which are consecutive in value have been marked with circles.")
	else:
		assert(false)
	
	var font = $RuleTitle.get_theme_default_font()
	var titleWidth = font.get_string_size($RuleTitle.text, 0, -1, $RuleTitle.label_settings.font_size).x
	$ExplanationButton.position = Vector2(titleWidth + 2, 0)
	setup_explanation(rule)

func setup_explanation(rule):
	var ruleState = RuleState.new()
	var delete = false
	
	if rule == "sudoku":
		ruleState.givens[3 * 9 + 3] = 5
		# Highlight the row, column and box.
		ruleState.highlight = [Vector2i(1, 4), Vector2i(2, 4), Vector2i(3, 4), Vector2i(5, 4), Vector2i(6, 4), Vector2i(7, 4), Vector2i(8, 4), Vector2i(9, 4),
			Vector2i(4, 1), Vector2i(4, 2), Vector2i(4, 3), Vector2i(4, 5), Vector2i(4, 6), Vector2i(4, 7), Vector2i(4, 8), Vector2i(4, 9),
			Vector2i(5, 5), Vector2i(6, 5), Vector2i(5, 6), Vector2i(6, 6)]
		ruleState.explanation = "Digits must not repeat within a row, column or box. There must be no other 5 in the highlighted cells."
	elif rule == "fog":
		ruleState.hasFog = true
		ruleState.givens[2 * 9 + 7] = 5
		ruleState.givens[8 * 9 + 0] = 1
		ruleState.explanation = "Cells adjacent to a correct digit are revealed."
	elif rule == "tabula_rasa":
		ruleState.givens[2 * 9 + 4] = 2
		ruleState.highlight = [Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1), Vector2i(4, 1), Vector2i(5, 1), Vector2i(6, 1), Vector2i(7, 1), Vector2i(8, 1), Vector2i(9, 1),
			Vector2i(1, 2), Vector2i(2, 2), Vector2i(3, 2), Vector2i(4, 2), Vector2i(5, 2), Vector2i(6, 2), Vector2i(7, 2), Vector2i(8, 2), Vector2i(9, 2),
			Vector2i(1, 3), Vector2i(2, 3), Vector2i(3, 3), Vector2i(4, 3)]
		ruleState.explanation = "The 2 in R3C5 sees the highlighted cells. Those cells must not contain a total of 2 nines."
	elif rule == "anti_knight":
		ruleState.givens[4 * 9 + 4] = 5
		ruleState.highlight = [Vector2i(4, 3), Vector2i(3, 4), Vector2i(6, 3), Vector2i(7, 4), Vector2i(3, 6), Vector2i(7, 6), Vector2i(4, 7), Vector2i(6, 7)]
		ruleState.explanation = "Because of the 5 in R5C5, there must be no 5 in the highlighted cells, as they are a knight's move away."
	elif rule == "anti_king":
		ruleState.givens[3 * 9 + 3] = 5
		ruleState.highlight = [Vector2i(3, 3), Vector2i(4, 3), Vector2i(5, 3), Vector2i(3, 4), Vector2i(5, 4), Vector2i(3, 5), Vector2i(4, 5), Vector2i(5, 5)]
		ruleState.explanation = "Because of the 5 in R4C4, there must be no 5 in the highlighted cells, as they are a king's move away."
	elif rule == "killer":
		ruleState.givens[3 * 9 + 2] = 4
		ruleState.givens[3 * 9 + 3] = 1
		ruleState.givens[4 * 9 + 3] = 6
		ruleState.givens[4 * 9 + 4] = 2
		ruleState.cages = [[13, [Vector2i(3, 4), Vector2i(4, 4), Vector2i(4, 5), Vector2i(5, 5)]]]
		ruleState.explanation = "The cage is valid because no digits are repeating in the cage and 1+2+4+6=13."
	elif rule == "consecutive_pairs":
		ruleState.givens[3 * 9 + 3] = 4
		ruleState.givens[3 * 9 + 4] = 5
		ruleState.givens[6 * 9 + 3] = 2
		ruleState.givens[6 * 9 + 4] = 6
		ruleState.dots = [[Vector2i(4, 4), Vector2i(5, 4)]]
		ruleState.explanation = "If there is a dot between two cells, they must be consecutive in value. If there is no dot between two cells, they must not be consecutive in value."
	else:
		print("No explanation for the rule " + rule + ". Deleting explanation button.")
		delete = true
	
	if delete:
		$ExplanationButton.queue_free()
	else:
		$ExplanationButton.set_rule_state(ruleState)

func get_height():
	return $RuleDescription.position.y + $RuleDescription.get_line_count() * $RuleDescription.get_line_height()

