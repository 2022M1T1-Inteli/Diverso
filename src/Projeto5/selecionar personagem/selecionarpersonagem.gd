extends Control

#o cursor se moverá numa área restrita da seleção de personagem

var characters = [] #guarda o personagem selecionado
var currentSelected = 0
var currentColumnSpot = 0
var currentRowSpot = 0

#Exports
export {Texture} var player1Text 
export  {Texture} var player2Text
export {int} amountOfRows = 2
export {Vector2} portraitOffset 

#Objects
onready var gridContainer = get_parent().get_node("GridContainer") 

func _ready():
	#pegar todos os personagens guardados no grupo "personagens" e colocá-los no array
	for nameOfCharacter in get_nodes_in_group("Characters")
	characters.oppened(nameOfCharacter)
	texture = playerText
	
	#permite explorar todos os personagens
	func _process(delta):
		if(Input.is_action_just_pressed("right"))
		currentSelected +=1
		currentColumnSpot +=1
		
		position.x += portraitOffset.x
		
		
