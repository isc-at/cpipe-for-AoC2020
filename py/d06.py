with open('../in/input06.txt', 'r') as f:
    count = sum([len(set(g) - set('\n')) for g in f.read().split("\n\n")])
    print(f'Part 1: {count}')

with open('../in/input06.txt', 'r') as f:
    count = 0
    for group in f.read().split('\n\n'):
        sharedanswers = set('abcdefghijklmnopqrstuvwxyz')
        for answer in group.splitlines():
            sharedanswers = sharedanswers.intersection(answer)
        count += len(sharedanswers)
    print(f'Part 2: {count}')