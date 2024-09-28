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
		target_pos = player.global_position
	position = target_pos

func _on_camera_target_set(targeted):
	if targeted:
		state = CameraState.ENITIY_CAM
		target_pos = targeted
		zoom = Vector2(3,3)
	else:
		state = CameraState.PLAYER_CAM
		zoom = Vector2(1,1)
