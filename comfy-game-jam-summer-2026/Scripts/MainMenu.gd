extends Control

func _ready() -> void:
	for button in $ButtonsContainer.get_children():
		button.mouse_entered.connect(enter_hover.bind(button))
		button.mouse_exited.connect(exit_hover.bind(button))

func _on_play_button_pressed() -> void:
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/Cutscenes/opening.tscn")

func _on_quit_button_pressed() -> void:
	$Select.play()
	get_tree().quit()

func enter_hover(button) -> void:
	$Hover.play()
	
func exit_hover(button) -> void:
	$Hover.play
