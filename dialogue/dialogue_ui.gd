extends Control


func _ready() -> void:
	Dialogue.set_dialogue.connect(_on_dialogue_set)
	$Panel.visible = false

func _on_dialogue_set(dialogue_object, start_text):
	$Panel/Speech.text = dialogue_object.text[start_text]
	$Panel/Label.text = dialogue_object.char_name
	$Panel/Icon.texture = load(dialogue_object.icon_path)
	$Panel.visible = true
