node state{
    has title;
    has message;
    has prompts;
}

edge transition{
    has intent;
}

graph main_graph{
    has anchor main_root;

    spawn{
        main_root = spawn node::state(
                        title = "Greeting",
                        message = "Hi there, welcome. What can we build today?",
                        prompts = ["website", "mobile app", "information system", "one_pager","five_pager","custom_website","game","social"] 
                        );

        quit_node = spawn node::state(title="Quit", message="quitting...", prompts="");

        website = spawn main_root -[transition(intent="website")]-> node::state(
                                title = "Website",
                                message = "What type of website would you like?",
                                prompts = ["one-pager website", "5-pager website", "custom website", "back","mobile app", "information system","game","social"] 
                                );
        website -[transition(intent="back")]-> main_root;  

        one_pager = spawn website -[transition(intent="one-pager website")]-> node::state(
                        title="One Pager",
                        message="Tell us about the one pager you'd like to build",
                        prompts=["back","main","five_pager","custom_website"]
                    );
        
        main_root -[transition(intent="one_pager")]-> one_pager;
        one_pager -[transition(intent="back")]-> website;
        one_pager -[transition(intent="main")]-> main_root;

        five_pager = spawn website -[transition(intent="5-page website")]-> node::state(
                        title="5 Pager",
                        message="Tell us about the 5 pager you'd like to build",
                        prompts=["back","main","one_pager","custom_website"]
                    );

        main_root -[transition(intent="five_pager")]-> five_pager;
        five_pager -[transition(intent="back")]-> website;
        five_pager -[transition(intent="main")]-> main_root;
        five_pager -[transition(intent="one_pager")]-> one_pager;
        one_pager -[transition(intent="five_pager")]-> five_pager;
                
        custom_website = spawn website -[transition(intent="custom website")]-> node::state(
                        title="Custom",
                        message="Tell us about the custom website you'd like to build",
                        prompts=["back","main","one_pager","five_pager"]
                    );
        
        main_root -[transition(intent="custom_website")]-> custom_website;
        custom_website -[transition(intent="back")]-> website;
        custom_website -[transition(intent="main")]-> main_root;
        five_pager -[transition(intent="custom_website")]-> custom_website;
        one_pager -[transition(intent="custom_webstie")]-> custom_website;
        custom_website -[transition(intent="one_pager")]-> one_pager;
        custom_website -[transition(intent="five_pager")]-> five_pager;

        main_root -[transition(intent="quit")]-> quit_node;
        
        mobile_app = spawn main_root -[transition(intent="mobile app")]-> node::state(
                        title="Mobile App",
                        message="What kind of mobile app would you like to build?",
                        prompts=["game", "social", "other", "back","website","info_sys"]
                    );

        mobile_app -[transition(intent="back")]-> main_root; 
        website -[transition(intent="mobile_app")]-> mobile_app; 
        mobile_app -[transition(intent="website")]-> website; 
        
        game = spawn mobile_app -[transition(intent="game")]-> node::state(
                        title="Game",
                        message="What kind of game would you like to build?",
                        prompts=["back","main","social"]
                    );

        website -[transition(intent="game")]-> game; 
        main_root -[transition(intent="game")]-> game;
        game -[transition(intent="back")]-> mobile_app;
        game -[transition(intent="main")]-> main_root;

        social = spawn mobile_app -[transition(intent="social")]-> node::state(
                        title="Social",
                        message="What kind of social media app would you like to build?",
                        prompts=["back","main","game"]
                    );

        website -[transition(intent="social")]-> social; 
        main_root -[transition(intent="social")]-> social;
        social -[transition(intent="back")]-> mobile_app;
        social -[transition(intent="main")]-> main_root;
        social -[transition(intent="game")]-> game;
        game -[transition(intent="social")]-> social;

        other = spawn mobile_app -[transition(intent="other")]-> node::state(
                        title="Other",
                        message="Tell us about this app you would like to build?",
                        prompts=["back","main","game","social"]
                    );

        other -[transition(intent="back")]-> mobile_app;
        other -[transition(intent="main")]-> main_root;
        other -[transition(intent="game")]-> game;
        other -[transition(intent="social")]-> social;
               
        
        info_sys = spawn main_root -[transition(intent="information system")]-> node::state(
                        title="Information System",
                        message="Tell us about the information system you'd like to build",
                        prompts=["back","mobile_app","website"]
                    ); 
        website -[transition(intent="info_sys")]-> info_sys; 
        info_sys -[transition(intent="back")]-> main_root; 
        mobile_app -[transition(intent="info_sys")]-> info_sys; 
        info_sys -[transition(intent="website")]-> website;
        info_sys -[transition(intent="mobile_app")]-> mobile_app;
    }
        
}