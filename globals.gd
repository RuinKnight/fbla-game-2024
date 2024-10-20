extends Node

signal set_dialogue(dialogue_object: Dialogue.DialogueObject, start_text: int)


func start_dialogue(dialogue_object: Dialogue.DialogueObject, start_text: int):
	set_dialogue.emit(dialogue_object, start_text)
