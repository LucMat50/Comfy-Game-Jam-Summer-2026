extends AudioStreamPlayer

func _ready() -> void:
	set_evil_amount(0)

func set_evil_amount(amount : float):
	clamp(amount, 0, 1)
	
	#reverb
	AudioServer.get_bus_effect(1, 0).room_size = amount / 2
	AudioServer.get_bus_effect(1, 0).damping = amount / 4
	AudioServer.get_bus_effect(1, 0).spread = amount / 4
	AudioServer.get_bus_effect(1, 0).wet = amount
	AudioServer.get_bus_effect(1, 0).dry = 1 - amount
	
	#delay
	AudioServer.get_bus_effect(1, 1).tap1_level_db = -36 + (30 * amount)
	AudioServer.get_bus_effect(1, 1).tap2_level_db = -36 + (24 * amount)
	
	#Low Pass
	AudioServer.get_bus_effect(1, 2).cutoff_hz = 8000 - 7550 * amount
