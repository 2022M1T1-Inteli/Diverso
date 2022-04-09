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


func _on_voltar_pressed() -> void:
	get_tree().change_scene("res://Scene/outrascenas/SelecaoPersonagem.tscn") # Replace with function body.


func _on_continuar_pressed() -> void:
	Transition.fade_into("res://Scene/Gloria/LabirintoGlória.tscn") #transição de fade entre cenas
#	get_tree().change_scene("res://Labirinto.tscn") # Replace with function body. # esse código era o usado anteriormente resolvemos deixar apenas inativo
