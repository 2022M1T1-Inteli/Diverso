extends StaticBody2D
 #movimento automatico e repetitivo do carro pela tela (no início)
var flip=true
var posicaoInicial
var posicaoFinal

func _ready():
	posicaoInicial = $".".position.y-400
	posicaoFinal = posicaoInicial+1000
		

func _process(delta):
	if(posicaoInicial <= posicaoFinal and flip): #permite a repetição do movimento do carro infinitamente
		$".".position.y += 2
		position.x=-105
		$Sprite.flip_v = false
		if ($".".position.y >= posicaoFinal):
			flip = false

	if($".".position.y >= posicaoInicial and !flip): 
		$".".position.y -= 2
		position.x=-190
		$Sprite.flip_v = true
		if ($".".position.y <= posicaoInicial):
			flip = true
