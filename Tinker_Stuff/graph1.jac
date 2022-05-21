node person: has name;

walker get_names{
    std.out(here.name);
    take -->;
}

walker build_example{
    node1 = spawn here --> node::person(name="Joe");
    node2 = spawn node1 --> node::person(name="Susan");
    node3 = spawn node2 --> node::person(name="Matt");
}

walker init{
    root{
        spawn here walker::build_example;
        take -->;
    }
    person{
        spawn here walker::get_names;
        disengage;
    }
}



/*node person:has name,age,birthday,profession;
edge friend:has meeting_place;
edge family:has kind;

walker init{
    person1 = spawn here -[friend(meeting_place = "college")]-> 
    node::person(name = "Josh", age = 32);
    person2 = spawn here -[family(kind = "sister")]-> 
    node::person(name = "Jane", age = 30);

    std.out("Context for our people nodes and edges:");
    for i in -->: 
        std.out(i.context,'\n',i.edge[0].context);
}

node person;
edge family;
edge friend;

walker init{
    node1 = spawn here-[friend]->node::person;
    node2 = spawn node1 <-[family]-> node::person;
    here -[friend]-> node2;

}

node plain;

walker init{
    node1 = spawn node::plain;
    node2 = spawn node::plain;
    node1 <--> node2;
    here --> node1;
    node2 <-- here;
}      */ 