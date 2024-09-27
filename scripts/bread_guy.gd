extends Entity

enum MrBreadlyState {
	IDLE,
	YAP,
}

var state = MrBreadlyState.IDLE


func _on_interactable_component_interacted() -> void:
	var state = MrBreadlyState.YAP
	Globals.start_dialogue($DialogueComponent.current_object, 0)
