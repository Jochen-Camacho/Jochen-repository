walker init {
    apple = 20;
    apple_data ={"before_eating":apple};
    while (apple >0){
        std.out("Hello World, " + "I just ate " + apple.str + " apples");
        apple = apple -5;
    }
    apple_data['after_eating'] = apple;
    report apple_data;
}
