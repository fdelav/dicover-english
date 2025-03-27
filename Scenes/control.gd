extends Control

@export var title_label: Label
@export var image: TextureRect
@export var audio: AudioStreamPlayer
@export var data_path: String
@export var start_card: int = 0

var card_index
var card_array: Array
var current_card: Dictionary

func _ready():
	card_array = read_json(data_path)
	current_card = card_array[start_card]
	card_index = start_card
	print(current_card)
	update_card()

func read_json(file_path: String):
	if FileAccess.file_exists(file_path):
			var data_file = FileAccess.open(file_path,FileAccess.READ)
			var parsed_result = JSON.parse_string(data_file.get_as_text())
			data_file.close()
			return parsed_result
	else:
		printerr("Error: file don't found")

func update_card():
	title_label.text = current_card["Word"]
	image.texture = load(current_card["Image"])
	audio.stream = load(current_card["Audio"])

func _on_audio_button_pressed():
	audio.play()


func _on_left_button_pressed():
	if card_index > 0:
		card_index -= 1
	else:
		card_index = len(card_array) - 1
	current_card = card_array[card_index]
	update_card()


func _on_right_button_pressed():
	if card_index < len(card_array) - 1:
		card_index += 1
	else:
		card_index = 0
	current_card = card_array[card_index]
	update_card()
