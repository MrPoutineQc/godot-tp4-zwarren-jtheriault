extends Area2D

@onready var anime = $AnimatedSprite2D

func _ready() -> void:
	anime.play("idle")

func _on_body_entered(body):
	if body.is_in_group("player"):

		# Désactive la zone
		collision_layer = 0
		collision_mask = 0
		$CollisionShape2D.disabled = true
		
		await get_tree().physics_frame  # force la MAJ

		# Joue l'animation de fin de la fan
		anime.play("finish")
		await anime.animation_finished  # Godot 4 : animation_looped remplace animation_finished

		# Passe à l'état "flag" de la fan
		anime.play("flag")

		# Lance la disparition du joueur
		await body.disappear()  # utilise la méthode disappear() du Player
