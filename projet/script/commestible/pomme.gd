extends Area2D

@onready var pomme = $AnimatedSprite2D.play("pomme")

func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.hide("pomme")
	$AnimatedSprite2D.play("collected")
	
