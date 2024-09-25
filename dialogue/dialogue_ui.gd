extends Control

@export_group("Node Paths")
@export var icon: TextureRect
@export var speech: RichTextLabel
@export var audio_player: AudioStreamPlayer
@export var panel: Panel
@export var label: Label
@export var options: PanelContainer
@export var buttons: Array[Button]

var working_dialogue

func _ready() -> void:
	Dialogue.set_dialogue.connect(_on_dialogue_set)
	options.visible = false
	panel.visible = false


func _on_dialogue_set(dialogue_object, start_text):
	working_dialogue = dialogue_object
	update_dialogue(working_dialogue, start_text)

	panel.visible = true

	# Animates the text, so it appears more smooth
	await speak(working_dialogue.item_array[start_text].text, working_dialogue.char_base_speed)

	# Finishes everything
	options.visible = true


func update_dialogue(dialogue_object, text):
	# Set up all of the UI elements
	label.text = dialogue_object.char_name
	icon.texture = dialogue_object.icon

	# Set up options
	var working_options = dialogue_object.item_array[text].options.keys()
	var ii = 0
	for i in buttons:
		i.text = working_options[ii]
		ii += 1


func speak(speech_text: String, speed: float):
	if speed == 0.0:
		speech.text = speech_text
		return

	if icon.texture is AnimatedTexture:
		icon.texture.pause = false

	for i in speech_text.length():
		speech.text = speech_text.left(i)
		if i % 2 == 0:
			audio_player.pitch_scale = randf_range(0.95,1.05)
			audio_player.play()
		await get_tree().create_timer(speed).timeout

	if icon.texture is AnimatedTexture:
		icon.texture.pause = true
