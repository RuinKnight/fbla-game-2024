extends Entity


func _on_interactable_component_interacted() -> void:
	print("Wow, such Dialogue")
	$Sprite.animation = "yap"
