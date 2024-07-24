extends Node2D

var frame
var t = int(Global.t)
var m


func _ready():
	frame = 4
	$Area2D/Clock.frame = frame
	updateTimer()

func updateTimer():
	t = int(Global.t)
	t = t/4


func _process(delta):
	if Input.is_action_just_pressed("timer"):
		$Countdown.start(t)
		frame = 0
		$Area2D/Clock.frame = frame
	if m == true:
		if Input.is_action_just_pressed("interact"):
			$Countdown.start(t)
			frame = 0
			$Area2D/Clock.frame = frame


func _on_Countdown_timeout():
	frame += 1
	if frame <= 4:
		$Area2D/Clock.frame = frame
	elif frame == 5:
		$Countdown.stop()


func _on_Area2D_mouse_entered():
	m = true


func _on_Area2D_mouse_exited():
	m = false
