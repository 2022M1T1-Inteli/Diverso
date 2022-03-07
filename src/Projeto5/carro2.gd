extends StaticBody2D

var flip=false
var posicao_inicial
var posicao_final

func _ready():
	posicao_inicial = $".".position.y-750
	posicao_final = posicao_inicial+800
		

func _process(delta):
	if(posicao_inicial <= posicao_final and flip):
		$".".position.y += 2
		position.x=-105
		$Sprite.flip_v = false
		if ($".".position.y >= posicao_final):
			flip = false

	if($".".position.y >= posicao_inicial and !flip):
		$".".position.y -= 2
		position.x=-190
		$Sprite.flip_v = true
		if ($".".position.y <= posicao_inicial):
			flip = true

