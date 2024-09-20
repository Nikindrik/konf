import graphviz
import json
import subprocess
from Lesson_2.task_3 import get_random_color

def fetch_express_dependencies():
    subprocess.run("npm view express --json > .graph_2.json", shell=True, check=True)

def load_dependencies(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        return json.load(f)

def create_dependency_graph(dependencies):
    dot = graphviz.Digraph('express_dependencies',
                           graph_attr={'size': '10,10',
                                       'rankdir': 'LR',
                                       'nodesep': '1.0'})
    dot.node("express", "express", color="#55FFFF", penwidth='3')

    for dep in dependencies.get("dependencies", {}):
        color = get_random_color()
        dot.node(dep, dep, color=color, penwidth='3')
        dot.edge("express", dep, color=color, penwidth='2')

    dot.format = 'svg'
    dot.render(filename="express_graph", view=True)
    dot.save("express_graph.dot")

fetch_express_dependencies()
dependencies = load_dependencies(".graph_2.json")
create_dependency_graph(dependencies)
