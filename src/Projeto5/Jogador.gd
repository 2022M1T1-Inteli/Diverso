extends KinematicBody2D
var SPEED = 300
var velocity = Vector2.ZERO
var animacao = false

func _ready():
	if animacao == false:
		set_position(Globalpos.Position)
		$AnimatedSprite/AnimationPlayer.play("Chegada")
		animacao=true

func _physics_process(delta):
	if Globalpos.a == true:
		var motion = Vector2.ZERO
		motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		motion = motion.normalized()
		
		
		if motion != Vector2.ZERO:
			velocity = motion * SPEED
		else:
			velocity = Vector2.ZERO

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
 #movimentação do personagem principal pelos eixos x e y 
 #o personagem pode se movimentar em diagonal
#	if Input.is_action_pressed("ui_right"): #movimento do personagem para direita
#		motion.x = SPEED
#		$AnimatedSprite.play("Run")
#		$AnimatedSprite.flip_h = false
#	elif Input.is_action_pressed("ui_left"): #moviemento do personagem para esquerda
#		motion.x = -SPEED
#		$AnimatedSprite.play("Run")
#		$AnimatedSprite.flip_h = true
#	elif Input.is_action_pressed("ui_up"): #movimento do personagem para cima
#		motion.y = -SPEED
#		$AnimatedSprite.play("Up")
#	elif Input.is_action_pressed("ui_down"): #movimento do personagem para baixo
#		motion.y = SPEED
#		$AnimatedSprite.play("Down")
#	else:
#		motion.x = 0
#		motion.y = 0
#		$AnimatedSprite.play("Idle") 
	var actualPosition = get_position() #Pegar a posição do personagem e salvar
	Globalpos.Position = Vector2(actualPosition) #Utilizar a variável global para salvar pegar a posição em outros scripts
	move_and_slide(velocity)



func _on_AnimationPlayer_animation_finished(anim_name):
	Globalpos.a = true
	pass # Replace with function body.
