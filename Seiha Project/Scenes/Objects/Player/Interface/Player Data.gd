extends Node

### REFERENCES

export(NodePath) var PlayerLocalizerPath
onready var PlayerLocalizer = get_node(PlayerLocalizerPath)

### LOCAL DATA

export(float) var x_speed = 10
export(float) var jump_speed = 20
export(float) var gravity = 1
export(bool) var isright
export(float) var inertia = 0
export(float) var x_direction = 0
export(bool) var onground = true
export(float) var min_fall_speed
var x_powerup = 1
