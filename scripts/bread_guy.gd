extends Entity

var word = Dialogue.DialogueObject.new()

func _ready() -> void:
	word.text = ["Nerds","	My favorite flavor of coffee is yappuchino. I don't even know why, it just feels right. Anyways, how is your investigation going?"]
	word.char_name = "Mr. Breadly (isn't deadly)"
	word.icon_path = "res://art/dialogue_thumb/fbi_operative_static.png"

func _on_interactable_component_interacted() -> void:
	Dialogue.start_dialogue(word, 1)
	$Sprite.animation = "yap"
