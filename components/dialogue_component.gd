extends Node

var current_object = Dialogue.DialogueObject.new()
@export_group("Character Data")
@export var character_name: String:
	get:
		return current_object.char_name
	set(value):
		current_object.char_name = value
@export var icon: Texture:
	get:
		return current_object.icon
	set(value):
		current_object.icon = value
@export var character_base_speed: float:
	get:
		return current_object.char_base_speed
	set(value):
		current_object.char_base_speed = value
@export var speech_noise: AudioStream:
	get:
		return current_object.speech_noise
	set(value):
		current_object.speech_noise = value
@export_group("Dialogue Items")
@export_multiline var text: Array[String]


func _ready() -> void:
	var item_array_size = current_object.item_array.size()
	for i in text.size():
		var location = i + item_array_size
		current_object.item_array.append(Dialogue.DialogueItem.new())
		current_object.item_array[location].text = text[i]
		current_object.item_array[location].options = options[i]
