extends Node2D

func setup(ruleState):
	$Outer/Inner/Grid.setup_sudoku(ruleState.givens, ruleState.givens, ruleState.cages, ruleState.dots, ruleState.hasFog)
	$Outer/Inner/Grid.add_flashing_highlight(ruleState.highlight)
	$Outer/Inner/Message.set_text(ruleState.explanation)
