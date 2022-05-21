walker init{
    dict1 = {
        "P1":"James",
        "P2":"Mary",
        "P3":"Austin",
        "P1 age":"N/A",
        "P2 age":"N/A",
        "P3 age":"N/A"
    };
    dict1["P1 age"] = 21;
    dict1["P2 age"] = 22;
    dict1["P3 age"] = 24;
    report dict1.dict::items;
}