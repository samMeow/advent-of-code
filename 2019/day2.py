import functools

def read_file(file = "input.txt"):
    temp = []
    with open(file, "r") as fd:
        for line in fd:
            temp.append(line.strip())
    return temp


def add(buf, fst, snd, dst):
    buf[dst] = buf[fst] + buf[snd]
    return buf

def mul(buf, fst, snd, dst):
    buf[dst] = buf[fst] * buf[snd]
    return buf

def cal(buf, fst, snd):
    cur = 0
    buf[1] = fst
    buf[2] = snd
    while cur < len(buf):
        if buf[cur] == 1:
            buf = add(buf, buf[cur+1], buf[cur+2], buf[cur+3])
            cur = cur + 4
        elif buf[cur] == 2:
            buf = mul(buf, buf[cur+1], buf[cur+2], buf[cur+3])
            cur = cur + 4
        elif buf[cur] == 99:
            break
        else:
            break
    return buf[0]

def sol(buf):
    for i in range(101):
        for j in range(101):
            if cal(buf[:], i, j) == 19690720:
                return 100 * i + j
    return 0


def __main__():
    data = read_file()
    buf = [ int(x) for x in data[0].strip().split(",")]

    print(sol(buf))
    

__main__();