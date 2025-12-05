extends Area2D

@onready var melon = $AnimatedSprite2D.play("Melon")

func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.hide("Melon")
	$AnimatedSprite2D.play("collected")
	
