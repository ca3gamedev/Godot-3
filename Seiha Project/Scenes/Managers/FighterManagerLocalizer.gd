extends Node2D

export(NodePath) var PlayerPath
onready var Player = get_node(PlayerPath)

export(NodePath) var BlueAreaPath
onready var BlueArea = get_node(BlueAreaPath)

export(NodePath) var RedAreaPath
onready var RedArea = get_node(RedAreaPath)
