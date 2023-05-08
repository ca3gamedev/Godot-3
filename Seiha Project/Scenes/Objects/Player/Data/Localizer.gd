extends KinematicBody2D

## REFERENCES

export(NodePath) var PlayerKinematicPath
onready var PlayerKinematic = get_node(PlayerKinematicPath)

export(NodePath) var PlayerSpritePath
onready var PlayerSprite = get_node(PlayerSpritePath)
