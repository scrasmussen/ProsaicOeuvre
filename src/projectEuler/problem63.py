# Powerful digit counts; problem 63 from ProjectEuler

# =Problem Description=
# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
# number, 134217728=8^9, is a ninth power.

# How many n-digit positive integers exist which are also an nth power?


# import sys
# sys.setrecursionlimit(1001)


def size(n,e):
    num = n**e
    l = len(str(num))
    if (l == e):
        print("len =",l, "   ",n,"^", e, "=", num)
        return True
    return False

total = 0
n = 25
# for e in range(1,n):
#     for i in range(1,n):
#         if (size(i,e)):
#             total += 1
#     print()

for i in range(1,n):
    for e in range(1,n):
        if (size(i,e)):
            total += 1
    print()

print("total =", total, "for n =", n)
