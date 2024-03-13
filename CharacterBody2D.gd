extends CharacterBody2D

@export var speed = 400

func movement():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
func invisibility():
	var invis_button = Input.is_action_just_pressed("invisibility toggle")

	if invis_button:
		if get_node("Icon2").modulate.a == 1:
			get_node("Icon2").modulate.a = 0.5
			get_node("CollisionShape2D2").
		elif get_node("Icon2").modulate.a == 0.5:
			get_node("Icon2").modulate.a = 1


func _physics_process(delta):
	movement()
	move_and_slide()
	invisibility()
