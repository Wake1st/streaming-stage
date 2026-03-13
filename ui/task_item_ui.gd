class_name TaskItemUI
extends ColorRect


const TIME_FORMAT: String = "%2.2f"

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
	data.countdown -= delta
	
	return data.countdown < 0
