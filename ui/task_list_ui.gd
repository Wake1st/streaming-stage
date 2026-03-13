class_name TaskListUI
extends ColorRect


const TASK_ITEM_UI = preload("uid://bdk8o6u4wrm3")

@export var title: String

@onready var lbl_title: Label = %LblTitle
@onready var item_container: VBoxContainer = %ItemContainer


func add_item(item: TaskItem) -> void:
	var task_ui: TaskItemUI = TASK_ITEM_UI.instantiate()
	item_container.add_child(task_ui)
	task_ui.fill(item)


func _ready() -> void:
	lbl_title.text = title
