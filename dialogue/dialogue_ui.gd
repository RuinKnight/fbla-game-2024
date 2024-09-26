extends Control

@export_group("Node Paths")
@export var icon: TextureRect
@export var speech: RichTextLabel
@export var audio_player: AudioStreamPlayer
@export var panel: Panel
@export var label: Label
@export var options: PanelContainer
@export var button_array: Array[Button]

var working_dialogue: Dialogue.DialogueObject
var working_text: int

func _ready() -> void:
	Dialogue.set_dialogue.connect(_on_dialogue_set)
	options.visible = false
	panel.visible = false


func _on_dialogue_set(dialogue_object, start_text):
	working_dialogue = dialogue_object
	working_text = start_text
	update_dialogue()


func update_dialogue():
	options.visible = false
	# Set up all of the UI elements
	label.text = working_dialogue.char_name
	icon.texture = working_dialogue.icon
	panel.visible = true
	# Animates the text, so it appears more smooth
	await speak(working_dialogue.item_array[working_text].text, working_dialogue.char_base_speed)

	# set up the BUTTONS
	var working_options = working_dialogue.item_array[working_text].options.keys()
	for i in button_array:
		i.visible = false

	if working_options.size() == 0:
		$Panel.visible = false
		return

	for i in working_options.size():
		button_array[i].text = working_options[i]
		button_array[i].visible = true
	options.visible = true


func speak(speech_text: String, speed: float):
	if speed == 0.0:
		speech.text = speech_text
		return

	if icon.texture is AnimatedTexture:
		icon.texture.pause = false

	for i in (speech_text.length() + 1):
		speech.text = speech_text.left(i)
		if i % 2 == 0:
			audio_player.pitch_scale = randf_range(0.95,1.05)
			audio_player.play()
		await get_tree().create_timer(speed).timeout

	if icon.texture is AnimatedTexture:
		icon.texture.pause = true


func action_select(button: int):
	# Your guess is as good as mine.
	working_text = (
		working_dialogue.item_array[working_text].options[working_dialogue.item_array[working_text].options.keys()[button]]
		)
	update_dialogue()
