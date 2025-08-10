#include "pack_in_mesh.h"

void PackInMesh::_bind_methods() {
	godot::ClassDB::bind_method(D_METHOD("print_type", "variant"), &PackInMesh::print_type);
	godot::ClassDB::bind_method(D_METHOD("pack_mesh"), &PackInMesh::pack_mesh);
	godot::ClassDB::bind_method(D_METHOD("set_mesh_list"), &PackInMesh::set_mesh_list);
	ClassDB::bind_method(D_METHOD("get_mesh_list"), &PackInMesh::get_mesh_list);
	ADD_PROPERTY(PropertyInfo(Variant::ARRAY, "mesh_list", PROPERTY_HINT_NONE, "TypedArray<Mesh>"), "set_mesh_list", "get_mesh_list");
	}

void PackInMesh::print_type(const Variant &p_variant) const {
	print_line(vformat("Type: %d", p_variant.get_type()));
}
void PackInMesh::pack_mesh() {
    for (int i = 0; i < mesh_list.size(); ++i) {
        // Use the .get() method on the Ref to get the object pointer
        print_line("Packing the mesh");
		
		Ref<Mesh> mesh_ref = mesh_list[i]; 
        
        if (mesh_ref.is_valid()) {
            print_line(mesh_ref->get_name());
        }
    }
}

TypedArray<Mesh> PackInMesh::get_mesh_list(){
	return mesh_list;
}

void PackInMesh::set_mesh_list(const TypedArray<Mesh> p_mesh_list){
	mesh_list = p_mesh_list;
}