extends Node

enum Attack {
	WeakPunch, WeakKick, StrongPunch, StrongKick
}

onready var Attack1 = Attack.WeakPunch
onready var Attack2 = Attack.WeakKick
onready var Attack3 = Attack.StrongPunch
onready var Attack4 = Attack.StrongKick
onready var MaxAttacks = 2


func GetAttackNameOfSlot(slot):
	
	match(slot):
		"A" : return GetAttackName(Attack1)
		"B" : return GetAttackName(Attack2)
		"C" : return GetAttackName(Attack3)
		"D" : return GetAttackName(Attack4)

func GetAttackId(slot):
	match(GetAttackNameOfSlot(slot)):
		"Weak Punch" : return 0
		"Weak Kick" : return 1
		"Strong Punch" : return 2
		"Strong Kick" : return 3

func GetAttackName(id):
	match(id):
		Attack.WeakPunch : return "Weak Punch"
		Attack.WeakKick : return "Weak Kick"
		Attack.StrongPunch : return "Strong Punch"
		Attack.StrongKick : return "Strong Kick"

func EndAnim():
	$"%Data".EndAnim = true
	
func GetAttackID(id):
	var name = "null"
	match(id):
		0: name = "Weak Punch"
		1: name = "Weak Kick"
		2: name = "Strong Punch"
		3: name = "Strong Kick"
	return name

func SetAttack(button, id):
	
	var new_id = GetAttackID(id)
	
	match(button):
		"A" : Attack1 = GetAttackEnum(new_id)
		"B" : Attack2 = GetAttackEnum(new_id)
		"C" : Attack3 = GetAttackEnum(new_id)
		"D" : Attack4 = GetAttackEnum(new_id)

func GetAttackEnum(id):
	match(id):
		"Weak Punch" : return Attack.WeakPunch
		"Weak Kick"  : return Attack.WeakKick
		"Strong Punch" : return Attack.StrongPunch
		"Strong Kick" : return Attack.StrongKick
