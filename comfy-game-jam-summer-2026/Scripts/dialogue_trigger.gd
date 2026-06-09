extends Area3D

#VARIABLES
var player = GameManager.player
var trigger: bool = false

func _physics_process(delta: float) -> void:
	print(trigger)

func _on_body_entered(body: Node3D) -> void:
	if body == player:
		trigger = true

func _chud_talks():
	if trigger == true:
		Dialogic.start("TriggerTest")
		trigger = false
