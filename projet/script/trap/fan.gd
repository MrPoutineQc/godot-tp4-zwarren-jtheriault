extends Area2D

@export var wind_force := -80.0   # négatif = vers la gauche, positif = vers la droite
@export var slow_amount := 120.0;  # combien la fan enlève
@onready var fan = $AnimatedSprite2D;

func _ready() -> void:
	fan.play("active")

func _on_body_entered(body):
	if body.is_in_group("player"):
		# Ralentit sans jamais rendre speed négative
		body.speed = max(0, body.base_speed - slow_amount)
		body.fan_push = wind_force
		print("Speed ralentie =", body.speed)

func _on_body_exited(body):
	if body.is_in_group("player"):
		# Revient à la normale
		body.speed = body.base_speed
		body.fan_push = 0.0
		print("Speed redevenue normale =", body.speed)
