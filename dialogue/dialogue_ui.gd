extends Control

@export_group("Node Paths")
@export var icon: TextureRect
@export var speech: RichTextLabel
@export var audio_player: AudioStreamPlayer
@export var panel: Panel
@export var label: Label
@export var options: PanelContainer
@export var buttons: Array[Button]


func _ready() -> void:
	Dialogue.set_dialogue.connect(_on_dialogue_set)
	panel.visible = false
	options.visible = false


func _on_dialogue_set(dialogue_object, start_text, start_choice):
	# Set up all of the UI elements
	label.text = dialogue_object.char_name
	icon.texture = load(dialogue_object.icon_path)

	# Set up options
	var working_options = dialogue_object.options[start_choice].keys()
	var ii = 0
	for option in buttons:
		option.text = working_options[ii]
		ii += 1

	panel.visible = true

	# Animates the text, so it appears more smooth
	speak(dialogue_object.text[start_text], 0)

	# Finishes everything
	if icon.texture is AnimatedTexture:
		icon.texture.pause = true
	options.visible = true


func speak(speech_text: String, speed: float):
	if speed == 0.0:
		speech.text = speech_text
		return
	for i in speech_text.length():
		speech.text = speech_text.left(i)
		if i % 2 == 0:
			audio_player.pitch_scale = randf_range(0.95,1.05)
			audio_player.play()
		await get_tree().create_timer(speed).timeout


func _on_button_1_pressed() -> void:
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	pass # Replace with function body.
