# Prime digit replacements : Problem 51
#
# By replacing the 1st digit of the 2-digit number *3, it turns out that six of
# the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
#
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit
# number is the first example having seven primes among the ten generated
# numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and
# 56993. Consequently 56003, being the first member of this family, is the
# smallest prime with this property.

# Find the smallest prime which, by replacing part of the number (not
# necessarily adjacent digits) with the same digit, is part of an eight prime
# value family.

# ideas, use a filter. Have list of primes, all *3, *4, etc.

import sys
sys.path.append('lib/') # sys.path.append(r'lib/')
import sieves
import numpy as np

n = 100000
s = sieves.Sieves(n)
s.sieveOfEratosthenes()

# s.reportPrimes()

# for i in range(1,n+1):
#     if (s.isPrime(i)):
#         print(i)

# for num_digit in irange(1,2):
#     q.append(num_digit)

a = []
for i in range(1,10):
    a.append(i)

report = np.zeros((2,10))
for x in range(1,10):
    for y in range(1,10):
        i = x * 10 + y
        if (s.isPrime(i)):
            report[0,y] += 1
            report[1,x] += 1


num_digits = 5
new_report = np.zeros((num_digits,10))
start = 10 ** (num_digits - 1)
for i in range(start,start * 10):
    if (s.isPrime(i)):
        print(str(i) + " is prime")
        p = i

        digit = 4 # set to the number of digits of m
        m = start * 100
        while (m >= 1):
            num = int(p / m)
            digit -= 1
            if (num <= 0):
                m /= 10
                continue
            p -= (num * m)
            m /= 10

            # print(str(num) + "  and prime = " + str(i) + " and digit = "+ str(digit))
            new_report[digit,num] += 1



        # print(i)

print("Report:")
print(report)

print("new Report:")
print(new_report)

# max_val = report.max()
# print("max val is " + str(max_val))
# for i in range(1,10):
#     if (max_val == report[i]):
#         print("at *" + str(i))

print("Fin")
