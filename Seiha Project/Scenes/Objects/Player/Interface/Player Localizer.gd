extends Node

### REFERENCES

export(NodePath) var FSMPath
onready var FSM = get_node(FSMPath)

export(NodePath) var PlayerDataPath
onready var PlayerData = get_node(PlayerDataPath)

export(NodePath) var PlayerMessagesPath
onready var PlayerMessages = get_node(PlayerMessagesPath)

export(NodePath) var PlayerDataLocalizerPath
onready var PlayerDataLocalizer = get_node(PlayerDataLocalizerPath)

export(NodePath) var PlayerManagerLocalizerPath
onready var PlayerManagerLocalizer = get_node(PlayerManagerLocalizerPath)
