extends Node


func _ready() -> void:
	print("Testing")
	var example = SummingThing.new()
	example.add(40)
	example.add(20)
	example.add(50)
	print(example.get_total())
