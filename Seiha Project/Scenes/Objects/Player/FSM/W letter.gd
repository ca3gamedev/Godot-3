extends Node

export(bool) var DebugMode = true

func _ready():
	ChangeVisibility()


func _process(delta):
	
	if Input.is_action_just_released("W"):
		ChangeVisibility()


func ChangeVisibility():
	DebugMode = !DebugMode
	
	$"%Hitbox Attack".visible = DebugMode
	$"%Hitbox Body".visible = DebugMode
