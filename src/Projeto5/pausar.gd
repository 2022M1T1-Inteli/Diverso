extends Control

var a = -1

func _process(delta):
	
	if Input.is_action_just_pressed("ui_esq"):
		a *= -1
		
	if a == 1:
		show()
		get_tree().paused = true
		
	if a == -1:
		hide() 
		get_tree().paused = false


func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Menu2.tscn")
