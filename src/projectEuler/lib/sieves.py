import numpy as np
import math

class Sieves:
    def __init__(self, size):
        self.n = math.ceil(int(size/2))
        self.A = np.zeros(self.n, int)

    # Sieve of Eratosthenes
    #
    # Sift the Two's and Sift the Three's,
    # The Sieve of Eratosthenes.
    # When the multiples sublime,
    # The numbers that remain are Prime.
    #                     -- Anonymous
    #
    def sieveOfEratosthenes(self):
        for i in range(1,self.n):
            # all put the first odd is not a prime, caculatings val saves
            # (n / 2) memory spaces
            val = i*2+1
            if (self.A[i] == 0):
                self.A[i] = 1
                step_val = 3 * val # adding val twice, because doing it once
                                      # would just make it even
                step_i = int((step_val - 1) / 2)
                while (step_i < self.n):
                    self.A[step_i] = -1
                    step_val += val + val
                    step_i = int((step_val - 1) / 2)
        return self.A

    def reportPrimes(self):
        print(2)
        for i in range(1,self.n):
            if (self.A[i] == 1):
                val = i*2 +1
                print(val)

    def isPrime(self, n):
        if (n == 2):
            return True
        for i in range(1,self.n):
            if (n == i * 2 + 1) and (self.A[i] == 1):
                return True



    # Sieve of Atkin
    #
    # The algorithm:
    # 1
    # Create a results list, filled with 2, 3, and 5.
    # 2
    # Create a sieve list with an entry for each positive integer; all entries of
    # this list should initially be marked non prime (composite).
    # 3
    # For each entry number n in the sieve list, with modulo-sixty remainder r :
    # 3.1
    #     If r is 1, 13, 17, 29, 37, 41, 49, or 53, flip the entry for each possible
    # solution to 4x^2 + y^2 = n. The number of flipping operations as a ratio to
    # the sieving range for this step approaches 4√π/15 × 8/60 (the "8" in the
    # fraction comes from the eight modulos handled by this quadratic and the 60
    # because Atkin calculated this based on an even number of modulo 60 wheels),
    # which results in a fraction of about 0.1117010721276....
    # 3.2
    #     If r is 7, 19, 31, or 43, flip the entry for each possible solution to
    # 3x^2 + y^2 = n. The number of flipping operations as a ratio to the sieving
    # range for this step approaches π√0.12 × 4/60 (the "4" in the fraction comes
    # from the four modulos handled by this quadratic and the 60 because Atkin
    # calculated this based on an even number of modulo 60 wheels), which results in
    # a fraction of about 0.072551974569....
    # 3.3
    #     If r is 11, 23, 47, or 59, flip the entry for each possible solution to
    # 3x^2 − y^2 = n when x > y. The number of flipping operations as a ratio to the
    # sieving range for this step approaches √1.92ln(√0.5+√1.5) × 4/60 (the "4"
    # in the fraction comes from the four modulos handled by this quadratic and the
    # 60 because Atkin calculated this based on an even number of modulo 60 wheels),
    # which results in a fraction of about 0.060827679704....
    # 3.4
    #     If r is something else, ignore it completely.
    # 4
    #     Start with the lowest number in the sieve list.
    # 5
    #     Take the next number in the sieve list still marked prime.
    # 6
    #     Include the number in the results list.
    # 7
    #     Square the number and mark all multiples of that square as non prime.
    # Note that the multiples that can be factored by 2, 3, or 5 need not be marked,
    # as these will be ignored in the final enumeration of primes.
    # 8
    #     Repeat steps four through seven. The total number of operations for these
    # repetitions of marking the squares of primes as a ratio of the sieving range
    # is the sum of the inverse of the primes squared, which approaches the prime
    # zeta function(2) of 0.45224752004... minus 1/22, 1/32, and 1/52 for those
    # primes which have been eliminated by the wheel, with the result multiplied by
    # 16/60 for the ratio of wheel hits per range; this results in a ratio of about
    # 0.01363637571....

    #    Adding the above ratios of operations together, the above algorithm takes
    # a constant ratio of flipping/marking operations to the sieving range of about
    # 0.2587171021...; From an actual implementation of the algorithm, the ratio is
    # about 0.25 for sieving ranges as low as 67.
    def sieveOfAtkin(self):
        return self.A
