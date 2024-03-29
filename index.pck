GDPC                p                                                                      0   X   res://.godot/exported/133200997/export-07859e86283ced63d2e7358ecc474bba-Highlight.scn   �n      �      3^7�>�_qA�	�    P   res://.godot/exported/133200997/export-265b7df489b411ff71b2244a7513a8b7-Dot.scn �&      �      ���fj�Q��:X}l    P   res://.godot/exported/133200997/export-2b7bab7fad407cbdf32d0d29a52e0175-Grid.scn`k      g      ���p�V��[w⠿�    P   res://.godot/exported/133200997/export-2bc5638c5231be281ddca52f2062ecbe-Line.scn��      �      H�����"��([�9U]�    T   res://.godot/exported/133200997/export-339521e85f3b30700727370469b826d5-Controls.scnp      O
      �Ab�������(�&s    P   res://.godot/exported/133200997/export-6455994a605b35b7d96f8362f3055c4a-Game.scn�7      9      �g��������%�Ι��    X   res://.godot/exported/133200997/export-9837c47c24cb4cc85361b27ec3c9cfb0-KillerCage.scn  ��      4      U<���tx:�4���-.�    X   res://.godot/exported/133200997/export-9ec6ea30cbdd459871f15b1db75bb8b9-WinScreen.scn   �)     i	      _]�O1f��%�J0���    P   res://.godot/exported/133200997/export-b1a3d4fc27eff342b81f94e051d7a58e-Rule.scn�     9      ���{��_"�?k�|3    P   res://.godot/exported/133200997/export-bf01863b9050ecf1dd899e73dd8a5581-Cell.scn�      �      f�w���T��!�    X   res://.godot/exported/133200997/export-ce169da7a3e322d506335714d94b2af4-CloseButton.scn �      �      V��n���a����A~~+    \   res://.godot/exported/133200997/export-da1cf313d1d3029439d48924399e7ff5-RuleExplanation.scn P     �      D�Y?< vX�&9mN��    P   res://.godot/exported/133200997/export-f36940fc95c3ba8574d837e3d59ab645-Hint.scn z      �      r�z�̀���}�J�	    ,   res://.godot/global_script_class_cache.cfg   9            ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex0�      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  �<     �      Mdg�LL��3�Z��Z9m       res://Cell.gd           �      �=���N�7+E�Kx       res://Cell.tscn.remap   `3     a       =u����﷾Be�U��       res://CloseButton.gd�      E      ��w�mY�@N���%�       res://CloseButton.tscn.remap�3     h       �����;��Pۦ[�݈�       res://Controls.tscn.remap   @4     e       :u ���C��;����;       res://ControlsButton.gd �$      f      ꪧ#ᡬC ���o       res://Dot.gd0&      �       ��zPsx�+�8 �q�       res://Dot.tscn.remap�4     `       ��L�t*���*k?�L�       res://ExplanationButton.gd  `)      �      P`��gZ�AD!�F       res://Game.gd   0+      �      ��̈́?Q<t:��D8�       res://Game.tscn.remap   5     a       ����:w�W�0[��+J       res://Grid.gd   0D      !'      �H^��8�e �d�nq       res://Grid.tscn.remap   �5     a       +�^\D 
��*Kȁ�E       res://Highlight.gd  �m      �       ���zf?�`�z��ٚ�       res://Highlight.tscn.remap  �5     f       �R�"�)��:���=p�       res://Hint.gd   �q      |       a&�5�9�$I�TW4       res://Hint.tscn.remap   `6     a       Ȓ�� M��2��ĝw�       res://HintButton.gd І      T_      �.@jW
�99�I?8�<       res://KillerCage.gd ��      �      S������������2       res://KillerCage.tscn.remap �6     g       kǭ��u�sG�M�x       res://Line.tscn.remap   @7     a       �^�����r�dn���*       res://PageTurn.gd   �     �      �54�-�����f���       res://Rule.gd   0     �      �	�D]7o }�C��)       res://Rule.tscn.remap   �7     a       �^k2���!��㢖	       res://RuleExplanation.gd0           ӣ7�J�i�</x��        res://RuleExplanation.tscn.remap 8     l       $E}��3�X�:�˞+k6       res://Rules.gd  �'           qC�qVw/E,BP���H       res://WinScreen.tscn.remap  �8     f       S(xK�s��&�sK�&*       res://global.gd  D      (       *�����?�� �W�@�       res://icon.svg   9     �      C��=U���^Qu��U3       res://icon.svg.import   �      �       ;�;)��O�c�t���       res://project.binary�>     �      Bڳ7OY��-~/�W�            extends Node2D

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
  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://Cell.gd ��������      local://LabelSettings_syhqd 2         local://LabelSettings_sim6h t         local://LabelSettings_wtn2p �         local://LabelSettings_2l7hs �         local://PackedScene_i8c04 :         LabelSettings                                  �?         LabelSettings                    ��P>��x>��W?  �?         LabelSettings          
         ��P>��x>��W?  �?         LabelSettings                   ��P>��x>��W?  �?         PackedScene          	         names "   ,      Cell    script    Node2D 
   ColorRect    offset_right    offset_bottom    Fog    z_index    color    Given    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_top    grow_horizontal    grow_vertical    auto_translate    text    label_settings    horizontal_alignment    vertical_alignment    Label    User    visible    Center    autowrap_mode 
   Selection    Top    Left    Right    offset_left    Bottom    Corner    C1    C2    C3    C4    C5    C6    C7    C8    C9    	   variants                       B         	��>	��>	��>  �?                  ?     @�     (B                   1              
                                 @   ��P>��x>��W?  �?     B               node_count             nodes     �  ��������       ����                            ����                                 ����                                          	   ����         
                                                   	      	      
                                             ����      
         
                                                   	      	      
                                             ����         
                                                   	      	      
                                             ����      
                    ����      
                                            ����      
                                            ����      
                                                !   ����      
                                                "   ����                  #   ����                                                $   ����                                     	                 %   ����                                     	                 &   ����                                     	      	                 '   ����                                                      (   ����                                           	                 )   ����                                                      *   ����                                     	                       +   ����                                                        conn_count              conns               node_paths              editable_instances              version             RSRC      extends ColorRect

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var relativePos = event.position - global_position
			if relativePos.x >= 0 and relativePos.y >= 0 and relativePos.x < size.x and relativePos.y < size.y:
				$/root/Game.hide_popup()
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://CloseButton.gd ��������      local://PackedScene_ar74e          PackedScene          	         names "         CloseButton    offset_right    offset_bottom    mouse_default_cursor_shape    color    script    metadata/_edit_use_anchors_ 
   ColorRect    Node2D 	   position 	   rotation    ColorRect2    offset_left    mouse_filter    ColorRect3    offset_top    	   variants    
         A         ��6?+��=+��=  �?                
     �@  �@   �I?     ��     �@     �?      node_count             nodes     @   ��������       ����                                                           ����   	      
                       ����                  	                                ����            	                               conn_count              conns               node_paths              editable_instances              version             RSRC     RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       PackedScene    res://CloseButton.tscn �췱_�D      local://LabelSettings_yq462 �         local://LabelSettings_k3gw4 2         local://PackedScene_k3q8g t         LabelSettings                                 �?         LabelSettings          	                       �?         PackedScene          	         names "      	   Controls    Node2D    Outer    z_index    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    color 
   ColorRect    Inner    layout_mode    metadata/_edit_use_anchors_    text    label_settings    horizontal_alignment    Label    Message    autowrap_mode    CloseButton    	   variants          d               ?     H�     ��     HC     �B         ���>���>���>  �?           F�     ��     FC     �B           �C     �A   	   Controls              ����     �@     �A     �C     �C   �  Use the mouse or arrow keys to select cells. Hold Shift or Ctrl when selecting cells to add to the current selection.
Press 1-9 to enter values into the selected cells. Hold Ctrl to enter center values. Hold Shift to enter corner values.
Undo with Ctrl+Z and redo with Ctrl+Y.
The rules of the puzzle are listed on the right side. Press the ? next to a rule to get a visual example showing how it works.
If you are stuck, press the Hint button to get a hint on how to proceed.                             >x?   ��L<      node_count             nodes     �   ��������       ����                      ����                                        	      
                                                     ����      	                                 	   
   
                                                      ����      	                              	                          ����
      	         	      
                                                     ���            	                                           conn_count              conns               node_paths              editable_instances              version             RSRC extends ColorRect

func _input(event):
	if Global.paused:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var relativePos = event.position - global_position
			if relativePos.x >= 0 and relativePos.y >= 0 and relativePos.x < size.x and relativePos.y < size.y:
				$/root/Game.show_controls()
          extends Node2D

func _draw():
	draw_circle(Vector2(0, 0), 4, Color(1, 1, 1))
	draw_arc(Vector2(0, 0), 4, 0, 2 * PI, 50, Color(0, 0, 0), 0.4, true)
             RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Dot.gd ��������      local://PackedScene_kjde1          PackedScene          	         names "         Dot    z_index    script    Node2D    	   variants          d                   node_count             nodes        ��������       ����                          conn_count              conns               node_paths              editable_instances              version             RSRC               extends ColorRect

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
             extends Node2D

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
    RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://Game.gd ��������   PackedScene    res://Grid.tscn ��u7�J   Script    res://Rules.gd ��������   Script    res://ControlsButton.gd ��������   Script    res://HintButton.gd ��������      local://LabelSettings_vc2sw �         local://LabelSettings_2b6tu �         local://LabelSettings_55wia 
         local://PackedScene_23yrm L         LabelSettings                      LabelSettings                      LabelSettings                                 �?         PackedScene          	         names "   "      Game    script    Node2D    Grid 	   position    Rules    offset_left    offset_top    offset_right    offset_bottom    color 
   ColorRect    Fade    visible    z_index    Title    layout_mode    text    label_settings    horizontal_alignment    Label    Author    Line2D    points    width    default_color    Line2D2    Line2D3    Line2D4 	   Controls    mouse_default_cursor_shape    vertical_alignment    Hint    Label2    	   variants    +                      
     �?  �?     �C      B      D   ��
?��E?���>  �?                   2       ��D    �D               �� ?   ��6?+��=+��=  �?             @     �C     �A      Helpful Cages                      �A     $B      by Albin Bernhardsson          %        �C  �? �D  �? �D ��C  �C ��C                 �?%       �D  B  �C  B
         �C%        �C  �B  �C  B     �C    ��C     �C                    	C     B   	   Controls              ��C    �D               Hint
       node_count             nodes     �   ��������       ����                      ���                                 ����                     	      
                              ����            	      
   	      
                        ����               	      
                       ����                     	                                         ����                     	                                          ����                                       ����                                       ����                                             ����                                             ����                     	          !   
         "                    ����            #   	   $      %      &                                  ����      '            (   	          !   
         )                 !   ����            #   	   $      *      &                         conn_count              conns               node_paths              editable_instances              version             RSRC       extends Node

var paused : bool = false
        extends Node2D

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
               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Grid.gd ��������      local://PackedScene_n4oxf          PackedScene          	         names "         Grid    script    Node2D    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC         extends ColorRect

var time = 0
const min : float = 0.1
const max : float = 0.3
const speed : float = 2.0

func _process(delta):
	time += delta
	color.a = min + (0.5 + 0.5 * sin(time * speed)) * (max - min)
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Highlight.gd ��������      local://PackedScene_wq128 
         PackedScene          	         names "      
   Highlight    z_index    offset_right    offset_bottom    color    script 
   ColorRect    	   variants          	         B     �?  �?      �?                node_count             nodes        ��������       ����                                            conn_count              conns               node_paths              editable_instances              version             RSRC               extends Node2D

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
    RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://Hint.gd ��������   PackedScene    res://CloseButton.tscn �췱_�D   PackedScene    res://Grid.tscn ��u7�J   Script    res://PageTurn.gd ��������      local://LabelSettings_k3gw4 B         local://PackedScene_xt52n �         LabelSettings          	                       �?         PackedScene          	         names "   '      Hint    script    Node2D    Outer    z_index    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    color 
   ColorRect    Inner    layout_mode    metadata/_edit_use_anchors_    Message    text    label_settings    autowrap_mode    Label    CloseButton    Grid 	   position    scale 	   PageLeft    visible    mouse_default_cursor_shape 
   direction    mouse_filter 	   rotation    ColorRect2    ColorRect3 
   PageRight    	   variants    3                d               ?     /�     /C         ���>���>���>  �?         ����   ���>     -�     (�     -C     2C         i=<   �0;?   ��>    �V?     �A     DC     TB      Those cages sure were helpful!                             w?   �h�;         
     <B   A
   333?333?                   �@     C     B     C               A     B     @A                 �?
          A   �I�     PA    ��C     �C     �?
     B   A   ��@      node_count             nodes     6  ��������       ����                            ����                                 	      
                                                           ����            	            
         	   
   
                                                           ����            	                     	                                                           ���                  	                     	                 ���                                      ����	             !   
   "      #      $      %             &   !   	                    ����      !   
   "      '      (      )   "         *                    ����      +   #   ,                 $   ����      -      "   "         *                 %   ����      "      -   "         *                 &   ����             !   
   .      #      /      %             &                    ����      !   
   0      '            )   "         *                    ����      1   #   2                 $   ����      -      "   "         *                 %   ����      "      -   "         *             conn_count              conns               node_paths              editable_instances              version             RSRC      extends ColorRect

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
            GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://daep4uddhi3js"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                extends Node2D

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
   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://KillerCage.gd ��������      local://LabelSettings_kswku �         local://PackedScene_5ufiy          LabelSettings                                 �?                  PackedScene          	         names "   	      KillerCage    z_index    script    Node2D    Total    offset_right    offset_bottom    label_settings    Label    	   variants                             B     �A                node_count             nodes        ��������       ����                                  ����                                      conn_count              conns               node_paths              editable_instances              version             RSRC            RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_3tm6y �          PackedScene          	         names "         Line    z_index    points    width    default_color    Line2D    	   variants          
   %                �B         �?                 �?      node_count             nodes        ��������       ����                                      conn_count              conns               node_paths              editable_instances              version             RSRC              extends ColorRect

@export var direction : int = 1

func _input(event):
	if !visible:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var relativePos = event.position - global_position
			if relativePos.x >= 0 and relativePos.y >= 0 and relativePos.x < size.x and relativePos.y < size.y:
				$"../../../".turn_page(direction)
        extends Node2D

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

   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://Rule.gd ��������   Script    res://ExplanationButton.gd ��������      local://LabelSettings_bqx2p <         local://LabelSettings_px5a0 ~         local://LabelSettings_ag3an �         local://PackedScene_qpd05          LabelSettings                                 �?         LabelSettings             �      	                       �?         LabelSettings                             �?  �?         PackedScene          	         names "         Rule    script    Node2D 
   RuleTitle    offset_right    offset_bottom    text    label_settings    Label    RuleDescription    offset_top    autowrap_mode    ExplanationButton    mouse_default_cursor_shape    color 
   ColorRect    layout_mode    	   variants                       B     �A      Sudoku                PA    ��C     �B      Normal sudoku rules apply.                     �@     A           �?  �?  �?                          ?                node_count             nodes     M   ��������       ����                            ����                                          	   ����   
                           	      
                     ����                                                  ����                                           conn_count              conns               node_paths              editable_instances              version             RSRC       extends Node2D

func setup(ruleState):
	$Outer/Inner/Grid.setup_sudoku(ruleState.givens, ruleState.givens, ruleState.cages, ruleState.dots, ruleState.hasFog)
	$Outer/Inner/Grid.add_flashing_highlight(ruleState.highlight)
	$Outer/Inner/Message.set_text(ruleState.explanation)
             RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://RuleExplanation.gd ��������   PackedScene    res://CloseButton.tscn �췱_�D   PackedScene    res://Grid.tscn ��u7�J      local://LabelSettings_k3gw4 $         local://PackedScene_eh6x8 f         LabelSettings          	                       �?         PackedScene          	         names "         RuleExplanation    script    Node2D    Outer    z_index    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    color 
   ColorRect    Inner    layout_mode    metadata/_edit_use_anchors_    Message    text    label_settings    autowrap_mode    Label    CloseButton    Grid 	   position    scale    	   variants                    d               ?     /�     /C         ���>���>���>  �?           -�     -C         ����   i=<   ��>?   ��>    �V?     �A     DC     TB      Those cages sure were helpful!                             w?   �h�;         
     <B   A
   333?333?      node_count             nodes     �   ��������       ����                            ����                                 	      
                                                           ����                                 	      
   	      	      
      
                                      ����                                 	                                                           ���                                       	                 ���                               conn_count              conns               node_paths              editable_instances              version             RSRC extends ColorRect

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
              RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       PackedScene    res://CloseButton.tscn �췱_�D      local://LabelSettings_yq462          local://LabelSettings_k3gw4 Z         local://LabelSettings_dhqhp �         local://PackedScene_y088s �         LabelSettings                                 �?         LabelSettings          	                       �?         LabelSettings                                 �?         PackedScene          	         names "      
   WinScreen    Node2D    Outer    z_index    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    color 
   ColorRect    Inner    layout_mode    metadata/_edit_use_anchors_ 	   WellDone    text    label_settings    horizontal_alignment    Label    Message    Time    CloseButton    	   variants          d               ?     ��     �     �B     B         ���>���>���>  �?           ��     �     �B     B           DC     �A      Well done!              ����     �A     TB      Those cages sure were helpful!               HB     �B      Time:                        �Sp?   �g�<      node_count             nodes     �   ��������       ����                      ����                                        	      
                                                     ����      	                                 	   
   
                                                     ����      	                              	                          ����	      	         
                                 	                          ����      	   
                                 	                    ���            	                                           conn_count              conns               node_paths              editable_instances              version             RSRC       [remap]

path="res://.godot/exported/133200997/export-bf01863b9050ecf1dd899e73dd8a5581-Cell.scn"
               [remap]

path="res://.godot/exported/133200997/export-ce169da7a3e322d506335714d94b2af4-CloseButton.scn"
        [remap]

path="res://.godot/exported/133200997/export-339521e85f3b30700727370469b826d5-Controls.scn"
           [remap]

path="res://.godot/exported/133200997/export-265b7df489b411ff71b2244a7513a8b7-Dot.scn"
[remap]

path="res://.godot/exported/133200997/export-6455994a605b35b7d96f8362f3055c4a-Game.scn"
               [remap]

path="res://.godot/exported/133200997/export-2b7bab7fad407cbdf32d0d29a52e0175-Grid.scn"
               [remap]

path="res://.godot/exported/133200997/export-07859e86283ced63d2e7358ecc474bba-Highlight.scn"
          [remap]

path="res://.godot/exported/133200997/export-f36940fc95c3ba8574d837e3d59ab645-Hint.scn"
               [remap]

path="res://.godot/exported/133200997/export-9837c47c24cb4cc85361b27ec3c9cfb0-KillerCage.scn"
         [remap]

path="res://.godot/exported/133200997/export-2bc5638c5231be281ddca52f2062ecbe-Line.scn"
               [remap]

path="res://.godot/exported/133200997/export-b1a3d4fc27eff342b81f94e051d7a58e-Rule.scn"
               [remap]

path="res://.godot/exported/133200997/export-da1cf313d1d3029439d48924399e7ff5-RuleExplanation.scn"
    [remap]

path="res://.godot/exported/133200997/export-9ec6ea30cbdd459871f15b1db75bb8b9-WinScreen.scn"
          list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �֐1�(N}   res://Cell.tscn�췱_�D   res://CloseButton.tscn�q
Z���.   res://Controls.tscn��S{��u$   res://Dot.tscn��b$�kE   res://Game.tscn��u7�J   res://Grid.tscn]:���(�#   res://Highlight.tscn v-4N��C   res://Hint.tscn���9t�{c   res://icon.svg&ݲ���w   res://KillerCage.tscnP��~@i   res://Line.tscn���ؓ}8   res://Rule.tscn�/ugʖg   res://RuleExplanation.tscn��hsX�.|   res://WinScreen.tscn              ECFG      application/config/name         Sudoku     application/run/main_scene         res://Game.tscn    application/config/features   "         4.2    Mobile     application/config/icon         res://icon.svg     autoload/Global         *res://global.gd"   display/window/size/viewport_width      �  #   display/window/size/viewport_height      j     display/window/stretch/mode         canvas_items   display/window/stretch/aspect         keep_height    editor_plugins/enabled8   "      *   res://addons/coi_serviceworker/plugin.cfg   #   rendering/renderer/rendering_method         gl_compatibility2   rendering/environment/defaults/default_clear_color        �?  �?  �?  �?              