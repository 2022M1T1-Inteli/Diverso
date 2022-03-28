extends Node

enum QuestionType { TEXT, IMAGE, VIDEO, AUDIO } 

export(Resource) var bd_quiz
export(Color) var color_right
export(Color) var color_wrong

var buttons := []
var index := 0

onready var question_text := $question_hud/Perguntas
onready var question_image := $question_hud/Panel/question_image
onready var question_video := $question_hud/Panel/question_video
onready var question_audio : = $question_hud/Panel/question_audio

func _ready() -> void:
	for _button in $question_holder.get_children():
		buttons.append(_button)
		
	load_quiz()

	
func load_quiz() -> void:
	if index >= bd_quiz.bd.size(): #Condição para quando acabarem as perguntas do banco de dados do quizz
		print("acabaram as perguntas")
		Transition.fade_into("res://Tela Final.tscn") # Trocar para a cena do labirinto
		return
		
	question_text.text = str(bd_quiz.bd[index].question_hud)
	for i in buttons.size():
		buttons[i].text = str(bd_quiz.bd[index].options[i])
		buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])
		
	match bd_quiz.bd[index].type:
		QuestionType.TEXT:
			$question_hud/Panel.hide()
		QuestionType.IMAGE:
			$question_hud/Panel.show() 
			question_image.texture = bd_quiz.bd[index].question_image
			 
		QuestionType.VIDEO:
			$question_hud/Panel.show()
			question_video.stream = bd_quiz.bd[index].question_video
			question_video.play()
		
		QuestionType.AUDIO:
			$question_hud/Panel.show()
			question_audio.stream = bd_quiz.bd[index].question_audio
			question_audio.play()
			
			
			
func buttons_answer(button) -> void:     #Função para quando o usuário apertar o quizz aparecer as cores de certo e errado.
	if bd_quiz.bd[index].correct == button.text:
		button.modulate = color_right
	else:
		button.modulate = color_wrong
		
	question_audio.stop()
	question_video.stop()
		
	yield(get_tree().create_timer(1), "timeout")
	for bt in buttons:
		bt.modulate = Color.white
		bt.disconnect("pressed", self, "buttons_answer")
			
	question_audio.stream = null    #Parar o áudio da pergunta
	question_video.stream = null    #Parar o vídeo da pergunta
			
	if bd_quiz.bd[index].correct == button.text:   #Quando uma pergunta do banco de dados é respondida corretamente ele movimenta para a próxima pergunta
		index += 1
	load_quiz()
		
