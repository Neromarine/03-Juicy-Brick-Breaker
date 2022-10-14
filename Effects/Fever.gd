extends Node2D

func start_fever():
	fever()
	var Shader1 = get_node_or_null("/root/Game/Shader")
	if Shader1 != null:
		Shader1.use_parent_material = false
	var FeverBar = get_node_or_null("/root/Game/UI/HUD/Fever")
	if FeverBar != null:
		FeverBar.use_parent_material = false
	var Background = get_node_or_null("/root/Game/Background")
	if Background != null:
		Background.modulate.a = 0.5
	
	$Timer.start()

func end_fever():
	pass

func _on_Timer_timeout():
	if Global.feverish:
		fever()
		$Timer.start()
	else:
		end_fever()
		var Shader1 = get_node_or_null("/root/Game/Shader")
		if Shader1 != null:
			Shader1.use_parent_material = true
		var FeverBar = get_node_or_null("/root/Game/UI/HUD/Fever")
		if FeverBar != null:
			FeverBar.use_parent_material = true

func fever():
	var ball_container = get_node_or_null("/root/Game/Ball_Container")
	if ball_container != null:
		ball_container.make_ball_fever()
