class Solution:
    def isUgly(self, n: int) -> bool:
        if n<=0:
            return False
        for l in [2,3,5]:
            while n%l==0:
                n=n//l
        return n==1