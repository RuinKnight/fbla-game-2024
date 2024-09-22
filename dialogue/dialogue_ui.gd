extends Control


func _ready() -> void:
	Dialogue.set_dialogue.connect(_on_dialogue_set)

func _on_dialogue_set(dialogue_object, start_text):
	$TextBox/Label.text = dialogue_object.text[start_text]
