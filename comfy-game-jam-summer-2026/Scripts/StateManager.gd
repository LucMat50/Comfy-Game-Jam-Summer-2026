extends Node

var state_list = {
	"testGoLeft" : false,
	"testGoRight" : false,
	"trail1GoLeft" : false,
	"trail1GoRight" : false
}

func updateState(state : String):
	var key_search_result = state_list.get(state)
	if key_search_result == null:
		print("Key does not exist in state list.")
	else:
		state_list.set(state, true)
		
func checkState(state : String) -> bool:
	clearStateTempVar()
	var key_search_result = state_list.get(state)
	if key_search_result == null:
		return false
	else:
		Dialogic.VAR.stateTemp = key_search_result
		return key_search_result
		
func clearStateTempVar() -> void: # always call clear state temp var when condition not in use!
	Dialogic.VAR.stateTemp = false
