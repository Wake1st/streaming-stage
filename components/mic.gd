class_name Mic
extends AudioStreamPlayer


func _ready() -> void:
	# We get the index of the "Record" bus.
	var idx = AudioServer.get_bus_index("Mic")
	
	# adding to "get" the mic
	AudioServer.input_device = AudioServer.get_input_device_list()[idx]
	
	# turn 'on'
	playing = true
