extends Entity

var word = Dialogue.DialogueObject.new()

func _ready() -> void:
	word.text = ["Neat.","	My favorite flavor of coffee is yappuchino. I don't even know why, it just feels right. Anyways, how is your investigation going? "]
	word.options = [{"L is real 2024":1,"eh. Not terrible, but not great.":1,"Same ol', Same ol'":1}]
	word.char_name = "Mr. Breadly (isn't deadly)"
	word.icon_path = "res://dialogue/fbi_operative_thumbnail.tres"
	word.char_speed = 0.04

func _on_interactable_component_interacted() -> void:
	Dialogue.start_dialogue(word, 1, 0)
