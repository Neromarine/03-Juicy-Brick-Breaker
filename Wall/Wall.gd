extends StaticBody2D

onready var Explosion = load("res://Effects/Explosion.tscn")

var decay = 0.01

func _ready():
	pass

func _physics_process(_delta):
	if $ColorRect.color.s > 0:
		$ColorRect.color.s -= decay
	if $ColorRect.color.v < 1:
		$ColorRect.color.v += decay

func hit(ball):
	$ColorRect.color = Color8(0,0,0)
	var WallAudio = get_node_or_null("/root/Game/WallAudio")
	if WallAudio != null:
		WallAudio.play()
	var Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var explosion = Explosion.instance()
		Effects.add_child(explosion)
		explosion.global_position = ball.global_position
		
