//Assistant AI- basically gives an answer to a question from the choices provided.
//Stil rough around the edges, gonna work on more after cape. 

walker talker{
    can use.enc_question, use.enc_answer;
    has utterance;
    has answer;

    main{
        std.out(here.message);

        utterance = std.input("> ");

        take -[transition(intent == utterance)]-> node::subject;
    }

    subject{
        std.out(here.message);
        utterance = std.input("> ");
        q_enc = use.enc_question(utterance);
        
        for i=0 to i < 4 by i+=1{
            std.out("Please enter choice #",(i+1),".(Enter null for no choice)");
            (here.answers).list::append(std.input("> "));
        }
            
        a_enc = use.enc_answer(here.answers);

        a_scores=[];
        max = 0;
        chosen_answer = "";

        for i=0 to  i < (here.answers).length by i +=1{
            a_scores.l::append(vector.cosine_sim(q_enc, a_enc[i]));
            temp = vector.cosine_sim(q_enc, a_enc[i]);
            if (max < temp){
                max = temp;
                chosen_answer = here.answers[i];
            }
        }

        std.out("The answer to your question is:",chosen_answerm,".");

        std.input("Would you like to ask another question? ('Yes' to continue & 'No' to exit)");
        resp1 = std.input("> ");

        report [a_scores,chosen_answer];
    }
}