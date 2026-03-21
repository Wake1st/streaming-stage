class_name AudioEffectParser


static func SerializeReverb(json: String) -> AudioEffectReverb:
	var data = JSON.parse_string(json)
	var effect: AudioEffectReverb = AudioEffectReverb.new()
	
	effect.predelay_msec = data.predelay_msec
	effect.predelay_feedback = data.predelay_feedback
	
	effect.room_size = data.room_size
	effect.damping = data.damping
	effect.spread = data.spread
	effect.hipass = data.hipass
	effect.dry = data.dry
	effect.wet = data.wet
	
	return effect


static func SerializePitchShift(json: String) -> AudioEffectPitchShift:
	var data = JSON.parse_string(json)
	var effect: AudioEffectPitchShift = AudioEffectPitchShift.new()
	
	effect.pitch_scale = data.pitch_scale
	effect.oversampling = data.oversampling
	effect.fft_size = data.fft_size
	
	return effect


static func SerializeDelay(json: String) -> AudioEffectDelay:
	var data = JSON.parse_string(json)
	var effect: AudioEffectDelay = AudioEffectDelay.new()
	
	effect.dry = data.dry
	
	effect.feedback_active = data.feedback_active
	effect.feedback_delay_ms = data.feedback_delay_ms
	effect.feedback_level_db = data.feedback_level_db
	effect.feedback_lowpass = data.feedback_lowpass
	
	return effect
