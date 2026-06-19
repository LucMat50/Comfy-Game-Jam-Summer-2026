extends Control

#VARIABLES
@onready var animation = $Character/AnimationPlayer

func _ready() -> void:
	animation.play("hell")
	await get_tree().create_timer(3).timeout
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("trail3left")

func _on_dialogic_signal(argument: String):
	animation.play(argument)
	await Dialogic.timeline_ended
	await get_tree().create_timer(1).timeout
	animation.play("idle")
	await get_tree().create_timer(2).timeout
	animation.play("fire")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fire":
		animation.play("fire_idle")
		await get_tree().create_timer(4).timeout
		get_tree().change_scene_to_file("res://Scenes/UI/game_over.tscn")
