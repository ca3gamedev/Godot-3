extends Node2D

onready var id = 0
export(bool) var menuvisible =  false
onready var MaxAttacks = References.PlayerAttacks.MaxAttacks
onready var id_attack = 0

func _ready():
	pass

func _process(delta):
	
	if menuvisible:
		CheckHInput()
		UpdateButton()
		CheckCurrentButtonSkill()
		CheckVInput()
		UpdateSkillLabel()
		SetCurrentButtonSkill()


func CheckHInput():
	if Input.is_action_just_released("LEFT"):
		if id >= 1:
			id -= 1
	if Input.is_action_just_released("RIGHT"):
		if id <= 2:
			id += 1

func UpdateButton():
	match(id):
		0 :  $"Button Name".text = "A Button"
		1 : $"Button Name".text = "B Button"
		2 : $"Button Name".text = "C Button"
		3 : $"Button Name".text = "D Button"

func CheckCurrentButtonSkill():
	var name = References.PlayerK.GetCurrentSkill(GetButton())
	$"Current skill".text = name

func GetButton():
	match(id):
		0 : return "A"
		1 : return "B"
		2 : return "C"
		3 : return "D"

func CheckVInput():
	if Input.is_action_just_released("JUMP"):
		if id_attack >= 1:
			id_attack -= 1
	if Input.is_action_just_released("DOWN"):
		if id_attack <= MaxAttacks:
			id_attack += 1

func UpdateSkillLabel():
	$"Skill Name".text = References.PlayerAttacks.GetAttackID(id_attack)

func SetCurrentButtonSkill():
	if Input.is_action_just_released("A"):
		References.PlayerAttacks.SetAttack(GetButton(), id_attack)
