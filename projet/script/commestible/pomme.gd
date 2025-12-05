extends Area2D

@onready var pomme = $AnimatedSprite2D

func _ready() -> void:
	pomme.play("pomme")

func _on_body_entered(body: Node2D) -> void:
	$CollisionShape2D.disabled = true
	pomme.play("collected")
	await pomme.animation_finished
	pomme.hide()
