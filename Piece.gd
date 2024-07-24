extends Node2D

var m
var c


func _ready():
	c = 1


func _process(delta):
	if m == true:
		if Input.is_action_just_pressed("white"):
			c = 1
			$Area2D/Hexagon.self_modulate = "FFFFFF"
			$Area2D/Outline.self_modulate = "F2F2F2"
		elif Input.is_action_just_pressed("grey"):
			c = 2
			$Area2D/Hexagon.self_modulate = "999999"
			$Area2D/Outline.self_modulate = "8C8C8C"
		elif Input.is_action_just_pressed("red"):
			c = 3
			$Area2D/Hexagon.self_modulate = "FF8833"
			$Area2D/Outline.self_modulate = "FF791A"
		elif Input.is_action_just_pressed("blue"):
			c = 4
			$Area2D/Hexagon.self_modulate = "3355FF"
			$Area2D/Outline.self_modulate = "1A40FF"
		elif Input.is_action_just_pressed("interact"):
			c += 1
			if c == 2:
				$Area2D/Hexagon.self_modulate = "999999"
				$Area2D/Outline.self_modulate = "8C8C8C"
			if c == 3:
				$Area2D/Hexagon.self_modulate = "FF8833"
				$Area2D/Outline.self_modulate = "FF791A"
			if c == 4:
				$Area2D/Hexagon.self_modulate = "3355FF"
				$Area2D/Outline.self_modulate = "1A40FF"
			if c == 5:
				c = 1
				$Area2D/Hexagon.self_modulate = "FFFFFF"
				$Area2D/Outline.self_modulate = "F2F2F2"


func _on_Area2D_mouse_entered():
	m = true
	$Area2D/Outline.hide()


func _on_Area2D_mouse_exited():
	m = false
	$Area2D/Outline.show()
