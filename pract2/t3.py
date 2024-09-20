import subprocess
import json
from graphviz import Digraph

def get_python_dependencies(package_name):
    result = subprocess.run(['pipdeptree', '--json'], capture_output=True, text=True)
    dependencies = json.loads(result.stdout)
    package_dependencies = [dep for dep in dependencies if dep['package']['package_name'] == package_name]
    return package_dependencies

def get_js_dependencies(package_json_path):
    with open(package_json_path, 'r') as file:
        package_data = json.load(file)
    dependencies = package_data.get('dependencies', {})
    return dependencies

def build_graph(dependencies, package_name):
    graph = Digraph(comment=f'{package_name} dependencies')
    for dep, version in dependencies.items():
        graph.node(dep, f'{dep} ({version})')
        graph.edge(package_name, dep)
    graph.render(f'{package_name}_dependencies', format='png')

matplotlib_dependencies = get_python_dependencies('matplotlib')
matplotlib_deps = {dep['package']['package_name']: dep['package']['installed_version'] for dep in matplotlib_dependencies[0]['dependencies']}
build_graph(matplotlib_deps, 'matplotlib')

express_deps = get_js_dependencies('./express/package.json')
build_graph(express_deps, 'express')
