extends CharacterBody2D


func _physics_process(_delta):
	ready()

func ready():
	var character_node: CharacterBody2D
	character_node = get_parent().get_node("CharacterBody2D")
	if character_node.chatting_now:
		await get_tree().create_timer(2.0).timeout
		get_node("Chatbubble").set_visible(true)
		await get_tree().create_timer(2.0).timeout
		get_node("Chatbubble").set_visible(false)
		$CollisionShape2D.set_deferred("disabled", true)
		get_node("Dude").modulate.a = 0.5
		await get_tree().create_timer(2.0).timeout
		$CollisionShape2D.set_deferred("disabled", false)
		get_node("Dude").modulate.a = 1
