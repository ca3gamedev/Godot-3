extends Node2D


export(NodePath) var PlayerDataLocalizerPath
onready var PlayerDataLocalizer = get_node(PlayerDataLocalizerPath)

export(NodePath) var PlayerCodeLocalizerPath
onready var PlayerCodeLocalizer = get_node(PlayerCodeLocalizerPath)
