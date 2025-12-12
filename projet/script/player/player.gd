extends CharacterBody2D

var base_speed := 200.0      # vitesse normale
var speed := base_speed       # vitesse actuelle
const JUMP_VELOCITY = -275.0
var can_double_jump = true
var is_hurt = false

var fan_push := 0.0           # force du ventilateur
var is_spawning := true        # bloque tout pendant l'apparition
var is_disappearing := false   # bloque tout pendant la disparition

@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	print("appearing")
	animated_sprite.play("appearing")
	await animated_sprite.animation_finished
	is_spawning = false
	animated_sprite.play("idle")

func _physics_process(delta: float) -> void:
	# 🔥 Bloque tout si spawning ou disappearing
	if is_spawning or is_disappearing:
		velocity.x = 0
		move_and_slide()
		return
	
	# --- GRAVITÉ ---
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# --- RESET DOUBLE JUMP ---
	if is_on_floor():
		can_double_jump = true

	# --- SAUT ---
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("jump"):
		_play_anim("jump")
		
	if Input.is_action_just_pressed("jump") and not is_on_floor() and can_double_jump:
		velocity.y = JUMP_VELOCITY
		can_double_jump = false
		_play_anim("double_jump")

	# --- DIRECTION ---
	var direction := Input.get_axis("left", "right")

	if direction != 0:
		# joueur bouge → ignore vent
		velocity.x = direction * speed
		if is_on_floor():
			_play_anim("run")
		animated_sprite.flip_h = direction < 0

	else:
		# joueur ne bouge pas → appliquer vent si présent
		if fan_push != 0:
			velocity.x = fan_push
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

		if is_on_floor():
			_play_anim("idle")

	# --- AIR ---
	if not is_on_floor() and velocity.y > 0:
		_play_anim("fall")

	if is_on_wall():
		_play_anim("wall_jump")
		if Input.is_action_just_pressed("jump") and is_on_wall():
			velocity.y = JUMP_VELOCITY

	move_and_slide()

# --- Change animation seulement si différente ---
func _play_anim(name: String) -> void:
	if is_spawning or is_disappearing:  # bloque idle/run/fall/etc
		return
	if is_hurt:
		return
	if animated_sprite.animation != name:
		animated_sprite.play(name)

# --- Méthode pour déclencher la disparition ---
func disappear() -> void:
	if is_disappearing:
		return
	is_disappearing = true
	animated_sprite.play("disappearing")
	await animated_sprite.animation_looped
	queue_free()  # ou autre comportement de respawn
