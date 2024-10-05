extends Camera2D

@export var player: Node
var target_pos: Vector2 = Vector2.ZERO

enum CameraState {
	PLAYER_CAM,
	ENITIY_CAM,
}

var state = CameraState.PLAYER_CAM

func _ready() -> void:
	Globals.camera_target_set.connect(_on_camera_target_set)

func _process(delta: float) -> void:
	if state == CameraState.PLAYER_CAM:
		target_pos = player.global_position + 0.2 * (get_viewport().get_mouse_position() - Vector2(576, 324))
	elif state == CameraState.ENITIY_CAM:
		return
	position = target_pos

func _on_camera_target_set(targeted):
	if targeted:
		state = CameraState.ENITIY_CAM
		target_pos = targeted
		zoom = Vector2(2,2)
	else:
		state = CameraState.PLAYER_CAM
		zoom = Vector2(1,1)
