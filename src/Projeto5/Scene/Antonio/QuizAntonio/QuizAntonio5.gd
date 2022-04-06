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


func _on_opcao1_pressed() -> void:
	get_tree().change_scene("res://LabirintoAntônio.tscn") # Replace with function body.


func _on_opcao4_pressed() -> void:
	get_tree().change_scene("res://Scene/Antonio/FeedbackAntonio/Feedback5.tscn") # Replace with function body.
