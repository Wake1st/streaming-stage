class_name TaskDashboard
extends Node


@export var tasks: Array[TaskItem]

@onready var dashboard_ui: DashboardUI = $CanvasLayer/DashboardUI


func _ready() -> void:
	for task in tasks:
		dashboard_ui.load_task(task)
