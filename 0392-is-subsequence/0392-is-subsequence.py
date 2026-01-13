class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        i,j=0,0
        l1,l2=len(s),len(t)
        if s=='':
            return True
        while j<l2:
                if s[i]==t[j]:
                    i=i+1   
                    if i==l1:
                        return True     
                j=j+1
            
        return i==l1

