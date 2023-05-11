extends KinematicBody2D

## REFERENCES

export(NodePath) var PlayerKinematicPath
onready var PlayerKinematic = get_node(PlayerKinematicPath)


## GET SETTERS

func GetSpeed():
	return $AnimData.playerspeed

func GetState():
	return $AnimData.treestate

func GetAnim():
	return $AnimationTree
