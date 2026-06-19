extends CanvasLayer

#VARIABLES

var deployed:bool = false

@onready var hand = $Sprite2D/AnimationPlayer

func _process(_delta: float) -> void:
	if !deployed:
		if Input.is_action_just_pressed("deploy hands"):
			deployed = true
			deployHands()
	else:
		if Input.is_action_just_pressed("deploy hands"):
			deployed = false
			deployHands()


func deployHands():
	if deployed:
		hand.play("deploy")
	else:
		hand.play_backwards("deploy")
