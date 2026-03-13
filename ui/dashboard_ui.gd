class_name DashboardUI
extends Control


@onready var can_do_list: TaskListUI = %CanDoList
@onready var in_queue_list: TaskListUI = %InQueueList
@onready var doing_list: TaskListUI = %DoingList


func load_task(item: TaskItem) -> void:
	can_do_list.add_item(item)
