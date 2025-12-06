extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		
		body.is_hurt = true
		body.animated_sprite.play("get_hit")

		await body.animated_sprite.animation_finished

		body.is_hurt = false
