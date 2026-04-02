@tool

class_name StageTwitchService
extends TwitchService


func _on_twitch_chat_message_received(message: TwitchChatMessage) -> void:
	print(message.message.text)


func _on_twitch_command_command_received(
	from_username: String, 
	info: TwitchCommandInfo, 
	args: PackedStringArray
) -> void:
	print("%s: %s (%s)" % [from_username, info.command.command, args])
