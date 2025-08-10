@tool
extends EditorPlugin
const PackedSceneToMeshPlugin = preload("res://addons/scenetomeshconversion/packed_scene_to_mesh_plugin.gd")

func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_context_menu_plugin(EditorContextMenuPlugin.ContextMenuSlot.CONTEXT_SLOT_FILESYSTEM, PackedSceneToMeshPlugin.new())
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
