import sys

count = 0
for line in sys.stdin:
    if count == 0:
        B = int(line)
    elif count == 1:
        N = int(line)
    else:
        c, r = line.rstrip().split(' ')
        cost = int(c)
        reliability = float(r)
        
    count+=1


print("Fin")
