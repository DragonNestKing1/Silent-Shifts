extends CharacterBody2D

@export var speed = 400

func movement():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if velocity.x == 0 and velocity.y == 0:
		$Icon2.play("idle")
	else:
		if velocity.x > 0:
			$Icon2.play("walk")
			$Icon2.flip_h = false
		elif velocity.x < 0:
			$Icon2.play("walk")
			$Icon2.flip_h = true
	
func invisibility():
	var invis_button = Input.is_action_just_pressed("invisibility toggle")

	if invis_button:
		if get_node("Icon2").modulate.a == 1:
			get_node("Icon2").modulate.a = 0.5
			$CollisionShape2D2.set_deferred("disabled", true)
		elif get_node("Icon2").modulate.a == 0.5:
			get_node("Icon2").modulate.a = 1
			$CollisionShape2D2.set_deferred("disabled", false)
var code_work = true

func _physics_process(delta):
	movement()
	move_and_slide()
	invisibility()
