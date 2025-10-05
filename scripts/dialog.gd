extends CanvasLayer

@onready var text_label: Label = $Panel/Text
signal dialog_finished
const SOUND_POOL_SIZE = 4
var sfx_players = []

var dialog =[
	[
		"BELLO !!!!",
		"Oui Boing ?",
		"Viens dans la cuisine !"
	],
	[
		"Qu'est ce qu'il y a ?"
	],
	[
		"Le frigo est vide !",
		"Et ?",
		"J'ai faim, va acheter à manger !",
		"Je veux bien mais on a plus d'argent, on a littéralement 0 Flambcoin.",
		"Va chercher un taf et rapporte l'argent à la maison !",
		"D'accord...",
		"* Objectifs mis à jour !
		-Aller dehors
		-Trouver un taf
		-Rembourser Ceraris",
		"Hey, pourquoi je dois rembourser Ceraris déjà ?",
		"Pour son service spécial imbécile."
	],
	[
		"C'est énorme !",
		"Ça va jamais rentrer !",
		"Je sais que c'est super gros mais ça doit passer."
	],
	[
		"Quel service ?"
	],
	[
		"Bah faire rentrer le canapé dans la maison."
	],
	[
		"Bref, va dehors.",
		"* Appuyez sur TAB pour ouvrir la carte."
		
	],
	[
		"Bruh tu as vraiment besoin de la carte pour marcher dans ta maison ?",
		"Oui je suis smart."
	],
	[
		"Ah donc l'entrée est VRAIMENT pétée.",
		"En plus d'être un internal plexus..."
	],
	[
		"BELLO !!!"
	],
	[
		"Oui c'est moi, mais t'es qui déjà ?",
		"Tu as déjà oublié ton plus GRAND rival ?!",
		"Moi je m'appelle..."
	],
	[
		"Levier..."
	],
	[
		"Hey Drieux, ça va ?",
		"...",
		"Quoi ?",
		"Frère, t'es déjà mort il y a 3 jours, tu pourrais pas essayer de ne pas mourrir ?!",
		"C'est pas ma faute...",
		"Bref, t'es mort de quoi ..."
	],
	[
		"C'est Asgore il m'a foncé dessus !",
		"...",
		"Driving in my caaaaaaaaaaaaaar",
		"Frère arrête",
		"HO TU TE CALME",
		"Désolé",
		"Par contre c'est la troisième fois cette semaine qu'il drive in his car right after a beer",
		"Ouais",
		"Bref, j'te fais revivre ?",
		"Ouais, chez moi stp",
		"Bah ouais, mais c'est pas toi qui décide",
		"Je vais te faire respawn chez toi",
		"D'accord..."
	]
]

var character = [
	[
		"???",
		"Bello",
		"Boing"
	],
	[
		"Bello"
	],
	[
		"Boing",
		"Bello",
		"Boing",
		"Bello",
		"Boing",
		"Bello",
		"",
		"Bello",
		"Boing"
	],
	[
		"Ceraris",
		"Bello",
		"Ceraris"
	],
	[
		"Bello"
	],
	[
		"Boing"
	],
	[
		"Boing",
		""
	],
	[
		"Boing",
		"Bello"
	],
	[
		"Bello",
		"Bello"
	],
	[
		"???"
	],
	[
		"Bello",
		"???",
		"???"
	],
	[
		"Levier"
	],
	[
		"Bello",
		"Drieux",
		"Bello",
		"Drieux",
		"Bello",
		"Drieux"
	],
	[
		"Bello", 
		"Drieux", 
		"Drieux",
		"Bello",
		"Drieux",
		"Bello",
		"Drieux",
		"Bello",
		"Drieux",
		"Bello",
		"Drieux",
		"Drieux",
		"Bello"
	]
]

var expressions = [
	[
		"Boing/hidden.png",
		"Bello/normal.png",
		"Boing/hidden.png"
	],
	[
		"Bello/normal.png"
	],
	[
		"Boing/angry.png",
		"Bello/question.png",
		"Boing/cry.png",
		"Bello/not_happy.png",
		"Boing/nerve.png",
		"Bello/sweat.png",
		"none",
		"Bello/normal.png",
		"Boing/normal.png"
	],
	[
		"Ceraris/hidden.png",
		"Bello/hidden.png",
		"Ceraris/hidden.png"
	],
	[
		"Bello/question.png"
	],
	[
		"Boing/normal.png"
	],
	[
		"Boing/angry.png",
		"none"
	],
	[
		"Boing/bruh.png",
		"Bello/normal.png"
	],
	[
		"Bello/not_happy.png",
		"Bello/sweat.png"
	],
	[
		"Levier/hidden.png"
	],
	[
		"Bello/question.png",
		"Levier/hidden_nerve.png",
		"Levier/hidden.png"
	],
	[
		"Levier/normal.png"
	],
	[
		"Bello/normal.png",
		"Drieux/bruh.png",
		"Bello/question.png",
		"Drieux/nerve.png",
		"Bello/sweat.png",
		"Drieux/glass.png"
	],
	[
		"Bello/angry.png",
		"Drieux/normal.png",
		"Drieux/happy.png",
		"Bello/angry.png",
		"Drieux/nerve.png",
		"Bello/sweat.png",
		"Drieux/normal.png",
		"Bello/not_happy.png",
		"Drieux/normal.png",
		"Bello/normal.png",
		"Drieux/angry.png",
		"Drieux/normal.png",
		"Bello/sweat.png"
	]
]

