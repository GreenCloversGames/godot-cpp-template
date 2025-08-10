#pragma once

#include "godot_cpp/classes/ref_counted.hpp"
#include "godot_cpp/classes/wrapped.hpp"
#include "godot_cpp/variant/variant.hpp"
#include <godot_cpp/classes/array_mesh.hpp>
#include <godot_cpp/classes/mesh.hpp>
#include "godot_cpp/variant/array.hpp"
#include <godot_cpp/core/object.hpp>

using namespace godot;

class PackInMesh : public ArrayMesh {
	GDCLASS(PackInMesh, Mesh)


protected:
	static void _bind_methods();
	TypedArray<Mesh> mesh_list;

public:
	PackInMesh() = default;
	~PackInMesh() override = default;

	void print_type(const Variant &p_variant) const;
	void set_mesh_list(const TypedArray<Mesh> p_mesh_list);
	TypedArray<Mesh> get_mesh_list();
	void pack_mesh();
};
