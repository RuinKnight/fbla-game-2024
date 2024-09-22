extends Entity

var word = Dialogue.DialogueObject.new()

func _ready() -> void:
	word.text = ["Nerds","Yappuchino"]

func _on_interactable_component_interacted() -> void:
	Dialogue.start_dialogue(word, 1)
	$Sprite.animation = "yap"
