extends Node2D

var given : int = 0
var user_value : int = 0
var cornerLabels = []

func _ready():
	cornerLabels.append($Corner/C1)
	cornerLabels.append($Corner/C2)
	cornerLabels.append($Corner/C3)
	cornerLabels.append($Corner/C4)
	cornerLabels.append($Corner/C5)
	cornerLabels.append($Corner/C6)
	cornerLabels.append($Corner/C7)
	cornerLabels.append($Corner/C8)
	cornerLabels.append($Corner/C9)

func set_given_value(value : int):
	assert(value >= 0 and value <= 9)
	given = value
	
	if value == 0:
		$Given.set_visible(false)
	else:
		$Given.set_text(str(value))

func get_given_value():
	return given

func set_state(value : int, centerValues : int, cornerValues : int):
	set_user_value(value)
	
	# Clear corner values.
	for i in range(9):
		cornerLabels[i].set_text("")
	
	$Center.set_text("")
	
	# Center and corner values.
	if value == 0:
		var cornerIndex = 0
		var centerText = ""
		for i in range(9):
			if centerValues & (1 << i):
				centerText += str(i + 1)
			
			if cornerValues & (1 << i):
				cornerLabels[cornerIndex].set_text(str(i + 1))
				cornerIndex += 1
		
		$Center.set_text(centerText)

func set_user_value(value : int):
	assert(value >= 0 and value <= 9)
	user_value = value
	
	if value == 0:
		$User.set_visible(false)
	else:
		$User.set_text(str(value))
		$User.set_visible(true)

func get_user_value():
	return user_value

func set_selection(localRegion : PackedByteArray):
	assert(localRegion.size() == 5)
	
	$Selection.visible = localRegion[2]
	$Selection/Top.visible = !localRegion[0]
	$Selection/Left.visible = !localRegion[1]
	$Selection/Right.visible = !localRegion[3]
	$Selection/Bottom.visible = !localRegion[4]

func set_fog(revealed : bool):
	$Fog.set_visible(!revealed)