var sounds = [
	[
		"boing.ogg",
		"bello.ogg",
		"boing.ogg"
	],
	[
		"bello.ogg"
	],
	[
		"boing.ogg",
		"bello.ogg",
		"boing.ogg",
		"bello.ogg",
		"boing.ogg",
		"bello.ogg",
		"narrator.ogg",
		"bello.ogg",
		"boing.ogg"
	],
	[
		"ceraris.ogg",
		"bello.ogg",
		"ceraris.ogg"
	],
	[
		"bello.ogg"
	],
	[
		"boing.ogg"
	],
	[
		"boing.ogg",
		"narrator.ogg"
	],
	[
		"boing.ogg",
		"bello.ogg"
	],
	[
		"bello.ogg",
		"bello.ogg"
	],
	[
		"levier.ogg"
	],
	[
		"bello.ogg",
		"levier.ogg",
		"levier.ogg"
	],
	[
		"levier.ogg"
	],
	[
		"bello.ogg",
		"drieux.ogg",
		"bello.ogg",
		"drieux.ogg",
		"bello.ogg",
		"drieux.ogg"
	],
	[
		"bello.ogg",
		"drieux.ogg",
		"drieux.ogg",
		"bello.ogg",
		"drieux.ogg",
		"bello.ogg",
		"drieux.ogg",
		"bello.ogg",
		"drieux.ogg",
		"bello.ogg",
		"drieux.ogg",
		"drieux.ogg",
		"bello.ogg"
	]
]

@onready var sfx: AudioStreamPlayer = $sound
var is_in_dialog = false
var current_message: int = 0
var char_index: int = 0
var typing_speed: float = 0.03
var is_typing: bool = false
var typing_timer: float = 0.0

func _ready():
	for i in range(SOUND_POOL_SIZE):
		var player = AudioStreamPlayer.new()
		add_child(player)
		sfx_players.append(player)

func show_message(message):
	current_message = message
	Globals.can_play = false
	char_index = 0
	text_label.text = ""
	show()
	is_typing = true
	typing_timer = typing_speed
	$Char/Text.text = character[Globals.dialog_index][current_message]
	var char_path: String = "res://assets/characters/" + expressions[Globals.dialog_index][current_message]
	$CharIcon.texture = load(char_path)

func show_dialog(dialog_index):
	is_in_dialog = true
	current_message = 0
	Globals.dialog_index = dialog_index
	show_message(current_message)

func play_sound():
	var sound_path = "res://assets/sounds/character/" + sounds[Globals.dialog_index][current_message]
	var sound = load(sound_path)
	if sounds[Globals.dialog_index][current_message] == "drieux.ogg":
		for player in sfx_players:
			if not player.playing:
				player.stream = sound
				player.play()
				return
		
		var player_to_replace = sfx_players[0]
		var highest_progress = 0.0
		
		for player in sfx_players:
			if player.stream and player.get_playback_position() > highest_progress:
				highest_progress = player.get_playback_position()
				player_to_replace = player
		
		player_to_replace.stream = sound
		player_to_replace.play()
	else:
		sfx.stream = sound
		sfx.play()
func _process(delta):
	if is_typing:
		typing_timer -= delta
		if typing_timer <= 0.0 and char_index < dialog[Globals.dialog_index][current_message].length():
			typing_timer = typing_speed
			char_index += 1
			text_label.text = dialog[Globals.dialog_index][current_message].substr(0, char_index)
			if not dialog[Globals.dialog_index][current_message][char_index - 1] in [" ", ".", ",", "!", "?"]:
				play_sound()
		elif char_index >= dialog[Globals.dialog_index][current_message].length():
			is_typing = false

func _input(event: InputEvent) -> void:
	if is_in_dialog:
		if event.is_action_pressed("ui_accept"): # espace/entrée par défaut
			if is_typing:
				# Finir d’un coup si on appuie pendant l’écriture
				text_label.text = dialog[Globals.dialog_index][current_message]
				is_typing = false
			else:
				# Passer au message suivant
				if current_message+1 < dialog[Globals.dialog_index].size():
					show_message(current_message+1)
				else:
					hide()
					char_index = 0
					current_message = 0
					Globals.can_play = true
					is_in_dialog = false
					emit_signal("dialog_finished")
