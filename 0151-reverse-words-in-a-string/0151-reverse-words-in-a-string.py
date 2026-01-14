class Solution:
    def reverseWords(self, s: str) -> str:
        s=s.split()
        word=[]
        l=len(s)
        for i in range(l-1,-1,-1):
            word.append(s[i])
        return ' '.join(word)