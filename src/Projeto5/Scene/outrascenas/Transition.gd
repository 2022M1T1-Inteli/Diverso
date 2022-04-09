extends CanvasLayer

onready var animation = $AnimationPlayer
var scene_to_go = ""

func fade_into(scene):
	scene_to_go = scene
	animation.play("Fade")
	
func change_scene():
	get_tree().change_scene(scene_to_go)
