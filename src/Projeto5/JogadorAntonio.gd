extends KinematicBody2D
var SPEED = 150
#150
var velocity = Vector2.ZERO

func _ready():
		set_position(Globalpos.position)
		if Globalpos.a==false:
			$AnimationPlayer.play("Chegada")

func _physics_process(delta):
	if Globalpos.a == true:
		var motion = Vector2.ZERO
		motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		motion = motion.normalized()
		#movimentação do personagem principal pelos eixos x e y 
		
		if Input.is_action_pressed("ui_right"):
			$AnimatedSprite.play("Run")
			$AnimatedSprite.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			$AnimatedSprite.play("Run")
			$AnimatedSprite.flip_h = true
		elif Input.is_action_pressed("ui_up"):
			$AnimatedSprite.play("Up")
		elif Input.is_action_pressed("ui_down"):
			$AnimatedSprite.play("Down")
		else:
			$AnimatedSprite.play("Idle")

		if motion != Vector2.ZERO:
			velocity = motion * SPEED
		else:
			velocity = Vector2.ZERO

		var actualPosition = get_position() #Pegar a posição do personagem e salvar
		Globalpos.position = Vector2(actualPosition) #Utilizar a variável global para salvar pegar a posição em outros scripts
		move_and_slide(velocity)

func _on_AnimationPlayer_animation_finished(anim_name):
	Globalpos.a = true

