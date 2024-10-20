extends Area2D

signal interacted
var active = false


func _input(event):
	if event.is_action_pressed("interact") and active:
		interacted.emit()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		active = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		active = false
