import functools

def read_file(file = "input.txt"):
    temp = []
    with open(file, "r") as fd:
        for line in fd:
            temp.append(line.strip())
    return temp


def create_line(st_pt, op):
    dir = op[0]
    distance = int(op[1:])
    if dir == 'U':
        return [ (st_pt[0], st_pt[1] + i + 1) for i in range(distance) ]
    elif dir == 'D':
        return [ (st_pt[0], st_pt[1] - i - 1) for i in range(distance) ]
    elif dir == 'R':
        return [ (st_pt[0] + i + 1, st_pt[1]) for i in range(distance) ]
    elif dir == 'L':
        return [ (st_pt[0] - i - 1, st_pt[1]) for i in range(distance) ]
    return []

def create_graph(ops):
    result = []
    cur = (0,0)
    for op in ops:
        ln = create_line(cur, op)
        cur = ln[-1]
        result = result + ln
    return result


def __main__():
    data = read_file()
    graph1 = create_graph(data[0].strip().split(","))
    graph2 = create_graph(data[1].strip().split(","))

    pts = set(graph1).intersection(graph2)
    path = min([  abs(pt[0]) + abs(pt[1]) for pt in pts ])
    print(path)

__main__()
    