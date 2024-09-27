extends Control

@export_group("Node Paths")
@export var icon: TextureRect
@export var speech: RichTextLabel
@export var audio_player: AudioStreamPlayer
@export var panel: Panel
@export var label: Label
@export var options: PanelContainer
@export var button_array: Array[Button]

enum DialogueState {
	ACTIVE,
	INACTIVE,
}

var working_dialogue: Dialogue.DialogueObject
var working_text: int
var state = DialogueState.INACTIVE:
	set(value):
		if state != value:
			if value == DialogueState.ACTIVE:
				panel.visible = true
			else:
				panel.visible = false
		state = value


func _ready() -> void:
	Globals.set_dialogue.connect(set_dialogue)
	panel.visible = false

func set_dialogue(dialogue_object: Dialogue.DialogueObject, text: int):
	working_dialogue = dialogue_object
	working_text = text
	label.text = working_dialogue.char_name
	icon.texture = working_dialogue.icon
	state = DialogueState.ACTIVE
	update_dialogue()


func update_dialogue():
	options.visible = false

	# Animates the text, so it appears more smooth
	await speak(working_dialogue.item_array[working_text].text, working_dialogue.char_base_speed)

	# set up the BUTTONS
	var working_options = working_dialogue.item_array[working_text].options.keys()
	for i in button_array:
		i.visible = false

	if working_options.size() == 0:
		state = DialogueState.INACTIVE

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
	if state != DialogueState.ACTIVE:
		return
	# Your guess is as good as mine.
	working_text = (
		working_dialogue.item_array[working_text].options[working_dialogue.item_array[working_text].options.keys()[button]]
	)
	update_dialogue()
