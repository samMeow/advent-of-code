import sys

data = []
for line in sys.stdin:
    data.append([ x.strip() for x in line.split(':') ])

valid = 0
for datum in data:
    [policy, password] = datum
    [num, char] = policy.split(' ')
    [mini, maxi] = [ int(x) for x in num.split('-') ]
    if bool(password[mini-1] == char) != bool(password[maxi-1] == char):
        valid = valid + 1

print(valid)