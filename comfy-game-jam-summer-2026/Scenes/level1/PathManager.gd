extends Node3D

@export var player : Node3D
var currentPath : Path3D
var leftPath : Path3D
var rightPath : Path3D
var pathTangent : Vector3
var leftIndex = 0
var rightIndex = 1

# stores all the paths in a single array
func _ready() -> void:
	print("Now populating path list")
	populatePaths()
	getPathChildren(currentPath)
	return

func _process(delta: float) -> void:
	pathTangent = getPathTangent()
	player.setForwadDirection(pathTangent)
	return
	
func populatePaths() -> void:
	currentPath = get_child(0)
	if currentPath == null:
		push_error("Cannot find starting path: add a Curve2D as a child to PathManager")
	else:
		print("Current starting path:", currentPath.name)
	
func getPathTangent() -> Vector3:
	var curve = currentPath.curve
	var offset = curve.get_closest_offset(player.position)
	return -curve.sample_baked_with_rotation(offset, true).basis.z

#Left is always 0
func getPathChildren(path: Path3D) -> void:
	leftPath = path.get_child(leftIndex)
	rightPath = path.get_child(rightIndex)

func goLeft() -> void:
	if leftPath == null:
		push_error("Left path is null: Assign a Path3D tp child")
	currentPath = leftPath
	getPathChildren(currentPath)
	
func goRight() -> void:
	if rightPath == null:
		push_error("Left path is null: Assign a Path3D tp child")
	currentPath = rightPath
	getPathChildren(currentPath)
	
func choosePath() -> void:
	print("Now Choosing...")
	
	
