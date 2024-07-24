extends Node2D

var gb = Global.gb


func _ready():
	$GUI.hide()
	for i in range(1, 29):
		var j = get_node("Piece" + str(i) + "/Label" + str(i))
		j.margin_left = -35
		j.margin_top = -48
		j.margin_right = 36
		j.margin_bottom = 46
	
	updateLabels()


func updateLabels():
	gb = Global.gb
	var lenMax = 0
	var gbDat = gb.split("\n", true, 28)
	for i in range(1, 29):
		var j = get_node("Piece" + str(i) + "/Label" + str(i))
		j.text = gbDat[i-1]
		if len(gbDat[i-1]) > lenMax:
			lenMax = len(gbDat[i-1])
		
		if i == 28:
			if lenMax <= 1:
				get_node("Piece1/Label1").get("custom_fonts/font").set_size(52)
			elif lenMax == 2:
				get_node("Piece1/Label1").get("custom_fonts/font").set_size(42)
			elif lenMax == 3:
				get_node("Piece1/Label1").get("custom_fonts/font").set_size(32)
			elif lenMax == 4:
				get_node("Piece1/Label1").get("custom_fonts/font").set_size(22)
			elif lenMax >= 5:
				get_node("Piece1/Label1").get("custom_fonts/font").set_size(12)


func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	elif Input.is_action_just_pressed("file"):
		$GUI.show()


func _on_GUI_done():
	$GUI.hide()
	updateLabels()
	$Timer.updateTimer()
