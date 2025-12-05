extends Area2D

@onready var kiwi = $AnimatedSprite2D.play("Kiwi")

func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.hide("Kiwi")
	$AnimatedSprite2D.play("collected")
	
