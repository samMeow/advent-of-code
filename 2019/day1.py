import functools

def read_file(file = "input.txt"):
    temp = []
    with open(file, "r") as fd:
        for line in fd:
            temp.append(line.strip())
    return temp

def cal(x):
    return max(0, (int(x) // 3) -2)

def deep_cal(x):
    result = cal(x)
    acc = result
    while result != 0:
        result = cal(result)
        acc = acc + result
    return acc

def __main__():
    data = read_file()
    result = functools.reduce(lambda a,b: a + deep_cal(b), data, 0)
    print(result)

__main__();