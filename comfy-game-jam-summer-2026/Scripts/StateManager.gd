extends Node

var state_list = {
	"stateTest" : false
}

func _ready() -> void:
	Dialogic.signal_event.connect(_receive_state_update)
	
func _receive_state_update(state : String):
	var key_search_result = state_list.get(state)
	if key_search_result == null:
		print("Key does not exist in state list.")
	else:
		state_list.set(state, true)
		
