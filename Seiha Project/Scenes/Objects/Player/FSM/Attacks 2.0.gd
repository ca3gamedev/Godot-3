extends Node

var Attack = {
	"WeakPunch" : 0, "WeakKick" : 1, "StrongPunch" : 2, "StrongKick" : 3
}

onready var Attack1 = 0
onready var Attack2 = 1
onready var Attack3 = 2
onready var Attack4 = 3
onready var MaxAttacks = 2

func GetAttackNameOfSlot(slot):
	
	match(slot):
		"A" : return Attack.keys()[Attack1]
		"B" : return Attack.keys()[Attack2]
		"C" : return Attack.keys()[Attack3]
		"D" : return Attack.keys()[Attack4]

func GetAttackName(id):
	return Attack.keys()[id]

func EndAnim():
	$"%Data".EndAnim = true
	
func GetAttackID(id):
	match(id):
		"A" : return Attack.values()[Attack1]
		"B" : return Attack.values()[Attack2]
		"C" : return Attack.values()[Attack3]
		"D" : return Attack.values()[Attack4]

func SetAttack(button, id):
	match(button):
		"A" : Attack1 = id
		"B" : Attack2 = id
		"C" : Attack3 = id
		"D" : Attack4 = id

func GetAttackEnum(id):
	return Attack[id]
