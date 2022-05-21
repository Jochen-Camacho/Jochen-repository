node main{
    has title;
    has message;
}

node subject{
    has title;
    has message;  
    has ask; 
    has answers;
}

edge transition{
    has intent;
}

graph main_graph{
    has anchor main_root;

    spawn{
        main_root = spawn node::main(
            title = "Opening",
            message = "Please enter the subject you want to ask about. {Maths, English, Social_Studies and Science}"
        );

        maths = spawn main_root -[transition(intent="Maths")]-> node::subject(
            title = "Maths",
            message = "Please Enter your Question.",
            answers =[]
        );

        english = spawn main_root -[transition(intent="English")]-> node::subject(
            title = "English",
            message = "Please Enter your Question.",
            answers =[]
        );

        social_studies = spawn main_root -[transition(intent="Social_Studies")]-> node::subject(
            title = "Social_Studies",
            message = "Please Enter your Question.",
            answers =[]
        );

        science = spawn main_root -[transition(intent="Science")]-> node::subject(
            title = "Science",
            message = "Please Enter your Question.",
            answers =[]
        );
    }
}
