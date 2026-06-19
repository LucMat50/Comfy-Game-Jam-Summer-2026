extends Control

#VARIABLES
@onready var animation = $Character/AnimationPlayer
var level1 = preload("res://Scenes/level1/level1.tscn")

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	animation.play("ChudTalks")
	await get_tree().create_timer(1).timeout
	Dialogic.start("opening")

func _on_dialogic_signal(argument: String):
	if argument == "ended":
		await get_tree().create_timer(1).timeout
		animation.play("Beginning")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_packed(level1)
	elif argument == "ChudTalk":
		animation.play("ChudTalks")
	elif argument == "ChenchoTalk":
		animation.play("ChenchoTalks")

		
