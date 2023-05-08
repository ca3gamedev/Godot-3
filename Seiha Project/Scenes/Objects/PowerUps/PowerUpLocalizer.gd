extends Node2D

### REFERENCES

export(NodePath) var CodePath
onready var Code = get_node(CodePath)

export(NodePath) var PlayerPath
onready var Player = get_node(PlayerPath)

export(NodePath) var FighterManagersPath
onready var FighterManager = get_node(FighterManagersPath)
