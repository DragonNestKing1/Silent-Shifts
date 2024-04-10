extends CharacterBody2D

var character_body: CharacterBody2D = get_parent().get_node("CharacterBody2D")

func _physics_process(_delta):

	if character_body.chatting_now:
		# Do something when chatting is happening
		print("Character is currently chatting!")
	else:
		# Do something else
		print("Character is not chatting.")
