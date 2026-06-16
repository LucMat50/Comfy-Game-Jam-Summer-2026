extends Node3D

@export var player : Node3D
var currentPath : Path3D
var paths : Array[Path3D] = [] 
var currentPathIndex = 0
var pathTangent : Vector3
var startingPathIndex = 0


# stores all the paths in a single array
func _ready() -> void:
	print("Now populating path list")
	populatePaths()

func _process(delta: float) -> void:
	pathTangent = getPathTangent()
	player.setForwadDirection(pathTangent)
	
func populatePaths() -> void:
	for PathManager_child in get_children():
		if PathManager_child is Path3D:
			paths.append(PathManager_child)
	currentPath = paths[startingPathIndex]
	if currentPath == null:
		push_error("Cannot find starting path: add a Curve2D as a child to PathManager")
	else:
		print("Current starting path:", currentPath.name)
	
func getPathTangent() -> Vector3:
	var curve = currentPath.curve
	var offset = curve.get_closest_offset(player.position)
	return -curve.sample_baked_with_rotation(offset, true).basis.z
	
	
#Moves left +1 like binary tree
func moveLeft() -> void:
	currentPathIndex += 1
	if currentPathIndex > paths.size():
		push_error("No path exists in PathManager Node: add a Curve2D to path manager")
	currentPath = paths[currentPathIndex]

#Moves right +2 like binary tree
func moveRight() -> void:
	currentPathIndex += 2
	if currentPathIndex > paths.size():
		push_error("No path exists in PathManager Node: add a Curve2D to path manager")
		currentPath = paths[currentPathIndex]
	
func choosePath() -> void:
	print("Now Choosing...")
	
	
