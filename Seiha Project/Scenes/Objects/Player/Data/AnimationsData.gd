extends Node

enum Attack {
	WeakPunch, WeakKick, StrongPunch, StrongKick
}

onready var Attack1 = Attack.WeakPunch
onready var Attack2 = Attack.WeakKick
onready var Attack3 = Attack.StrongPunch
onready var Attack4 = Attack.StrongKick


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
