extends Area2D

@onready var strawberry = $AnimatedSprite2D.play("strawberry")

func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.hide("strawberry")
	$AnimatedSprite2D.play("collected")
	
