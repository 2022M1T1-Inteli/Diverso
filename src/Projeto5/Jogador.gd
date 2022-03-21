extends KinematicBody2D

const SPEED = 1000
var motion = Vector2()

func _ready():
	set_position(Globalpos.Position)

func _physics_process(delta):
 #movimentação do personagem principal pelos eixos x e y 
 #o personagem pode se movimentar em diagonal
	if Input.is_action_pressed("ui_right"): #movimento do personagem para direita
		motion.x = SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"): #moviemento do personagem para esquerda
		motion.x = -SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_up"): #movimento do personagem para cima
		motion.y = -SPEED
		$AnimatedSprite.play("Up")
	elif Input.is_action_pressed("ui_down"): #movimento do personagem para baixo
		motion.y = SPEED
		$AnimatedSprite.play("Down")
	else:
		motion.x = 0
		motion.y = 0
		$AnimatedSprite.play("Idle")
	var actualPosition = get_position() #Pegar a posição do personagem e salvar
	Globalpos.Position = Vector2(actualPosition) #Utilizar a variável global para salvar pegar a posição em outros scripts
	motion = move_and_slide(motion)
