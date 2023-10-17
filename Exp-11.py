class MapColoring:
    def __init__(self, graph, colors):
        self.graph = graph
        self.colors = colors
        self.coloring = {}
    def is_valid_color(self, node, color):
        for neighbor in self.graph[node]:
            if neighbor in self.coloring and self.coloring[neighbor] == color:
                return False
        return True
    def solve(self, node):
        if node is None:
            return True
        for color in self.colors:
            if self.is_valid_color(node, color):
                self.coloring[node] = color
                if self.solve(self.get_uncolored_node()):
                    return True
                del self.coloring[node]
        return False
    def get_uncolored_node(self):
        for node in self.graph:
            if node not in self.coloring:
                return node
        return None
    def coloring_map(self):
        if self.solve(self.get_uncolored_node()):
            return self.coloring
        else:
            return None
if __name__ == "__main__":
    graph = {
        'WA': ['NT', 'SA'],
        'NT': ['WA', 'SA', 'QLD'],
        'SA': ['WA', 'NT', 'QLD', 'NSW', 'VIC'],
        'QLD': ['NT', 'SA', 'NSW'],
        'NSW': ['SA', 'QLD', 'VIC'],
        'VIC': ['SA', 'NSW']
    }
    colors = ['Red', 'Green', 'Blue']
    map_coloring = MapColoring(graph, colors)
    result = map_coloring.coloring_map()
    if result:
        print("Map Coloring Solution:")
        for region, color in result.items():
            print(f"{region}: {color}")
    else:
        print("No solution exists.")
