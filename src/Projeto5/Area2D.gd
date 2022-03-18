extends Area2D

var pode_abrir=false
var aberta=false

func _ready():
	set_process(true)
	set_process_input(true)
	
	connect("body_entered", self, "entrou")
	connect("body_exited", self, "saiu")
	
	
func _process(delta):
	if pode_abrir and not aberta:
		abrir()

	if not pode_abrir and aberta==true:
		fechar()


func entrou(event):
	if event.get_name() == "Jogador":
		print(event.get_name())
		pode_abrir=true


func saiu(event):
	if event.get_name() == "Jogador":
		print(event.get_name())
		pode_abrir=false


func abrir():
	$AnimatedSprite.play("Abrir")
	aberta = true


func fechar():
	$AnimatedSprite.play("Fechar")
	aberta = false
