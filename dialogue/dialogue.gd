extends Node


signal set_dialogue(dialogue_object: DialogueObject, start_text: int)


func start_dialogue(dialogue_object: DialogueObject, start_text: int):
	set_dialogue.emit(dialogue_object, start_text)


class DialogueObject:
	var icon: Texture
	var char_name: String
	var char_base_speed: float
	var speech_noise: AudioStream
	var item_array: Array[DialogueItem]


class DialogueItem:
	var text: String
	var options: Dictionary
	var metadata: Dictionary
