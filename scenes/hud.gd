extends CanvasLayer

signal start_game

# Arr holds three life counter images of type `TextureRect`
@onready var lives_counter: Array = $MarginContainer/HBoxContainer/LivesCounter.get_children()
@onready var score_label: Label = $MarginContainer/HBoxContainer/ScoreLabel
@onready var message: Label = $VBoxContainer/Message 
@onready var start_button: TextureButton = $VBoxContainer/StartButton 

func game_over():
	show_message("Game Over")
	await $Timer.timeout
	start_button.show()

func show_message(text):
	message.text = text
	message.show()
	$Timer.start()
	
func update_score(value):
	score_label.text = str(value)
	
	
func update_lives(value):
	for item in 3:  # TODO exercise: make variable amount of lives.
		lives_counter[item].visible = value > item


func _on_start_button_pressed() -> void:
	start_button.hide()
	start_game.emit()


func _on_timer_timeout() -> void:
	message.hide()
	message.text = ""
