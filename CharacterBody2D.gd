extends CharacterBody2D

var code_work = true
var talking_range = false
@export var speed = 400
@export var chatting_now = false


func movement():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if velocity.x == 0 and velocity.y == 0:
		$Character.play("idle")
	else:
		if velocity.x > 0:
			$Character.play("walk")
			$Character.flip_h = false
		elif velocity.x < 0:
			$Character.play("walk")
			$Character.flip_h = true
	
func invisibility():
	var invis_button = Input.is_action_just_pressed("invisibility toggle")

	if invis_button:
		if get_node("Character").modulate.a == 1:
			get_node("Character").modulate.a = 0.5
			$CollisionShape2D2.set_deferred("disabled", true)
		elif get_node("Character").modulate.a == 0.5:
			get_node("Character").modulate.a = 1
			$CollisionShape2D2.set_deferred("disabled", false)

func conversation():
	# use body_entered and body_exited to make a true/false in movement.
	# use the if true with is_action_just_pressed "interact".
	# add short dialogue in game, maybe becomes more bubbly with more interactions.
	if talking_range and Input.is_action_just_pressed("interact"):
		get_node("Chatbubble").set_visible(true)
		await get_tree().create_timer(2.0).timeout
		get_node("Chatbubble").set_visible(false)
		chatting_now = true
		

func _physics_process(_delta):
	movement()
	move_and_slide()
	invisibility()
	conversation()


func body_entered(_body):
	talking_range = true
	

func body_exited(_body):
	talking_range = false
