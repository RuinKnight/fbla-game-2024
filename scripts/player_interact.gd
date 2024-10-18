extends Area2D


func _input(event):
	if event.is_action_pressed("interact"):
		var areas = get_overlapping_areas()
		var closest = areas[0]
		for area in areas:
			var distance = area.global_position.distance_to(global_position)
			if distance < closest.global_position.distance_to(global_position):
				closest = area
		closest.interacted.emit()
