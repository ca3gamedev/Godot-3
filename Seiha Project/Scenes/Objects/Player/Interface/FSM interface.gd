extends Node

### REFERENCES

export(NodePath) var PlayerLocalizerPath
onready var PlayerLocalizer = get_node(PlayerLocalizerPath)


### LOCAL VARIABLES

var previous_state = state.IDLE

enum state {
	IDLE, WALK, JUMP, RETURN,
}

var current = state.IDLE

### FUNCTIONS 

func GetStateName():
	return current.getName

func GetState():
	match(current):
		state.IDLE : return "IDLE"
		state.WALK : return "WALK"
		state.JUMP : return "JUMP"

func Update():
	match(current):
		state.IDLE : Idle()
		state.WALK : Walk()
		state.JUMP : Jump()
		state.RETURN : current = state.IDLE

func PhysicsUpdate():
	pass


func ChangeState(newstate):
	previous_state = current
	match(newstate):
		"IDLE" : current = state.IDLE
		"WALK" : current = state.WALK
		"JUMP" : current = state.JUMP
		"RETURN" : current = previous_state


### INTERFACE

func Idle():
	pass

func Walk():
	pass

func Jump():
	pass
