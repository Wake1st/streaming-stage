class_name TaskItemUI
extends ProgressBar


const TIME_FORMAT: String = "%2.2f"
const LEAVE_DISTANCE: float = 500
const LEAVE_DURATION: float = 0.4

@onready var lbl_title: Label = %LblTitle
@onready var lbl_info: Label = %LblInfo
@onready var lbl_countdown: Label = %LblCountdown
@onready var lbl_time: Label = %LblTime

var data: TaskItem


func fill(dt: TaskItem) -> void:
	data = dt
	
	lbl_title.text = data.title
	lbl_info.text = data.info
	lbl_time.text = TIME_FORMAT % data.time 
	lbl_countdown.text = TIME_FORMAT % data.countdown


func tick(delta: float) -> bool:
	# shift countdown
	data.countdown -= delta
	
	# update ui
	lbl_countdown.text = TIME_FORMAT % data.countdown
	value = 100 * data.countdown / data.time
	
	return data.countdown < 0


func leave() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "position:x", LEAVE_DISTANCE, LEAVE_DURATION)
	tween.set_ease(Tween.EASE_IN)
	tween.tween_callback(_on_leave_finished)
	tween.play()


func _on_leave_finished() -> void:
	queue_free()
