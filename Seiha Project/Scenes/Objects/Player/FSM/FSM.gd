extends Node


enum state {
	IDLE, WALK, JUMP, FALL, BaseAttack,
}

export(state) var current = state.IDLE

func _process(delta):
	
	match(current):
		state.IDLE : $Code.IDLE()
		state.WALK : $Code.WALK(delta)
		state.JUMP : $Code.JUMP(delta)
		state.FALL : $Code.FALL(delta)
		state.BaseAttack : $Code.BaseAttack()
