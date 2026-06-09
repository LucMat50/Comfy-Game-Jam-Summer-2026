extends Area3D

#VARIABLES
var player = GameManager.player
var trigger: bool = false

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("player detected")
		chud_talks()

func chud_talks():
	Dialogic.start("TriggerTest")
	trigger = false
