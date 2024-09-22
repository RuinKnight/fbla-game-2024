extends Node

signal set_dialogue(dialogue_object: DialogueObject, start_text: int)


func start_dialogue(dialogue_object: DialogueObject, start_text: int):
	set_dialogue.emit(dialogue_object, start_text)


class DialogueObject:
	var text
	var options
	var icon_path
	var char_name
