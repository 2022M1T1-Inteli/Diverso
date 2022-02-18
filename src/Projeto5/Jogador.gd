extends KinematicBody2D

const SPEED = 300
var motion = Vector2()

func _physics_process(delta):

	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_up"):
		motion.y = -SPEED
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("ui_down"):
		motion.y = SPEED
		$AnimatedSprite.play("Run")
	else:
		motion.x = 0
		motion.y = 0
		$AnimatedSprite.play("Idle")
	
	motion = move_and_slide(motion)
