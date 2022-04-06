extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')

func _on_NPC_body_entered(body):
	if body.name == "Jogador" and (Globalpos.npc1 or Globalpos.npc6):
		active = true

func _process(delta):
	$Point.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			if Globalpos.npc1 and Globalpos.npc6==false:
				get_tree().paused = true
				var dialog = Dialogic.start('timeline1')
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				Globalpos.npc2 = true
			if Globalpos.npc6:
				get_tree().paused = true
				var dialog = Dialogic.start('timeline7')
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				Globalpos.npc7 = true

func unpause(timeline_timeline1):
	get_tree().paused = false
	#direcionando o jogador para o quiz
	if Globalpos.npc6 == false:
		Globalpos.Objetivo = "Vá para o RH"
		Transition.fade_into("res://Scene/Gloria/QuizGloria/QuizGloria1.tscn")
	if Globalpos.npc6:
		Globalpos.Objetivo = "Vá para a sala Lager"
		Transition.fade_into("res://Scene/Gloria/QuizGloria/QuizGloria4.tscn")

func _on_NPC_body_exited(body):
	if body.name == "Jogador":
		active = false
