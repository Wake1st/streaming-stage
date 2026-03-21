extends Node


@onready var applier: AudioEffectApplier = %AudioEffectApplier
@onready var input: TextEdit = %Input


func _on_btn_reverb_pressed() -> void:
	input.text = '{ 
		"predelay_feedback": 0.4, 
		"predelay_msec": 400.0, 
		"room_size": 0.8, 
		"damping": 0.5, 
		"spread": 1.0, 
		"hipass": 0.0, 
		"dry": 0.8, 
		"wet": 0.5 
	}'
	
	applier.set_reverb(AudioEffectParser.SerializeReverb(input.text), 5)


func _on_btn_pitch_pressed() -> void:
	input.text = '{ 
		"pitch_scale": 1.3, 
		"oversampling": 12, 
		"fft_size": 4 
	}'
	
	applier.set_pitch(AudioEffectParser.SerializePitchShift(input.text), 5)


func _on_btn_delay_pressed() -> void:
	input.text = '{ 
		"dry": 1.0, 
		"feedback_active": true, 
		"feedback_delay_ms": 340.0, 
		"feedback_level_db": -6.0, 
		"feedback_lowpass": 16000.0, 
	}'
	
	applier.set_delay(AudioEffectParser.SerializeDelay(input.text), 5)
