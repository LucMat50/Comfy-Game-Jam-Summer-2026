extends Area3D

#VARIABLES
var player = GameManager.player
var trigger: bool = false
@export var current_chud: int = 0

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("player detected")
		chud_talks()

func chud_talks():
	Dialogic.start("TriggerTest")
	$CollisionShape3D.disabled = true
	trigger = false
