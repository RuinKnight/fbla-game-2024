extends Control

@export_group("Node Paths")
@export var icon: TextureRect
@export var speech: RichTextLabel
@export var audio_player: AudioStreamPlayer
@export var panel: Panel
@export var label: Label
@export var options: PanelContainer
@export var buttons: Array[Button]

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

	panel.visible = true

	# Animates the text, so it appears more smooth
	await speak(working_dialogue.item_array[start_text].text, working_dialogue.char_base_speed)

	# Finishes everything
	options.visible = true
	action_select(0)


func update_dialogue():
	# Set up all of the UI elements
	label.text = working_dialogue.char_name
	icon.texture = working_dialogue.icon

	# Set up options
	var working_options = working_dialogue.item_array[working_text].options.keys()
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


func action_select(button):
	var selected_text = working_dialogue.item_array[working_text].options.keys()[button]
	print(selected_text.to_string())
