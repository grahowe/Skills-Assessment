def process_conga_line(n, instructions, couples):
    conga_line = []
    partner_map = {}

    for a, b in couples:
        conga_line.append(a)
        conga_line.append(b)
        partner_map[a] = b
        partner_map[b] = a
    
    mic_holder = conga_line[0]
    output = []
    
    for instruction in instructions:
        idx = conga_line.index(mic_holder)
        
        if instruction == 'F':
            mic_holder = conga_line[idx + 1]
        elif instruction == 'B':
            mic_holder = conga_line[idx - 1]
        elif instruction == 'R':
            conga_line.pop(idx)
            conga_line.append(mic_holder)
        elif instruction == 'P':
            conga_line.pop(idx)
            partner_idx = conga_line.index(partner_map[mic_holder])
            conga_line.insert(partner_idx + 1, mic_holder)
        elif instruction == 'Y':
            output.append(partner_map[mic_holder])
    
    for name in output:
        print(name)
    print()
    
    for name in conga_line:
        print(name)

n, m = map(int, input().split())
couples = [input().split() for _ in range(n)]
instructions = input().strip()

process_conga_line(n, instructions, couples)