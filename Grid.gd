extends Node2D

var CellScene = preload("res://Cell.tscn")
var cells = []

var LineScene = preload("res://Line.tscn")

var CageScene = preload("res://KillerCage.tscn")
var DotScene = preload("res://Dot.tscn")

var HighlightScene = preload("res://Highlight.tscn")

# Grid state
class State:
	var values = []
	var centerValues = []
	var cornerValues = []
	
	func duplicate():
		var copy = State.new()
		
		copy.values = values.duplicate()
		copy.centerValues = centerValues.duplicate()
		copy.cornerValues = cornerValues.duplicate()
		
		return copy

var currentState : State
var history = []
var currentHistory : int = -1

var solution = []

# Selection
var selected = []
var lastSelection : int = 0
const size : int = 40

# Keyboard controls
var mouseDown : bool = false
var shiftDown : bool = false
var ctrlDown : bool = false

var hasFog = true
var cagesCopy = []
var dotsCopy = []
var flashingHighlights = []

func setup_common():
	# Set initial state of the grid.
	currentState = State.new()
	
	currentState.values.resize(81)
	currentState.values.fill(0)
	
	currentState.centerValues.resize(81)
	currentState.centerValues.fill(0)
	
	currentState.cornerValues.resize(81)
	currentState.cornerValues.fill(0)
	
	selected.resize(81)
	selected.fill(false)
	
	# Spawn the grid of cells.
	cells.resize(81)
	for y in range(9):
		for x in range(9):
			var cell = CellScene.instantiate()
			add_child(cell)
			cell.position = Vector2(x * size, y * size)
			cells[y * 9 + x] = cell
	
	# Add horizontal lines.
	for y in range(10):
		var line = LineScene.instantiate()
		add_child(line)
		line.position = Vector2(-1, y * size)
		line.points[1].x = 9 * size + 2
		# Make box lines wider.
		if y % 3 == 0:
			line.width = 3
	
	# Add vertical lines
	for x in range(10):
		var line = LineScene.instantiate()
		add_child(line)
		line.position = Vector2(x * size, -1)
		line.points[1].x = 0
		line.points[1].y = 9 * size + 2
		# Make box lines wider.
		if x % 3 == 0:
			line.width = 3

func setup_sudoku(givens, solution, cages, dots, hasFog):
	setup_common()
	
	currentState.values = givens
	
	self.solution = solution
	
	# Cages
	cagesCopy = cages
	for cage in cages:
		add_cage(cage[0], cage[1])
	
	# Dots
	dotsCopy = dots
	for dot in dots:
		add_dot(dot)
	
	self.hasFog = hasFog
	
	for y in range(9):
		for x in range(9):
			cells[y * 9 + x].set_given_value(currentState.values[y * 9 + x])
	
	save_state()
	update_grid()

# Copy state from a different grid.
func set_from(other):
	setup_common()
	
	currentState.values = other.currentState.values.duplicate()
	solution = other.solution
	
	for cage in other.cagesCopy:
		add_cage(cage[0], cage[1])
	
	for dot in other.dotsCopy:
		add_dot(dot)
	
	hasFog = other.hasFog
	
	# TODO Properly set given values.
	for y in range(9):
		for x in range(9):
			cells[y * 9 + x].set_given_value(0)
	
	update_grid()

func add_cage(total, cells):
	var cage = CageScene.instantiate()
	add_child(cage)
	cage.setup(size, total, cells)

func add_dot(dot):
	var node = DotScene.instantiate()
	add_child(node)
	if dot[0].x == dot[1].x:
		node.position = Vector2(dot[0].x - 0.5, (dot[0].y + dot[1].y) / 2) * size
	else:
		assert(dot[0].y == dot[1].y)
		node.position = Vector2((dot[0].x + dot[1].x) / 2, dot[0].y - 0.5) * size

# Add a cell to the selection.
func select_cell(mousePosition : Vector2i):
	var cellPosition = mousePosition / size
	if cellPosition.x >= 0 && cellPosition.x < 9 && cellPosition.y >= 0 && cellPosition.y < 9:
		var cellIndex = cellPosition.y * 9 + cellPosition.x
		selected[cellIndex] = true
		lastSelection = cellIndex
	
	highlight()

# Get the neighbor of a cell.
func get_relative_cell(index : int, relative : Vector2i):
	var pos = Vector2i(index % 9, index / 9)
	pos += relative
	if pos.x < 0 or pos.y < 0 or pos.x >= 9 or pos.y >= 9:
		return -1
	
	return pos.x + pos.y * 9

# Check if a cell's neighbor is selected.
func is_selected(index : int, relative : Vector2i):
	var newIndex = get_relative_cell(index, relative)
	if newIndex < 0:
		return false
	
	return selected[newIndex]

# Highlight all the selected cells.
func highlight():
	var localRegion = PackedByteArray()
	localRegion.resize(5)
	
	for i in range(81):
		# Determine the local region.
		localRegion[0] = int(is_selected(i, Vector2i(0, -1)))
		localRegion[1] = int(is_selected(i, Vector2i(-1, 0)))
		localRegion[2] = int(selected[i])
		localRegion[3] = int(is_selected(i, Vector2i(1, 0)))
		localRegion[4] = int(is_selected(i, Vector2i(0, 1)))
		
		cells[i].set_selection(localRegion)

