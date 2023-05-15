extends Node

onready var state_machine = $"../AnimationTree"["parameters/playback"]

export(bool) var Hurt
export(Vector2) var hurtspeed

func _ready():
	pass

func _process(delta):
	$"../".move_and_collide(hurtspeed * delta)

func Hit():
	state_machine.travel("HIT")
