class Solution:
    def reverseVowels(self, s: str) -> str:
        l=list(s)
        vowels={'a','e','i','o','u', 'A','E','I','O','U'}
        left=0
        right=len(l)-1
        while left<right:
            if l[left] in vowels and l[right] in vowels:
                l[left],l[right]=l[right],l[left]
                left+=1
                right-=1
            elif l[left] not in vowels:
                left+=1
            elif l[right] not in vowels:
                right-=1
        return "".join(l)

       
