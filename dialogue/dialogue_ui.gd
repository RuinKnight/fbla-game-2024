extends Control

@export_group("Node Paths")
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
				visible = true
			else:
				visible = false
				Globals.camera_target_set.emit(null)
		state = value


func _ready() -> void:
	Globals.set_dialogue.connect(set_dialogue)
	visible = false

func set_dialogue(dialogue_object: Dialogue.DialogueObject, text: int):
	working_dialogue = dialogue_object
	working_text = text
	%Label.text = working_dialogue.char_name
	state = DialogueState.ACTIVE
	update_dialogue()


func update_dialogue():
	%Options.visible = false

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
	%Options.visible = true


func speak(speech_text: String, speed: float):
	if speed == 0.0:
		%Speech.text = speech_text
		return

	for i in (speech_text.length() + 1):
		%Speech.text = speech_text.left(i)
		if i % 2 == 0:
			%SpeechNoise.pitch_scale = randf_range(0.95,1.05)
			%SpeechNoise.play()
		await get_tree().create_timer(speed).timeout


func action_select(button: int):
	if state != DialogueState.ACTIVE:
		return
	# Your guess is as good as mine.
	working_text = (
		working_dialogue.item_array[working_text].options[working_dialogue.item_array[working_text].options.keys()[button]]
	)
	update_dialogue()
