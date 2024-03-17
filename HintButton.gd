extends ColorRect

class Hint:
	var outcome = []
	var pages = []

class Page:
	var highlight = []
	var corner = []
	var center = []
	var message : String

var hints = []

# Convenience constants for referring to specific cells.
const R1C1 = Vector2i(1, 1)
const R1C2 = Vector2i(2, 1)
const R1C3 = Vector2i(3, 1)
const R1C4 = Vector2i(4, 1)
const R1C5 = Vector2i(5, 1)
const R1C6 = Vector2i(6, 1)
const R1C7 = Vector2i(7, 1)
const R1C8 = Vector2i(8, 1)
const R1C9 = Vector2i(9, 1)

const R2C1 = Vector2i(1, 2)
const R2C2 = Vector2i(2, 2)
const R2C3 = Vector2i(3, 2)
const R2C4 = Vector2i(4, 2)
const R2C5 = Vector2i(5, 2)
const R2C6 = Vector2i(6, 2)
const R2C7 = Vector2i(7, 2)
const R2C8 = Vector2i(8, 2)
const R2C9 = Vector2i(9, 2)

const R3C1 = Vector2i(1, 3)
const R3C2 = Vector2i(2, 3)
const R3C3 = Vector2i(3, 3)
const R3C4 = Vector2i(4, 3)
const R3C5 = Vector2i(5, 3)
const R3C6 = Vector2i(6, 3)
const R3C7 = Vector2i(7, 3)
const R3C8 = Vector2i(8, 3)
const R3C9 = Vector2i(9, 3)

const R4C1 = Vector2i(1, 4)
const R4C2 = Vector2i(2, 4)
const R4C3 = Vector2i(3, 4)
const R4C4 = Vector2i(4, 4)
const R4C5 = Vector2i(5, 4)
const R4C6 = Vector2i(6, 4)
const R4C7 = Vector2i(7, 4)
const R4C8 = Vector2i(8, 4)
const R4C9 = Vector2i(9, 4)

const R5C1 = Vector2i(1, 5)
const R5C2 = Vector2i(2, 5)
const R5C3 = Vector2i(3, 5)
const R5C4 = Vector2i(4, 5)
const R5C5 = Vector2i(5, 5)
const R5C6 = Vector2i(6, 5)
const R5C7 = Vector2i(7, 5)
const R5C8 = Vector2i(8, 5)
const R5C9 = Vector2i(9, 5)

const R6C1 = Vector2i(1, 6)
const R6C2 = Vector2i(2, 6)
const R6C3 = Vector2i(3, 6)
const R6C4 = Vector2i(4, 6)
const R6C5 = Vector2i(5, 6)
const R6C6 = Vector2i(6, 6)
const R6C7 = Vector2i(7, 6)
const R6C8 = Vector2i(8, 6)
const R6C9 = Vector2i(9, 6)

const R7C1 = Vector2i(1, 7)
const R7C2 = Vector2i(2, 7)
const R7C3 = Vector2i(3, 7)
const R7C4 = Vector2i(4, 7)
const R7C5 = Vector2i(5, 7)
const R7C6 = Vector2i(6, 7)
const R7C7 = Vector2i(7, 7)
const R7C8 = Vector2i(8, 7)
const R7C9 = Vector2i(9, 7)

const R8C1 = Vector2i(1, 8)
const R8C2 = Vector2i(2, 8)
const R8C3 = Vector2i(3, 8)
const R8C4 = Vector2i(4, 8)
const R8C5 = Vector2i(5, 8)
const R8C6 = Vector2i(6, 8)
const R8C7 = Vector2i(7, 8)
const R8C8 = Vector2i(8, 8)
const R8C9 = Vector2i(9, 8)

const R9C1 = Vector2i(1, 9)
const R9C2 = Vector2i(2, 9)
const R9C3 = Vector2i(3, 9)
const R9C4 = Vector2i(4, 9)
const R9C5 = Vector2i(5, 9)
const R9C6 = Vector2i(6, 9)
const R9C7 = Vector2i(7, 9)
const R9C8 = Vector2i(8, 9)
const R9C9 = Vector2i(9, 9)

