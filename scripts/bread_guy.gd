extends Entity


func _on_interactable_component_interacted() -> void:
	Dialogue.start_dialogue($DialogueComponent.current_object, 1)
