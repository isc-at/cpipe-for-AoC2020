
with open('../in/input09.txt', 'r') as f:
    numbers = [int(d.strip()) for d in f]
    for i in range(25, len(numbers)):
        if numbers[i] not in [a + b for a in numbers[i - 25:i] for b in numbers[i - 25:i] if a != b]:
            target = numbers[i]
            print(f'Part 1: {target}')
            break
    summed = numbers.copy()
    for i in range(1, len(numbers)):
        summed[i] += summed[i - 1]
    for i in range(len(numbers)):
        for j in range(i+2, len(numbers)):
            if summed[j] - summed[i] == target:
                # summed[j]-summed[i] gives the sum of numbers[i+1]..numbers[j]
                print(f'Part 2: {min(numbers[i+1:j]) + max(numbers[i+1:j])}')
            if summed[j] - summed[i] > target:
                break
    # Alternative oneliner
 #   print([min(numbers[i+1:j]) + max(numbers[i+1:j]) for i in range(len(numbers))
 #          for j in range(len(numbers)) if i+1 < j and summed[j] - summed[i] == target])