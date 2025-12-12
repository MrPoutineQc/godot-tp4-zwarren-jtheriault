extends Area2D


@onready var anime = $AnimatedSprite2D

func _ready() -> void:
	anime.play("idle")

func _on_body_entered(body):
	if body.is_in_group("player"):
		# Désactive complètement l'Area
		collision_layer = 0
		collision_mask = 0
		$CollisionShape2D.disabled = true
		
		await get_tree().physics_frame  # Force la MAJ

		anime.play("finish")
		await anime.animation_finished
		anime.play("flag")
