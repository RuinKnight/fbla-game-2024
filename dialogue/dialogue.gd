class_name Dialogue
extends Node

signal dialogue_started

func start_dialogue():
	dialogue_started.emit()

class DialogueObject:
	var text = ["yappuchino"]
	var options: Array[Dictionary]
