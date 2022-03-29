extends Control

var a = -1

func _process(delta):
	
	if Input.is_action_just_pressed("ui_esq"):
		a *= -1
		
	if a == 1:
		show()
		
	if a == -1:
		hide() 
