import sys

data = []
for line in sys.stdin:
    data.append([ x.strip() for x in line.split(':') ])

valid = 0
for datum in data:
    [policy, password] = datum
    [num, char] = policy.split(' ')
    [mini, maxi] = [ int(x) for x in num.split('-') ]
    count = 0
    for c in password:
        if c == char:
            count = count + 1
    if count >= mini and count <= maxi:
        valid = valid + 1

print(valid)