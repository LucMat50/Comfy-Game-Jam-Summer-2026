extends Control

#VARIABLES
@onready var character_animation = $Character/AnimationPlayer
@onready var background_animation = $Background/AnimationPlayer

func _ready() -> void:
	character_animation.play("beach")
	await get_tree().create_timer(2).timeout
