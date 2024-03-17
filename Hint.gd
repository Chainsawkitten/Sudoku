extends Node2D

var pages = []
var currentPage = 0

func set_hint(otherGrid, hints):
	var grid = $Outer/Inner/Grid
	grid.set_from(otherGrid)
	
	# Check if the sudoku is finished.
	var finished = true
	for i in range(81):
		if grid.currentState.values[i] != grid.solution[i]:
			finished = false
			break
	
	if finished:
		$Outer/Inner/Message.set_text("It looks finished to me. I don't think you need any more hints.")
		return
	
	# Check for mistakes.
	var mistakes = []
	for i in range(81):
		if grid.currentState.values[i] != 0 and grid.currentState.values[i] != grid.solution[i]:
			mistakes.append(Vector2i(i % 9 + 1, i / 9 + 1))
	
	if mistakes.size() > 0:
		$Outer/Inner/Message.set_text("That doesn't look quite right to me.")
		grid.add_flashing_highlight(mistakes)
		return
	
	# Determine which manual hint to show.
	var hintIndex = 0
	for i in range(hints.size()):
		# Check if we've already achieved the outcome.
		var achieved = true
		for outcome in hints[i].outcome:
			var index = outcome.x - 1 + (outcome.y - 1) * 9
			if grid.currentState.values[index] != grid.solution[index]:
				achieved = false
				break
		if !achieved:
			break
		
		hintIndex += 1
	
	if hintIndex < hints.size():
		pages = hints[hintIndex].pages
		set_page(0)
	else:
		# Run out of hints?
		$Outer/Inner/Message.set_text("All looks well so far. You can do it! :)")

func set_page(index : int):
	currentPage = index
	$Outer/Inner/Message.set_text(pages[index].message)
	
	var grid = $Outer/Inner/Grid
	grid.reset_flashing_highlight()
	grid.add_flashing_highlight(pages[index].highlight)
	
	for i in range(81):
		grid.currentState.cornerValues[i] = 0
		grid.currentState.centerValues[i] = 0
	
	for corner in pages[index].corner:
		var ci = corner[0] - 1 + (corner[1] - 1) * 9
		grid.currentState.cornerValues[ci] |= 1 << (corner[2] - 1)
	
	for center in pages[index].center:
		var ci = center[0] - 1 + (center[1] - 1) * 9
		grid.currentState.centerValues[ci] |= 1 << (center[2] - 1)
	
	grid.update_grid()
	
	$Outer/Inner/PageLeft.set_visible(index > 0)
	$Outer/Inner/PageRight.set_visible(index < pages.size() - 1)

func turn_page(direction : int):
	set_page(currentPage + direction)
