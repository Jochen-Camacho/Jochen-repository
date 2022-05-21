walker init{
    a = [1,2,3,4,5];
    b = [2,3,1,4,6];
    b.list::sort;
    c = b[-1]*a[-1];
    report [b,b[-1]-a[-1],c];
}