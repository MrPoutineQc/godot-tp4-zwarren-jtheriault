extends Area2D

@onready var banana = $AnimatedSprite2D.play("Banana")



func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.hide("Banana")
	$AnimatedSprite2D.play("collected")
	
