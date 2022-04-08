extends Area2D

var open=false
var opened=false

func _ready():
	set_process(true)
	set_process_input(true)
	
	connect("body_entered", self, "entrou")
	connect("body_exited", self, "saiu")
	
	
func _process(delta):
	if open and not opened:
		open()

	if not open and opened==true:
		close()


func enter(event):
	if event.get_name() == "Jogador":
		open=true


func exit(event):
	if event.get_name() == "Jogador":
		opened=false


func open():
	$AnimatedSprite.play("Abrir")
	opened = true


func close():
	$AnimatedSprite.play("Fechar")
	opened = false
