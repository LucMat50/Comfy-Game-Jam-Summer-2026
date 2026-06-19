extends Area3D

@export var next_level: String

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("player detected")
		get_tree().change_scene_to_file(next_level)
