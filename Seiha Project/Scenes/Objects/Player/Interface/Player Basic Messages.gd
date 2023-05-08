extends Node

### REFERENCES

export(NodePath) var PlayerLocalizerPath
onready var PlayerLocalizer = get_node(PlayerLocalizerPath)

### INTERFACE

func Move():
	pass

func Jump():
	pass

func GetInput():
	pass

func StopMotion():
	pass
