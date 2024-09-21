extends Entity

@export var word: Resource

func _on_interactable_component_interacted() -> void:
	print(word.text)
	$Sprite.animation = "yap"
