extends Node

@export var packed_mesh : PackInMesh

func _ready() -> void:
	packed_mesh.print_type(packed_mesh)
	print(packed_mesh.mesh_list)
	packed_mesh.pack_mesh()
