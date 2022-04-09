extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
#func _on_Start_pressed():
#	Transition.fade_into("res://personagemgloria.tscn")

func _on_Gloria_pressed() -> void:
	Transition.fade_into("res://personagemgloria.tscn")
#	get_tree().change_scene("res://personagemgloria.tscn") # esse código era o usado anteriormente resolvemos deixar apenas inativo


func _on_Button5_pressed() -> void:
	Transition.fade_into("res://personagemjoao.tscn")
	
	


func _on_Button4_pressed() -> void:
	Transition.fade_into("res://personagemisabela.tscn")
	


func _on_Button2_pressed() -> void:
	Transition.fade_into("res://personagemlucas.tscn")
	


func _on_Button6_pressed() -> void:
	Transition.fade_into("res://personagemana.tscn")


func _on_Button3_pressed() -> void:
	Transition.fade_into("res://personagemantonio.tscn")
