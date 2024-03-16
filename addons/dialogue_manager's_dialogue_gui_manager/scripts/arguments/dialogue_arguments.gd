@tool
extends Resource
class_name DialogueArguments

@export var dialogue_gui: DialogueGUI.DialogueGUIAlias
@export var dialogue_resource: DialogueResource
@export var title: String:
	get: 
		return title.to_snake_case()
@export var extra_game_states: Array = []
@export var title_variation: int = 0: 
	set(value): 
		title_variation = clamp(value, 0, 99)
@export var reset_when_title_variation_reached: bool = false

@export var is_dialogue_game_state: bool = true 


func set_dialogue_resource(value: DialogueResource) -> DialogueArguments:
	dialogue_resource = value
	return self


func set_title(value: String) -> DialogueArguments:
	title = value
	return self


func set_extra_game_states(value: Array) -> DialogueArguments:
	extra_game_states = value
	return self


func add_extra_game_states(value: Array) -> DialogueArguments:
	extra_game_states.append_array(value)
	return self


func set_title_variation(value: int) -> DialogueArguments:
	title_variation = value
	return self


func set_is_dialogue_game_state(value: bool) -> DialogueArguments:
	is_dialogue_game_state = value
	return self


func set_reset_when_title_variation_reached(value: bool) -> DialogueArguments:
	reset_when_title_variation_reached = value
	return self
	
	