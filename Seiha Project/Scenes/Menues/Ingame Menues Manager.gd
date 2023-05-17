extends Node2D

func _ready():
	$"Power Ups Menue".visible = false


func _process(delta):
	if Input.is_action_just_released("Skill Menue"):
		$"Power Ups Menue".visible = !$"Power Ups Menue".visible
		get_tree().paused = $"Power Ups Menue".visible
		$"Power Ups Menue".menuvisible = $"Power Ups Menue".visible
