extends Control

func _ready() -> void:
	for button in $ButtonsContainer.get_children():
		button.mouse_entered.connect(enter_hover.bind(button))
		button.mouse_exited.connect(exit_hover.bind(button))

func enter_pause() -> void:
	visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_button_pressed() -> void:
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	
func enter_hover(button) -> void:
	pass # optional hover effect
	
func exit_hover(button) -> void:
	pass # optional hover effect
