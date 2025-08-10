extends EditorContextMenuPlugin

func _popup_menu(paths: PackedStringArray) -> void:
	add_context_menu_item("Generate ArrayMesh", multi_gen)

func multi_gen(file_paths:Array[String]):
	for path in file_paths:
		if path.ends_with(".tscn"):
			generate(load(path))

func generate(p_scene: Resource):
	var mesh = ArrayMesh.new()

	# Get an instance of the scene
	p_scene = p_scene as PackedScene
	var scene_instance = p_scene.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	
	print(scene_instance)
	# Prepare to check each node for a mesh instance3D
	var meshes : Array[TransformedMeshData] = []
	var _nodes_to_explore = scene_instance.get_children()
	
	for node in _nodes_to_explore:
		if node is MeshInstance3D:
			node = node as MeshInstance3D
			meshes.append(TransformedMeshData.new(node))
		for child in node.get_children():
			_nodes_to_explore.append(child)

	# Now, somehow join the meshes together, somehow...
	
	# Get the verticies of the mesh
	var surface_ids : Array = []
	var arrays = []
	var materials = []
	for mesh_data in meshes:
		
		for surface_id in range(mesh_data.mesh.get_surface_count()):
			var mesh_array = mesh_data.get_transformed_mesh_data_from_surface_index(surface_id)
			arrays.append(mesh_array)
			materials.append(mesh_data.mesh.surface_get_material(surface_id))

	for index in len(arrays):
		mesh.add_surface_from_arrays(Mesh.PrimitiveType.PRIMITIVE_TRIANGLES, arrays[index])
		mesh.surface_set_material(index, materials[index])
	ResourceSaver.save(mesh, p_scene.resource_path + ".mesh")

class TransformedMeshData:
	var transform : Transform3D
	var mesh : Mesh

	func _init(pmeshinstance:MeshInstance3D) -> void:
		transform = get_global_transform_from_packed_scene(pmeshinstance)
		mesh = pmeshinstance.mesh

	func get_mesh_data_from_surface_index(p_index):
		return mesh.surface_get_arrays(p_index)

	func get_transformed_mesh_data(mesh_data):
		#TODO: Mostly seems to work, but the normals are messed up. Maybe need to 
		# apply the transformation to the normals as well some how?
		var mesh_vertex = mesh_data[0]
		mesh_vertex = mesh_vertex * transform
		mesh_data[0] = mesh_vertex
		return mesh_data
	
	func get_transformed_mesh_data_from_surface_index(p_index):
		return get_transformed_mesh_data(get_mesh_data_from_surface_index(p_index))

	func get_global_transform_from_packed_scene(node:Node3D)->Transform3D:
		var transform = node.transform
		node = node.get_parent_node_3d()
		while node:
			print(transform)
			transform = node.transform.inverse() * transform
			node = node.get_parent_node_3d()
		return transform
	