# Set the user value of all selected cells.
func set_selected_cells(value : int):
	for i in range(81):
		if selected[i] and cells[i].get_given_value() == 0:
			if value == 0:
				currentState.values[i] = 0
				currentState.centerValues[i] = 0
				currentState.cornerValues[i] = 0
			else:
				if ctrlDown:
					# Ctrl means setting the center.
					if currentState.values[i] == 0:
						currentState.centerValues[i] ^= (1 << (value - 1))
				elif shiftDown:
					# Shift means setting the corner.
					if currentState.values[i] == 0:
						currentState.cornerValues[i] ^= (1 << (value - 1))
				else:
					# Otherwise set the main value.
					currentState.values[i] = value
					currentState.centerValues[i] = 0
					currentState.cornerValues[i] = 0
	
	update_grid()
	save_state()
	check_complete()

# Update the visual display of the grid.
func update_grid():
	for i in range(81):
		if cells[i].get_given_value() == 0:
			cells[i].set_state(currentState.values[i], currentState.centerValues[i], currentState.cornerValues[i])
		
		cells[i].set_fog(!hasFog)
	
	# Reveal fog
	if hasFog:
		for i in range(81):
			if currentState.values[i] != 0 and currentState.values[i] == solution[i]:
				# Correct value! Reveal all orthogonally adjacent cells.
				cells[i].set_fog(true)
				
				var top = get_relative_cell(i, Vector2i(0, -1))
				if top >= 0:
					cells[top].set_fog(true)
				
				var bottom = get_relative_cell(i, Vector2i(0, 1))
				if bottom >= 0:
					cells[bottom].set_fog(true)
				
				var left = get_relative_cell(i, Vector2i(-1, 0))
				if left >= 0:
					cells[left].set_fog(true)
				
				var right = get_relative_cell(i, Vector2i(1, 0))
				if right >= 0:
					cells[right].set_fog(true)

# Save the current state into the history.
func save_state():
	# Don't save state if it's identical to the previous one.
	if currentHistory >= 0:
		var previous = history[currentHistory]
		var same = true
		for i in range(81):
			if currentState.values[i] != previous.values[i] or currentState.centerValues[i] != previous.centerValues[i] or currentState.cornerValues[i] != previous.cornerValues[i]:
				same = false
				break
		
		if same:
			return
	
	currentHistory += 1
	
	# Clear out any later history (we'll be overwriting it).
	if currentHistory < history.size():
		history.resize(currentHistory)
	
	# Add the current state to the history.
	history.append(currentState.duplicate())

func undo():
	if currentHistory <= 0:
		return
	
	currentHistory -= 1
	currentState = history[currentHistory].duplicate()
	
	update_grid()

func redo():
	if currentHistory >= history.size() - 1:
		return
	
	currentHistory += 1
	currentState = history[currentHistory].duplicate()
	
	update_grid()

func check_complete():
	for i in range(81):
		if currentState.values[i] != solution[i]:
			return
	
	$/root/Game.show_win_screen()

func _process(delta):
	pass

func clear_selection():
	# A new selection has been started. Clear the previous one.
	if not (shiftDown || ctrlDown):
		for i in range(81):
			selected[i] = false

# Move current selection relative to the last one (used for arrow key movement)
func move_relative_selection(relative : Vector2i):
	var index = get_relative_cell(lastSelection, relative)
	
	if index >= 0:
		lastSelection = index
		clear_selection()
		selected[lastSelection] = true
		highlight()

# Add flashing highlights to a number of cells.
func add_flashing_highlight(positions):
	for pos in positions:
		var node = HighlightScene.instantiate()
		add_child(node)
		node.position = (pos - Vector2i(1, 1)) * size
		flashingHighlights.append(node)

func reset_flashing_highlight():
	for node in flashingHighlights:
		node.queue_free()
	flashingHighlights = []

func _input(event):
	if Global.paused:
		return
	
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				mouseDown = true
				
				# Find out which cell was clicked (if any) and select it.
				clear_selection()
				select_cell(event.position - position)
			else:
				mouseDown = false
	elif event is InputEventMouseMotion:
		if mouseDown:
			select_cell(event.position - position)
	elif event is InputEventKey:
		if event.keycode == KEY_SHIFT:
			shiftDown = event.pressed
		if event.keycode == KEY_CTRL:
			ctrlDown = event.pressed
		
		if event.pressed:
			# Setting the value of the selected cells.
			if event.physical_keycode == KEY_1:
				set_selected_cells(1)
			if event.physical_keycode == KEY_2:
				set_selected_cells(2)
			if event.physical_keycode == KEY_3:
				set_selected_cells(3)
			if event.physical_keycode == KEY_4:
				set_selected_cells(4)
			if event.physical_keycode == KEY_5:
				set_selected_cells(5)
			if event.physical_keycode == KEY_6:
				set_selected_cells(6)
			if event.physical_keycode == KEY_7:
				set_selected_cells(7)
			if event.physical_keycode == KEY_8:
				set_selected_cells(8)
			if event.physical_keycode == KEY_9:
				set_selected_cells(9)
			if event.keycode == KEY_BACKSPACE || event.keycode == KEY_DELETE:
				set_selected_cells(0)
			
			# Arrow key movement.
			if event.keycode == KEY_UP:
				move_relative_selection(Vector2i(0, -1))
			if event.keycode == KEY_DOWN:
				move_relative_selection(Vector2i(0, 1))
			if event.keycode == KEY_LEFT:
				move_relative_selection(Vector2i(-1, 0))
			if event.keycode == KEY_RIGHT:
				move_relative_selection(Vector2i(1, 0))
			
			# Undo and redo.
			if event.keycode == KEY_Z and ctrlDown:
				undo()
			if event.keycode == KEY_Y and ctrlDown:
				redo()
