extends Node

signal set_dialogue(dialogue_object: DialogueObject, start_text: int, start_choice: int)


func start_dialogue(dialogue_object: DialogueObject, start_text: int, start_choice: int):
	set_dialogue.emit(dialogue_object, start_text, start_choice)


class DialogueObject:
	var text
	var options
	var icon_path
	var char_name
