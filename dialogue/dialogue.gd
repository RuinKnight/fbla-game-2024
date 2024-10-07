extends Node

class_name Dialogue

class DialogueObject:
	var char_name: String
	var char_base_speed: float
	var speech_noise: AudioStream
	var item_array: Array[DialogueItem]


class DialogueItem:
	var text: String
	var options: Dictionary
	var metadata: Dictionary
