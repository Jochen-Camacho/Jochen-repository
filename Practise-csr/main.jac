// CSR bot code -- tried connecting all the nodes, few issues works for the most part

import {*} with "./graph.jac";
import {*} with "./walkers.jac";

walker init{
    root{
        spawn here --> graph::main_graph;
        spawn --> walker::talker;
    }
}