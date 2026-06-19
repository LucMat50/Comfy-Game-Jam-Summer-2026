extends Area3D

#VARIABLES
var player = GameManager.player
var trigger: bool = false


@export var current_chud: int = 0
@export var dialog_to_play : String = "TriggerTest"
@export var state_to_update : String

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("player detected")
		chud_talks()
		if state_to_update != "":
			StateManager.updateState(state_to_update)

func chud_talks():
	Dialogic.start(dialog_to_play)
	$CollisionShape3D.disabled = true
	trigger = false
