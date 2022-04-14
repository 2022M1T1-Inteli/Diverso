extends Control

func _process(delta):
	if Input.is_action_pressed("ui_esc"):
		visible = true
		get_tree().paused = true
		

func _on_continue_pressed():
	hide()
	get_tree().paused = false


func _on_quit_pressed():
	get_tree().paused = false
	Globalpos.a=false
	Globalpos.npc1=false
	Globalpos.npc2=false
	Globalpos.npc3=false
	Globalpos.npc4=false
	Globalpos.npc5=false
	Globalpos.npc6=false
	Globalpos.npc7=false
	Globalpos.star=true
	Globalpos.objective=""
	get_tree().change_scene("res://SelecaoPersonagem.tscn")


#func _on_Button_pressed():
	#visible = true
	#get_tree().paused = true
