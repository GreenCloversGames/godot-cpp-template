
#include "summingthing.h"

    void SummingThing::_bind_methods(){
        godot::ClassDB::bind_method(D_METHOD("add", "value"), &SummingThing::add);
        godot::ClassDB::bind_method(D_METHOD("reset"), &SummingThing::reset);
        godot::ClassDB::bind_method(D_METHOD("get_total"), &SummingThing::get_total);

}

    void SummingThing::add(int p_value){
        count += p_value;
    }
    void SummingThing::reset(){
        count = 0;
    }
    int SummingThing::get_total() const{
        return count;
    }

    SummingThing::SummingThing(){
        count = 0;
    }