extends Entity

@export var DialogueComponent: Node

enum MrBreadlyState {
	IDLE,
	YAP,
}

var state = MrBreadlyState.IDLE:
	set(value):
		if value == MrBreadlyState.YAP:
			%Sprite.animation = "yap"
		else:
			%Sprite.animation = "idle"
		return value


func _on_interactable_component_interacted() -> void:
	if not DialogueComponent:
		return
	var state = MrBreadlyState.YAP
	Globals.camera_target_set.emit(global_position)
	await Globals.start_dialogue(DialogueComponent.current_object, 0)
