extends Node

### REFERENCES

export(NodePath) var PlayerLocalizerPath
onready var PlayerLocalizer = get_node(PlayerLocalizerPath)

### FUNCTIONS

func _process(delta):
	PlayerLocalizer.FSM.Update()
	
func _physics_process(delta):
	PlayerLocalizer.FSM.PhysicsUpdate()
