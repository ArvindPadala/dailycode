import math
class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        l=[]
        x=len(str1)
        y=len(str2)
        z=min(x,y)
        i=0
        if str1+str2!=str2+str1:
            return ''                   
        else:
            gcd_len=math.gcd(x,y)
            for i in range(0,gcd_len):
                l.append(str1[i])
            return ''.join(l)