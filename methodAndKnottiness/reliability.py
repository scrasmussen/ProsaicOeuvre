import sys, math
import numpy as np

np.set_printoptions(precision=4)
count = 0
cost=np.array([666])
reliability=np.array([666])
# Read input. Budget, number of machines, cost and reliability
for line in sys.stdin:
    if count == 0:
        B = int(line)
    elif count == 1:
        N = int(line)
    else:
        c, r = line.rstrip().split(' ')
        cost = np.append(cost,[int(c)])
        reliability = np.append(reliability,[float(r)])
    count+=1
REL=np.zeros((N+1)*(B+1))
REL.shape=(N+1,B+1)
REL[0][:]=1
ITER=np.zeros((N+1)*(B+1))
ITER.shape=(N+1,B+1)
ITER[0][:]=1
Mrel=np.zeros((N+1)*(B+1))
Mrel.shape=(N+1,B+1)
Miter=np.zeros((N+1)*(B+1))
Miter.shape=(N+1,B+1)

originalB=B
    
def report(N,B,M,cost,t):
    p=1
    pb=B
    if t=="iter":
        print("Budget:",B)
        print("Number machines:",N)
        print("Iterated Version:")
    elif t =="memo":
        print("Memoized Version:")
    for i in range(N,0,-1):
        num = M[i][int(pb)]
        pb = pb - num * cost[i]
        rel = (1-(1-reliability[i])**num)
        p=p*rel

    print("Maximum reliability:",p)
    p=1
    for i in range(N,0,-1):
        num = M[i][int(B)]
        B = B - num * cost[i]
        print(num,"copies of machine",i,"of cost",cost[i]) #,end='. ')
        rel = (1-(1-reliability[i])**num)
        p=p*rel
        # print("Budget",B,"remaining. Prob ", rel,"Total prob",p)
    print()
    # print memoization statistics
    if t=="memo":
        tl = (N+1)*(originalB+1)
        nu = 0
        for i in range(N+1):
            for j in range(originalB+1):
                if Mrel[i][j]!=0:
                    nu=nu+1
        print("Memoization Statistics:")
        print("Total locations:",tl)
        print("Number used:",nu)
        print("Percentage used:", 100*nu/tl)


def iter(i, b, M):
    global cost, reliability
    if b<0:
        return 0
    if b==0 and i>0:
        return 0
    if b>=0 and i==0:
        return 1;
    pmax = 0
    r = math.floor(b/cost[i])
    for k in range(1,r+1):
        p = ITER[i-1][b-k*cost[i]]
        prob=p * (1-(1-reliability[i])**k)

        if pmax < prob:
            pmax = prob
            M[i][b]=k
            ITER[i][b] = pmax


def rel(i, b, M):
    startingi = i
    global cost, reliability
    if b<0:
        return 0
    if b==0 and i>0:
        return 0
    if b>=0 and i==0:
        return 1;
    pmax = 0
    # if i > N:
    #     return 0
    r = math.floor(b/cost[i])

    for k in range(1,r+1):
        p = REL[i-1][b-k*cost[i]]
        if p==0:
            p=rel(i-1,b-k*cost[i],M)

        if i!=startingi:
            print("ARTLESS D:")

        prob= p * (1-(1-reliability[i])**k)
        # if i == 5:
        #     print("P=",p,"i=",i,"b=",b, "prob=",prob,pmax)

        # prob=rel(i-1,b-k*cost[i],M) * (1-(1-reliability[i])**k)
        # if pmax < prob and b <= originalB :
        # print("i=",i,"b=",b, "prob=",prob,pmax,"p=",p)
        # if i == 5 and b == 8:
        #     print(M)
        #     print(REL)
        if pmax < prob:
            pmax = prob
            M[i][b]=k
            REL[i][b]=pmax
                
    return pmax

            
# run iterative version and print report
for i in range(1,N+1):
    for b in range(1,B+1):
        iter(i,b,Miter)
report(N,B,Miter,cost,"iter")
            
# run memoization version and print report
rel(N,originalB,Mrel)


report(N,B,Mrel,cost,"memo")
# print(Miter)
# print(Mrel)
# print()
# print(ITER)
# print(REL)
print("Fin")

print(len(REL),len(REL[1]))
