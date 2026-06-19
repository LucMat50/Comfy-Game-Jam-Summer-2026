extends Control

#VARIABLES
@onready var animation = $Character/AnimationPlayer

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	animation.play("ChudTalks")
	await get_tree().create_timer(1).timeout
	Dialogic.start("opening")

func _on_dialogic_signal(argument: String):
	if argument == "ChudTalk":
		animation.play("ChudTalks")
	elif argument == "ChenchoTalk":
		animation.play("ChenchoTalks")
		await Dialogic.timeline_ended
		await get_tree().create_timer(1).timeout
		animation.play("Beginning")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://Scenes/level1/level1.tscn")
