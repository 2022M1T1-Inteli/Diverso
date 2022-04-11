extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_Dixie_body_entered')
	connect("body_exited", self, '_on_Dixie_body_exited')

func _on_Dixie_body_entered(body):
	if body.name == "Jogador" and Globalpos.npc2 and Globalpos.star or (Globalpos.npc3 and Globalpos.star==false):
		active = true

func _on_Dixie_body_exited(body):
	if body.name == "Jogador":
		active = false

func _process(delta): 
	$Pointdi.visible=active
	$Pointdi2.visible=active
	if Globalpos.npc2==false or Globalpos.star==false:
		$Estrelada1.visible = false
	elif Globalpos.npc2 and Globalpos.star:
		$Estrelada1.visible = true

	if Globalpos.npc3==false or Globalpos.star:
		$Estrelada2.visible=false
	elif Globalpos.npc3 and Globalpos.star==false:
		$Estrelada2.visible = true

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and Globalpos.npc2 and Globalpos.star and active:
			get_tree().paused = true
			var dialog = Dialogic.start('Dixiei')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			Transition.fade_into("res://Scene/Isabela/QuizIsabela/QuizIsabela2.tscn")
		if event.is_action_pressed("ui_accept") and Globalpos.npc3 and Globalpos.star==false and active:
			Transition.fade_into("res://Perguntasdixie.tscn")
			
func unpause(timeline_timeline1):
	get_tree().paused = false
