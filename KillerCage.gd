extends Node2D

var size : int
const margin = 3
	
var lines = []

func _draw():
	for line in lines:
		draw_dashed_line(line[0], line[1], Color.BLACK, 1.0, 3.0, true)

func setup(size : int, total : int, cells):
	self.size = size
	$Total.set_text(str(total))
	
	var grid = []
	grid.resize(11 * 11)
	grid.fill(0)
	
	# Determine which cells are part of the cage.
	for cell in cells:
		assert(cell.x >= 1 and cell.y >= 1 and cell.x <= 9 and cell.y <= 9)
		grid[cell.y * 11 + cell.x] = 1
	
	var first = true
	for i in range(11 * 11):
		if grid[i]:
			var topLeft = Vector2i((i % 11 - 1) * size, (i / 11 - 1) * size)
			
			if first:
				first = false
				$Total.position = topLeft + Vector2i(2, 0)
			
			# Top line
			if !grid[i - 11]:
				var leftOffset = margin if !grid[i - 1] else 0
				var rightOffset = margin if !grid[i + 1] else 0
				lines.append([topLeft + Vector2i(leftOffset, margin), topLeft + Vector2i(size - rightOffset, margin)])
			
			# Bottom line
			if !grid[i + 11]:
				var leftOffset = margin if !grid[i - 1] else 0
				var rightOffset = margin if !grid[i + 1] else 0
				lines.append([topLeft + Vector2i(leftOffset, size - margin), topLeft + Vector2i(size - rightOffset, size - margin)])
			
			# Left line
			if !grid[i - 1]:
				var topOffset = margin if !grid[i - 11] else 0
				var bottomOffset = margin if !grid[i + 11] else 0
				lines.append([topLeft + Vector2i(margin, topOffset), topLeft + Vector2i(margin, size - bottomOffset)])
			
			# Right line
			if !grid[i + 1]:
				var topOffset = margin if !grid[i - 11] else 0
				var bottomOffset = margin if !grid[i + 11] else 0
				lines.append([topLeft + Vector2i(size - margin, topOffset), topLeft + Vector2i(size - margin, size - bottomOffset)])
