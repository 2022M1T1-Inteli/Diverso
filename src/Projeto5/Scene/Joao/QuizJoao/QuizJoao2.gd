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


func _on_opcao2_pressed() -> void:
	get_tree().change_scene("res://Scene/Joao/FeedbackJoao/FeedbackJoao2.tscn") # Replace with function body.


func _on_opcao1_pressed() -> void:
	Transition.fade_into("res://LabirintoJoao.tscn") # Replace with function body.
