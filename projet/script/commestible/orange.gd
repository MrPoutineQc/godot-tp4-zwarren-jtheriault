extends Area2D

@onready var orange = $AnimatedSprite2D.play("orange")

func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.hide("orange")
	$AnimatedSprite2D.play("collected")
	
