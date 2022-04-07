extends Control
export var scene_to_go = ""

func _on_Quit_pressed():
	get_tree().quit()
func _on_SelecionarPersonagem_pressed() -> void:
	Transition.fade_into("res://SelecaoPersonagem.tscn")
	Globalpos.a=false
	Globalpos.npc1=false
	Globalpos.npc2=false
	Globalpos.npc3=false
	Globalpos.npc4=false
	Globalpos.npc5=false
	Globalpos.npc6=false
	Globalpos.npc7=false
	
