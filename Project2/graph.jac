node state{
    has title;
    has message;
    has tags; 
    has prompts;
}

edge transition{
    has intent;
}

graph main_graph{
    has anchor main_root;

    spawn{
        main_root = spawn node::state(
            title = "Greetings",
            message = "Hey, what do you want to talk about today?",
            prompts = ["Universities", "Scholarships"],
            tags = ["Opener", "home"]
        );

        universities = spawn main_root -[transition(intent = "Universities")]-> node::state(
            title = "Universities",
            message = "What about universities do you want to talk about?",
            prompts = ["University of Guyana", "Foreign Universities", "back"],
            tags = [""]
        );
        
        universities -[transition(intent = "back")]-> main_root;
        
        unversity_of_guyana = spawn main_root -[transition(intent = "University_of_Guyana")]-> node::state(
            title = "Universitiy of Guyana",
            message = "What about the Universitiy of Guyana do you want to talk about?",
            prompts = ["What is the University of Guyana", "back"],
            tags = [""]
        );

        unversity_of_guyana -[transition(intent="back")]->universities;
        unversity_of_guyana -[transition(intent="main")]->main_root;
        

        scholarships = spawn main_root -[transition(intent = "Scholarships")]-> node::state(
            title = "Scholarships",
            message = "What about the scholarships do you want to talk about?",
            prompts = ["back"] 
        );

        scholarships -[transition(intent = "back")]-> main_root; 
    }
}