func _ready():
	# Use Tabula Rasa to place a 9 in (1,9).
	var hint = Hint.new()
	hint.outcome = [Vector2i(1, 9)]
	
	var page = Page.new()
	page.highlight = [Vector2i(1, 1), Vector2i(1, 2), Vector2i(1, 3), Vector2i(1, 4), Vector2i(1, 5), Vector2i(1, 6), Vector2i(1, 7), Vector2i(1, 8), Vector2i(1, 9)]
	page.message = "Rules to use: Tabula Rasa"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1), Vector2i(4, 1), Vector2i(5, 1), Vector2i(6, 1), Vector2i(7, 1), Vector2i(8, 1), Vector2i(9, 1)]
	page.message = "Consider where 9 can go in row 1. We don't know where it is, but we do know it has to come after the 1. If it comes before the 1, the 1 will see exactly 1 nine, which would break the rule."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(1, 1)]
	page.message = "If the 9 has to come after the 1, it can't go in R1C1."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(1, 1), Vector2i(1, 2), Vector2i(1, 3), Vector2i(1, 4), Vector2i(1, 5), Vector2i(1, 6), Vector2i(1, 7), Vector2i(1, 8), Vector2i(1, 9)]
	page.message = "The same is true for 2 in row 2, 3 in row 3, and so on. That leaves only one spot for the 9 in column 1: R9C1."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Tabula Rasa to place a 9 in (9,1).
	hint = Hint.new()
	hint.outcome = [Vector2i(9, 1)]
	
	page = Page.new()
	page.highlight = [Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7), Vector2i(9, 8), Vector2i(9, 9)]
	page.message = "Rules to use: Tabula Rasa"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(1, 2), Vector2i(2, 2), Vector2i(3, 2), Vector2i(4, 2), Vector2i(5, 2), Vector2i(6, 2), Vector2i(7, 2), Vector2i(8, 2), Vector2i(9, 2)]
	page.message = "Consider where 9 can go in row 2. We don't know where it is, but we do know it has to come before the 1. If it comes after the 1, the 1 will see exactly 1 nine (the nine from row 1), which would break the rule. By placing the 9 in row 2 before the 1, the 1 will see 2 nines."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(9, 2)]
	page.message = "If the 9 has to come before the 1, it can't go in R2C9."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7), Vector2i(9, 8), Vector2i(9, 9)]
	page.message = "The same is true for 2 in row 3, 3 in row 4, and so on. That leaves only one spot for the 9 in column 9: R1C9."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight and Anti-King to place a 9 in (5,5).
	hint = Hint.new()
	hint.outcome = [Vector2i(5, 5)]
	
	page = Page.new()
	page.message = "Rules to use: Anti-Knight, Anti-King"
	hint.pages.append(page)
	
	page = Page.new()
	page.corner = [[2, 2, 9], [3, 2, 9], [2, 3, 9], [3, 3, 9],
		[7, 7, 9], [8, 7, 9], [7, 8, 9], [8, 8, 9]]
	page.message = "Regular sudoku gives us the potential locations of nines in box 1 and 9."
	hint.pages.append(page)
	
	page = Page.new()
	page.corner = [[2, 2, 9], [3, 2, 9], [2, 3, 9], [3, 3, 9],
		[7, 7, 9], [8, 7, 9], [7, 8, 9], [8, 8, 9],
		[5, 2, 9], [6, 2, 9], [5, 3, 9], [6, 3, 9],
		[2, 5, 9], [3, 5, 9], [2, 6, 9], [3, 6, 9],
		[7, 4, 9], [8, 4, 9], [7, 5, 9], [8, 5, 9],
		[4, 7, 9], [5, 7, 9], [4, 8, 9], [5, 8, 9]]
	page.message = "There can't be a 9 in R2C4 or R3C4 as it would remove every possible location for a 9 in box 1 by the Anti-Knight and Anti-King rules. The same logic applies to box 4, 6 and 8."
	hint.pages.append(page)
	
	page = Page.new()
	page.corner = [[2, 2, 9], [3, 2, 9], [2, 3, 9], [3, 3, 9],
		[7, 7, 9], [8, 7, 9], [7, 8, 9], [8, 8, 9],
		[5, 2, 9], [6, 2, 9], [5, 3, 9], [6, 3, 9],
		[2, 5, 9], [3, 5, 9], [2, 6, 9], [3, 6, 9],
		[7, 4, 9], [8, 4, 9], [7, 5, 9], [8, 5, 9],
		[4, 7, 9], [5, 7, 9], [4, 8, 9], [5, 8, 9],
		[4, 4, 9], [5, 5, 9], [6, 6, 9]]
	page.message = "There can't be a 9 in R4C5 or R4C6 as it would remove every possible location for a 9 in box 2 by the Anti-Knight and Anti-King rules. The same logic excludes R5C4, R5C6, R6C4 and R6C5."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(2, 3), Vector2i(3, 3), Vector2i(5, 3), Vector2i(6, 3),
		Vector2i(4, 7), Vector2i(5, 7), Vector2i(7, 7), Vector2i(8, 7)]
	page.corner = [[2, 2, 9], [3, 2, 9], [2, 3, 9], [3, 3, 9],
		[7, 7, 9], [8, 7, 9], [7, 8, 9], [8, 8, 9],
		[5, 2, 9], [6, 2, 9], [5, 3, 9], [6, 3, 9],
		[2, 5, 9], [3, 5, 9], [2, 6, 9], [3, 6, 9],
		[7, 4, 9], [8, 4, 9], [7, 5, 9], [8, 5, 9],
		[4, 7, 9], [5, 7, 9], [4, 8, 9], [5, 8, 9],
		[4, 4, 9], [5, 5, 9], [6, 6, 9]]
	page.message = "R4C4 sees every possible 9 in row 3. R6C6 sees every possible 9 in row 7. That leaves only one space for a 9 in box 5: R5C5."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight and Anti-King to place the remaining nines.
	hint = Hint.new()
	hint.outcome = [Vector2i(6, 2), Vector2i(3, 3), Vector2i(8, 4), Vector2i(2, 6), Vector2i(7, 7), Vector2i(4, 8)]
	
	page = Page.new()
	page.message = "Rules to use: Anti-Knight, Anti-King"
	hint.pages.append(page)
	
	page = Page.new()
	page.corner = [[2, 2, 9], [3, 2, 9], [2, 3, 9], [3, 3, 9],
		[7, 7, 9], [8, 7, 9], [7, 8, 9], [8, 8, 9],
		[6, 2, 9], [6, 3, 9],
		[2, 6, 9], [3, 6, 9],
		[7, 4, 9], [8, 4, 9],
		[4, 7, 9], [4, 8, 9]]
	page.highlight = [Vector2i(6, 3), Vector2i(7, 4), Vector2i(3, 6), Vector2i(4, 7)]
	page.message = "Using Anti-Knight and Anti-King, we can place every remaining 9."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Tabula Rasa to place a 3 in R4C9
	hint = Hint.new()
	hint.outcome = [Vector2i(9, 4)]
	
	page = Page.new()
	page.highlight = [Vector2i(1, 4), Vector2i(2, 4), Vector2i(3, 4), Vector2i(4, 4), Vector2i(5, 4), Vector2i(6, 4), Vector2i(7, 4), Vector2i(8, 4), Vector2i(9, 4)]
	page.message = "Rules to use: Tabula Rasa"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(9, 4)]
	page.message = "If the 3 in row 4 comes before the 9, it will see exactly 3 nines (one from each row above). Therefore, 3 in row 4 has to be in R4C9."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Tabula Rasa to place a 6 in R6C1
	hint = Hint.new()
	hint.outcome = [Vector2i(1, 6)]
	
	page = Page.new()
	page.highlight = [Vector2i(1, 6), Vector2i(2, 6), Vector2i(3, 6), Vector2i(4, 6), Vector2i(5, 6), Vector2i(6, 6), Vector2i(7, 6), Vector2i(8, 6), Vector2i(9, 6)]
	page.message = "Rules to use: Tabula Rasa"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(1, 6)]
	page.message = "The 6 in row 6 must come before the 9 or it would see 6 nines. That leaves only one option: R6C1."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Tabula Rasa and Consecutive Pairs to place an 8 in R8C2
	hint = Hint.new()
	hint.outcome = [Vector2i(2, 8)]
	
	page = Page.new()
	page.highlight = [Vector2i(1, 8), Vector2i(2, 8), Vector2i(3, 8), Vector2i(4, 8), Vector2i(5, 8), Vector2i(6, 8), Vector2i(7, 8), Vector2i(8, 8), Vector2i(9, 8)]
	page.message = "Rules to use: Tabula Rasa, Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(1, 8), Vector2i(2, 8), Vector2i(3, 8)]
	page.message = "The 8 in row 8 must come before the 9, or it would see exactly 8 nines."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(1, 8), Vector2i(1, 9), Vector2i(3, 8), Vector2i(4, 8)]
	page.message = "According to the Consecutive Pairs rule, if there is no dot between two cells, they must not be consecutive in value. That rules out R8C1 and R8C3. The 8 is in R8C2."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight, Anti-King and Consecutive Pairs to place a 7 in R7C3
	hint = Hint.new()
	hint.outcome = [Vector2i(3, 7)]
	
	page = Page.new()
	page.highlight = [Vector2i(1, 7), Vector2i(2, 7), Vector2i(3, 7), Vector2i(1, 8), Vector2i(2, 8), Vector2i(3, 8), Vector2i(1, 9), Vector2i(2, 9), Vector2i(3, 9)]
	page.message = "Rules to use: Anti-Knight, Anti-King, Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(2, 8), Vector2i(1, 6)]
	page.message = "The 8 in R8C2 and 6 in R6C1 rule out 7 from most places in box 7."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(1, 6)]
	page.corner = [[3, 7, 7], [3, 9, 7]]
	page.message = "There are not many places for a 6 in box 7."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(3, 9)]
	page.corner = [[3, 7, 7], [3, 9, 7], [3, 8, 6], [3, 9, 6], [2, 9, 6]]
	page.message = "If there is a 7 in R9C3, it would rule out every possible location for a 6 in box 7. So the 7 has to be in R7C3."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight, Anti-King and Consecutive Pairs to place a 7 in R9C5
	hint = Hint.new()
	hint.outcome = [Vector2i(5, 9)]
	
	page = Page.new()
	page.highlight = [Vector2i(1, 4), Vector2i(2, 4), Vector2i(3, 4), Vector2i(1, 5), Vector2i(2, 5), Vector2i(3, 5), Vector2i(1, 6), Vector2i(2, 6), Vector2i(3, 6),
		Vector2i(4, 4), Vector2i(5, 4), Vector2i(6, 4), Vector2i(4, 5), Vector2i(5, 5), Vector2i(6, 5), Vector2i(4, 6), Vector2i(5, 6), Vector2i(6, 6),
		Vector2i(4, 7), Vector2i(5, 7), Vector2i(6, 7), Vector2i(4, 8), Vector2i(5, 8), Vector2i(6, 8), Vector2i(4, 9), Vector2i(5, 9), Vector2i(6, 9)]
	page.message = "Rules to use: Anti-Knight, Anti-King, Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(3, 7), Vector2i(1, 6)]
	page.message = "The 7 in R7C3 and 6 in R6C1 rule out 7 from most places in box 4."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(3, 7), Vector2i(1, 4), Vector2i(2, 4)]
	page.corner = [[1, 4, 7], [2, 4, 7]]
	page.message = "The 7 in box 4 and the 7 in R7C3 rule out 7 from most places in box 5."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(3, 7), Vector2i(6, 5), Vector2i(6, 6)]
	page.corner = [[1, 4, 7], [2, 4, 7], [6, 5, 7], [6, 6, 7]]
	page.message = "The 7 in box 5 and the 7 in R7C3 rule out 7 from most places in box 8. In fact, all but one!"
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Consecutive Pairs to place an 8 in R7C5
	hint = Hint.new()
	hint.outcome = [Vector2i(5, 7)]
	
	page = Page.new()
	page.highlight = [Vector2i(4, 7), Vector2i(5, 7), Vector2i(6, 7), Vector2i(4, 8), Vector2i(5, 8), Vector2i(6, 8), Vector2i(4, 9), Vector2i(5, 9), Vector2i(6, 9)]
	page.message = "Rules to use: Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(2, 8), Vector2i(5, 9), Vector2i(7, 7), Vector2i(4, 8)]
	page.message = "The 8 in R8C2, 9 in R8C4, 7 in R9C5 and 9 R7C4 place the 8 in box 8."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Consecutive Pairs, Anti-King to place an 8 in R4C6
	hint = Hint.new()
	hint.outcome = [Vector2i(6, 4)]
	
	page = Page.new()
	page.highlight = [Vector2i(4, 1), Vector2i(5, 1), Vector2i(6, 1), Vector2i(4, 2), Vector2i(5, 2), Vector2i(6, 2), Vector2i(4, 3), Vector2i(5, 3), Vector2i(6, 3),
		Vector2i(4, 4), Vector2i(5, 4), Vector2i(6, 4), Vector2i(4, 5), Vector2i(5, 5), Vector2i(6, 5), Vector2i(4, 6), Vector2i(5, 6), Vector2i(6, 6)]
	page.message = "Rules to use: Anti-King, Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(5, 7), Vector2i(6, 2), Vector2i(3, 3)]
	page.message = "The 8 in R7C5, the 9 in R3C3 and the 9 in R2C6 rule out 8 from most places in box 2."
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(4, 1), Vector2i(4, 2), Vector2i(5, 7), Vector2i(5, 5)]
	page.corner = [[4, 1, 8], [4, 2, 8]]
	page.message = "The 8 in box 2, the 8 in R7C3 and the 9 in R5C5 rule out 8 from all but one place in box 5."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Consecutive Pairs, Anti-Knight, Anti-King to place an 7 in R6C6
	hint = Hint.new()
	hint.outcome = [Vector2i(6, 6)]
	
	page = Page.new()
	page.highlight = [Vector2i(4, 4), Vector2i(5, 4), Vector2i(6, 4), Vector2i(4, 5), Vector2i(5, 5), Vector2i(6, 5), Vector2i(4, 6), Vector2i(5, 6), Vector2i(6, 6)]
	page.message = "Rules to use: Anti-Knight, Anti-King, Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.corner = [[1, 4, 7], [2, 4, 7]]
	page.highlight = [Vector2i(1, 4), Vector2i(2, 4), Vector2i(6, 4), Vector2i(3, 7), Vector2i(5, 9)]
	page.message = "The 7 in box 4, the 7 in R7C3, the 7 in R9C5 and the 8 in R4C6 place the 7 in box 5."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight, Anti-King to place an 7 in R5C9
	hint = Hint.new()
	hint.outcome = [Vector2i(9, 5)]
	
	page = Page.new()
	page.highlight = [Vector2i(7, 4), Vector2i(8, 4), Vector2i(9, 4), Vector2i(7, 5), Vector2i(8, 5), Vector2i(9, 5), Vector2i(7, 6), Vector2i(8, 6), Vector2i(9, 6)]
	page.message = "Rules to use: Anti-Knight, Anti-King"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(6, 6)]
	page.message = "The 7 in R6C6 places the 7 in box 6."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight to place a 7 in R8C8
	hint = Hint.new()
	hint.outcome = [Vector2i(8, 8)]
	
	page = Page.new()
	page.highlight = [Vector2i(7, 7), Vector2i(8, 7), Vector2i(9, 7), Vector2i(7, 8), Vector2i(8, 8), Vector2i(9, 8), Vector2i(7, 9), Vector2i(8, 9), Vector2i(9, 9)]
	page.message = "Rules to use: Anti-Knight"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(9, 5), Vector2i(5, 9)]
	page.message = "The 7 in R5C9 and the 7 in R9C5 place the 7 in box 9."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Consecutive Pairs to place a 6 in R8C6
	hint = Hint.new()
	hint.outcome = [Vector2i(6, 8)]
	
	page = Page.new()
	page.highlight = [Vector2i(4, 7), Vector2i(5, 7), Vector2i(6, 7), Vector2i(4, 8), Vector2i(5, 8), Vector2i(6, 8), Vector2i(4, 9), Vector2i(5, 9), Vector2i(6, 9)]
	page.message = "Rules to use: Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(6, 6), Vector2i(3, 7), Vector2i(5, 9)]
	page.message = "The 7 in R6C6, the 7 in R7C3 and the 7 in R9C5 place the 6 in box 8."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight to place a 6 in R7C9
	hint = Hint.new()
	hint.outcome = [Vector2i(9, 7)]
	
	page = Page.new()
	page.highlight = [Vector2i(7, 7), Vector2i(8, 7), Vector2i(9, 7), Vector2i(7, 8), Vector2i(8, 8), Vector2i(9, 8), Vector2i(7, 9), Vector2i(8, 9), Vector2i(9, 9)]
	page.message = "Rules to use: Anti-Knight"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(2, 9), Vector2i(3, 9), Vector2i(6, 8)]
	page.corner = [[2, 9, 6], [3, 9, 6]]
	page.message = "The 6 in box 1 and the 6 in R8C6 place the 6 in box 9."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight, Anti-King, Consecutive Pairs to place an 8 in R6C8
	hint = Hint.new()
	hint.outcome = [Vector2i(8, 6)]
	
	page = Page.new()
	page.highlight = [Vector2i(7, 4), Vector2i(8, 4), Vector2i(9, 4), Vector2i(7, 5), Vector2i(8, 5), Vector2i(9, 5), Vector2i(7, 6), Vector2i(8, 6), Vector2i(9, 6)]
	page.message = "Rules to use: Anti-Knight, Anti-King, Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [Vector2i(6, 4), Vector2i(9, 5)]
	page.message = "The 8 in R4C6 and the 7 in R5C9 place the 8 in box 6."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight, Anti-King, Consecutive Pairs to place an 8 in R1C4
	hint = Hint.new()
	hint.outcome = [R1C4]
	
	page = Page.new()
	page.highlight = [R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R3C1, R3C2, R3C3, R3C4, R3C5, R3C6]
	page.message = "Rules to use: Anti-Knight, Anti-King, Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.corner = [[1, 4, 7], [2, 4, 7]]
	page.highlight = [R4C1, R4C2, R7C3]
	page.message = "The 7 in box 4 and the 7 in R7C3 limit the possible locations of 7 in box 1."
	hint.pages.append(page)
	
	page = Page.new()
	page.corner = [[1, 1, 7], [2, 1, 7]]
	page.highlight = [R1C1, R1C2, R6C6, R9C5]
	page.message = "The 7 in box 1, the 7 in R6C6 and the 7 in R9C5 limit the possible locations of 7 in box 2."
	hint.pages.append(page)
	
	page = Page.new()
	page.corner = [[4, 2, 7], [4, 3, 7], [4, 1, 8], [4, 2, 8]]
	page.highlight = [R2C4]
	page.message = "An 8 in R2C4 would rule out all possible locations for 7 in box 2, so the 8 has to go in R1C4."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Consecutive Pairs to place a 7 in R3C4
	hint = Hint.new()
	hint.outcome = [R3C4]
	
	page = Page.new()
	page.highlight = [R1C4, R1C5, R1C6, R2C4, R2C5, R2C6, R3C4, R3C5, R3C6]
	page.message = "Rules to use: Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [R1C4, R6C6, R9C5]
	page.message = "The 7 in R6C6, the 7 in R9C5 and the 8 in R1C4 place the 7 in box 2."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight to place a 7 in R4C1
	hint = Hint.new()
	hint.outcome = [R4C1]
	
	page = Page.new()
	page.highlight = [R4C1, R4C2, R4C3, R5C1, R5C2, R5C3, R6C1, R6C2, R6C3]
	page.message = "Rules to use: Anti-Knight"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [R3C4, R5C9, R6C6, R7C3]
	page.message = "The 7 in R3C4, the 7 in R5C9 and the 7 in R6C6 place the 7 in box 4."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight, Anti-King to place a 7 in R1C2
	hint = Hint.new()
	hint.outcome = [R1C2]
	
	page = Page.new()
	page.highlight = [R1C1, R1C2, R1C3, R2C1, R2C2, R2C3, R3C1, R3C2, R3C3]
	page.message = "Rules to use: Anti-Knight, Anti-King"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [R4C1, R7C3]
	page.message = "The 7 in R4C1 and the 7 in R7C3 place the 7 in box 1."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Sudoku to place a 7 in R2C7
	hint = Hint.new()
	hint.outcome = [R2C7]
	
	page = Page.new()
	page.highlight = [R1C7, R1C8, R1C9, R2C7, R2C8, R2C9, R3C7, R3C8, R3C9]
	page.message = "Rules to use: ..."
	hint.pages.append(page)
	
	page = Page.new()
	page.message = "With 8 sevens in the grid, you should be able to place the last one... Or the last seven, rather. Not the last seven ones. The last one seven."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# Use Anti-Knight, Anti-King, Consecutive Pairs to place a 6 in R1C8
	hint = Hint.new()
	hint.outcome = [R1C8]
	
	page = Page.new()
	page.highlight = [R1C7, R1C8, R1C9, R2C7, R2C8, R2C9, R3C7, R3C8, R3C9,
		R4C7, R4C8, R4C9, R5C7, R5C8, R5C9, R6C7, R6C8, R6C9]
	page.message = "Rules to use: Anti-Knight, Anti-King, Consecutive Pairs"
	hint.pages.append(page)
	
	page = Page.new()
	page.highlight = [R7C9]
	page.message = "The 6 in R7C9 leaves only two possible locations for 6 in box 6."
	hint.pages.append(page)
	
	page = Page.new()
	page.corner = [[7, 4, 6], [7, 5, 6]]
	page.highlight = [R7C9, R4C7, R5C7, R2C7]
	page.message = "The 6 in box 6, the 6 in R7C9 and the 7 in R2C7 place the 6 in box 3."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 6 in R2C5
	hint = Hint.new()
	hint.outcome = [R2C5]
	
	page = Page.new()
	page.highlight = Box(2)
	page.message = "Rules to use: Consecutive Pairs"
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 6 in R3C2
	hint = Hint.new()
	hint.outcome = [R3C2]
	
	page = Page.new()
	page.highlight = Box(1)
	page.message = "Rules to use: ..."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 6 in R9C3
	hint = Hint.new()
	hint.outcome = [R9C3]
	
	page = Page.new()
	page.highlight = Box(7)
	page.message = "Rules to use: ..."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 6 in R5C4
	hint = Hint.new()
	hint.outcome = [R5C4]
	
	page = Page.new()
	page.highlight = Box(5)
	page.message = "Rules to use: Anti-Knight"
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 6 in R4C7
	hint = Hint.new()
	hint.outcome = [R4C7]
	
	page = Page.new()
	page.highlight = Box(6)
	page.message = "Rules to use: ..."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 8 in R5C3
	hint = Hint.new()
	hint.outcome = [R5C3]
	
	page = Page.new()
	page.highlight = Box(4)
	page.message = "Rules to use: Consecutive Pairs"
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 8 in R3C9
	hint = Hint.new()
	hint.outcome = [R3C9]
	
	page = Page.new()
	page.highlight = Box(3)
	page.message = "Rules to use: Consecutive Pairs"
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 8 in R2C1
	hint = Hint.new()
	hint.outcome = [R2C1]
	
	page = Page.new()
	page.highlight = Box(1)
	page.message = "Rules to use: ..."
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 5 in R7C4
	hint = Hint.new()
	hint.outcome = [R7C4]
	
	page = Page.new()
	page.highlight = Box(8)
	page.message = "Rules to use: Consecutive Pairs"
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 5 in R8C1
	hint = Hint.new()
	hint.outcome = [R8C1]
	
	page = Page.new()
	page.highlight = Box(7)
	page.message = "Rules to use: Consecutive Pairs"
	hint.pages.append(page)
	
	hints.append(hint)
	
	# 5 in R6C7
	hint = Hint.new()
	hint.outcome = [R6C7]
	
	page = Page.new()
	page.highlight = Row(6)
	page.message = "Rules to use: Anti-King, Consecutive Pairs"
	hint.pages.append(page)
	
	hints.append(hint)

func _input(event):
	if Global.paused:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var relativePos = event.position - global_position
			if relativePos.x >= 0 and relativePos.y >= 0 and relativePos.x < size.x and relativePos.y < size.y:
				$/root/Game.show_hint(hints)

func Box(index : int):
	var startPos = Vector2i((index - 1) % 3, (index - 1) / 3) * 3 + Vector2i(1, 1)
	var positions = []
	for i in range(9):
		positions.append(startPos + Vector2i(i % 3, i / 3))
	return positions

func Row(y : int):
	var positions = []
	for i in range(9):
		positions.append(Vector2i(i + 1, y))
	return positions
