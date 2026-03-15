class_name DashboardUI
extends Control


@onready var list: TaskListUI = %TaskList


func load_task(item: TaskItem) -> void:
	list.add_item(item)
