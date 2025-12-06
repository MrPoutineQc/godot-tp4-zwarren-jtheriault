extends Area2D

var respawn_position = Vector2(13, 400)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Player touch the void")
		
		if "is_hurt" in body:
			body.is_hurt = true
			
		await get_tree().create_timer(0.5).timeout
		
		body.global_position = respawn_position
		
		if "velocity" in body:
			body.velocity = Vector2.ZERO
			
		if "is_hurt" in body:
			body.is_hurt = false
