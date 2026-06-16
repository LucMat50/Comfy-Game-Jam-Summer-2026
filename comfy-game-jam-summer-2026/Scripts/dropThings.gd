extends Node3D

#snap every "thing" to the ground
func _ready():
	for child in get_children():
		if child is Node3D:
			snap_to_ground(child)

#spawn the tree in the sky and raycast it to the ground
func snap_to_ground(tree: Node3D):
	var start = tree.global_position + Vector3.UP * 1000
	var end = tree.global_position + Vector3.DOWN * 1000
	var query = PhysicsRayQueryParameters3D.create(start, end)
	var result = get_world_3d().direct_space_state.intersect_ray(query)
	if result:
		tree.global_position = result.position
