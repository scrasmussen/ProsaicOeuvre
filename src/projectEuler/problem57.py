# Square root convergents; problem 57 from ProjectEuler
import sys
sys.setrecursionlimit(2001)


def calc(numer, denom, n):
    if (n == 1):
        numer += denom
        return (len(str(numer)) > len(str(denom)))
    else:
        (numer, denom) = (denom, denom * 2 + numer)
        return calc(numer, denom, n-1)


numerator = 1
denominator = 2
total = 0

for n in range(1,1 + 1000):
    if (calc(numerator,denominator,n)):
        total += 1

print("total =", total, "for n =", n)
