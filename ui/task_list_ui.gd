class_name TaskListUI
extends ColorRect


signal task_complete(task: TaskItem)

const TASK_ITEM_UI = preload("uid://bdk8o6u4wrm3")

@export var title: String

@onready var lbl_title: Label = %LblTitle
@onready var item_container: VBoxContainer = %ItemContainer

var items: Array[TaskItemUI]


func add_item(item: TaskItem) -> void:
	item.countdown = item.time
	var task_ui: TaskItemUI = TASK_ITEM_UI.instantiate()
	
	# add according to the size
	var index = _find_longer_item_index(item)
	item_container.add_child(task_ui)
	item_container.move_child(task_ui, index)
	task_ui.fill(item)
	
	# add to set
	items.push_back(task_ui)


func _ready() -> void:
	lbl_title.text = title


func _process(delta: float) -> void:
	for item: TaskItemUI in items:
		if item.tick(delta):
			items.erase(item)
			task_complete.emit(item.data)
			item.leave()


func _find_longer_item_index(data: TaskItem) -> int:
	var children = item_container.get_children()
	
	# check for any items
	if children.size() == 0:
		return 0
	
	for item: TaskItemUI in children:
		if data.countdown < item.data.countdown:
			return children.find(item)
	
	# if none are greater then its the greatest
	return children.size()
