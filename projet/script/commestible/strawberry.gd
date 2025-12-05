extends Area2D

@onready var strawberry = $AnimatedSprite2D

func _ready() -> void:
	strawberry.play("strawberry")

func _on_body_entered(body: Node2D) -> void:
	$CollisionShape2D.disabled = true
	strawberry.play("collected")
	await strawberry.animation_finished
	strawberry.hide()
