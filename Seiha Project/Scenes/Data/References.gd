extends Node

onready var PlayerK  = get_tree().get_root().get_node("Game/Game/Viewport/BattleScene/FighterManagers/Player/PlayerK")

onready var LevelData = get_tree().get_root().get_node("Game/Game/Viewport/BattleScene/FighterManagers/LevelManager/LevelDATA")

onready var PlayerD = get_tree().get_root().get_node("Game/Game/Viewport/BattleScene/FighterManagers/Player/PlayerK/FSM/Data")

onready var FighterManager  = get_tree().get_root().get_node("Game/Game/Viewport/BattleScene/FighterManagers")


onready var PlayerAttacks = get_tree().get_root().get_node("Game/Game/Viewport/BattleScene/FighterManagers/Player/PlayerK/FSM/Attacks")
