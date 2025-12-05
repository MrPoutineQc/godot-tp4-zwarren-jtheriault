extends Area2D

@onready var banana = $AnimatedSprite2D

func _ready() -> void:
	banana.play("Banana")

func _on_body_entered(body: Node2D) -> void:
	$CollisionShape2D.disabled = true
	banana.play("collected")
	await banana.animation_finished
	banana.hide()
