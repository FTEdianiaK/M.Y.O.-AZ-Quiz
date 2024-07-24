extends CanvasLayer

signal done
var gb = Global.gb
var t = Global.t


func _on_GUI_visibility_changed():
	gb = Global.gb
	t = Global.t
	$GbEdit.text = gb
	$TimerEdit.value = int(t)


func _on_TimerEdit_value_changed(value):
	t = str($TimerEdit.value)
	$TimerData.text = t


func _on_Apply_pressed():
	Global.gb = $GbEdit.text
	Global.t = str($TimerEdit.value)
	emit_signal("done")
