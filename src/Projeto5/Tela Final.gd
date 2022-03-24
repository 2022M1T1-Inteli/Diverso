extends Control
export var scene_to_go = ""

func _on_Quit_pressed():
	get_tree().quit()
func _on_SelecionarPersonagem_pressed() -> void:
	Transition.fade_into("res://SelecaoPersonagem.tscn")
