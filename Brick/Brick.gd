extends StaticBody2D

var score = 0
var new_position = Vector2.ZERO
var dying = false

export var sway_amplitude = 3.0
var randomizer = Vector2.ZERO
var powerup_prob = 0.1

func _ready():
	randomize()
	position = new_position

func _physics_process(_delta):
	if dying and $Money.emitting == false:
		queue_free()
func hit(_ball):
	die()

func die():
	var Audio = get_node_or_null("/root/Game/Brick_Container/Brick/Audio")
	if Audio != null:
		Audio.play()
	dying = true
	collision_layer = 0
	$ColorRect.hide()
	$Money.emitting = true
	Global.update_score(score)
	if not Global.feverish:
		Global.update_fever(score)
	get_parent().check_level()
	
	if randf() < powerup_prob:
		var Powerup_Container = get_node_or_null("/root/Game/Powerup_Container")
		if Powerup_Container != null:
			var Powerup = load("res://Powerups/Powerup.tscn")
			var powerup = Powerup.instance()
			powerup.position = position
			Powerup_Container.call_deferred("add_child", powerup)
