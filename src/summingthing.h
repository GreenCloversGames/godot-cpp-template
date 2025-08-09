#pragma once

#include "godot_cpp/classes/ref_counted.hpp"
#include "godot_cpp/classes/wrapped.hpp"
#include "godot_cpp/variant/variant.hpp"

using namespace godot;

class SummingThing : public Object {
    GDCLASS(SummingThing, Object);

    int count;

protected:
    static void _bind_methods();
private:
    void add(int p_value);
    void reset();
    int get_total() const;

    SummingThing();
};
