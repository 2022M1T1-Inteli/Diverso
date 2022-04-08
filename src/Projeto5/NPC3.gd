extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')

func _on_NPC_body_entered(body):
	if body.name == "Jogador" and Globalpos.npc3:
		active = true

func _process(delta):
	$Point.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('timeline3')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			Globalpos.npc4 = true

func unpause(timeline_timeline1):
	get_tree().paused = false
	#direcionando o jogador para o quiz
	Globalpos.objective = "Vá para o RH"
	Transition.fade_into("res://Scene/Gloria/QuizGloria/QuizGloria2.tscn")

func _on_NPC_body_exited(body):
	if body.name == "Jogador":
		active = false
