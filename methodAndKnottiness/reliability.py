import sys, math

count = 0
cost=[]
reliability=[]

# Read input. Budget, number of machines, cost and reliability
for line in sys.stdin:
    if count == 0:
        B = int(line)
    elif count == 1:
        N = int(line)
    else:
        c, r = line.rstrip().split(' ')
        cost.append(int(c))
        reliability.append(float(r))

    count+=1

M = [[0 for i in range(B)] for i in range(N)]
for i in range(B):
    M[0][i]=1

    
print(cost)
#for i in range(1,N):
for i in range(1,3):
    for b in range(0,B):
        max = 0
        # break
        for k in range(0, math.floor(b/cost[i])):
            m = M[i-1][b-k*cost[i]]*(1-reliability[i])**k
            if m > max:
                max = m
                print("new max",max)

print("Budget:", B)
print("Number machines:", N)
# print("\nIterated Version:")
# print(M[0:3])

print("Fin")
