class_name AudioEffectApplier
extends Node


enum Effect {
	REVERB,
	PITCH,
	DELAY
}

@export var bus_name: String

var bus_index: int
var timers: Dictionary[Timer, int]


func set_reverb(details: AudioEffectReverb, time: float) -> void:
	# setup timer
	var timer = _create_timer(time)
	timer.timeout.connect(_handle_timer_end.bind(1))
	timer.start()
	timers.set(timer, 1)
	
	# set effect
	var audio_effect: AudioEffectReverb = AudioServer.get_bus_effect(bus_index,1)
	audio_effect.predelay_msec = details.predelay_msec
	audio_effect.predelay_feedback = details.predelay_feedback
	
	audio_effect.room_size = details.room_size
	audio_effect.damping = details.damping
	audio_effect.spread = details.spread
	audio_effect.hipass = details.hipass
	audio_effect.dry = details.dry
	audio_effect.wet = details.wet
	
	# turn on effect
	AudioServer.set_bus_effect_enabled(bus_index, 1, true)


func set_pitch(details: AudioEffectPitchShift, time: float) -> void:
	# setup timer
	var timer = _create_timer(time)
	timer.timeout.connect(_handle_timer_end.bind(2))
	timer.start()
	timers.set(timer, 2)
	
	# set effect
	var audio_effect: AudioEffectPitchShift = AudioServer.get_bus_effect(bus_index,2)
	audio_effect.pitch_scale = details.pitch_scale
	audio_effect.oversampling = details.oversampling
	audio_effect.fft_size = details.fft_size
	
	# turn on effect
	AudioServer.set_bus_effect_enabled(bus_index, 2, true)


func set_delay(details: AudioEffectDelay, time: float) -> void:
	# setup timer
	var timer: Timer = _create_timer(time)
	timer.timeout.connect(_handle_timer_end.bind(3))
	timer.start()
	timers.set(timer, 3)
	
	# set effect
	var audio_effect: AudioEffectDelay = AudioServer.get_bus_effect(bus_index,3)
	audio_effect.dry = details.dry
	
	audio_effect.feedback_active = details.feedback_active
	audio_effect.feedback_delay_ms = details.feedback_delay_ms
	audio_effect.feedback_level_db = details.feedback_level_db
	audio_effect.feedback_lowpass = details.feedback_lowpass
	
	# turn on effect
	AudioServer.set_bus_effect_enabled(bus_index, 3, true)


func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)


func _create_timer(duration: float) -> Timer:
	var timer: Timer = Timer.new()
	timer.wait_time = duration
	timer.one_shot = true
	
	add_child(timer)
	return timer


func _handle_timer_end(index: int) -> void:
	AudioServer.set_bus_effect_enabled(bus_index, index, false)
