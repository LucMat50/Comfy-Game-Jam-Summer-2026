extends Node

var state_list = {
	"testGoLeft" : false,
	"testGoRight" : false,
	"trail1GoLeft" : false,
	"trail1GoRight" : false,
	"turnedAround" : false
}

var checkStatePersistently : bool = false
var statePChecked : String

func _process(_delta):
	if checkStatePersistently:
		var stateResult = checkState(statePChecked)
		if stateResult:
			checkStatePersistently = false
			Dialogic.paused = false

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
	
func startPersistentStateCheck(state : String) -> void:
	checkStatePersistently = true
	statePChecked = state
	Dialogic.paused = true
	
func isCheckingStatePersistently() -> bool:
	return checkStatePersistently
