extends CharacterBody2D

@export var speed = 12000
enum PlayerState {
	LOCKED,
	UNLOCKED,
}
var state = PlayerState.UNLOCKED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if state == PlayerState.LOCKED:
		return
	player_move(delta)
	move_and_slide()


func player_move(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction.normalized() * speed * delta
