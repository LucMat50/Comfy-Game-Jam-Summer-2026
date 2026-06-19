extends Control

#VARIABLES
@onready var character_animation = $Character/AnimationPlayer
@onready var background_animation = $Background/AnimationPlayer

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	character_animation.play("beach")
	await get_tree().create_timer(3).timeout
	Dialogic.start("trail3right")

func _on_dialogic_signal(argument: String):
	character_animation.play(argument)
	
	if argument == "there":
		background_animation.play("chud")
	elif argument == "here":
		background_animation.play("chencho")
	elif argument == "yur":
		background_animation.play("chud")
		
	await Dialogic.timeline_ended
	await get_tree().create_timer(2).timeout
	character_animation.play("eating")
