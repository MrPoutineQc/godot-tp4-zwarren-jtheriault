extends Area2D

@onready var saw_anim = $AnimatedSprite2D

func _ready() -> void:
	saw_anim.play("default")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("💥 Piège activé par le joueur !")
