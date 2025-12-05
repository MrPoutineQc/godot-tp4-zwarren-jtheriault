extends Area2D

@onready var cherries = $AnimatedSprite2D.play("Cherries")

func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.hide("Cherries")
	$AnimatedSprite2D.play("collected")
	
