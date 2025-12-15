class Solution(object):
    def mergeAlternately(self, word1, word2):
        """
        :type word1: str
        :type word2: str
        :rtype: str
        """
        word=[]
        lenw1=len(word1)
        lenw2=len(word2)
        i=j=0
        while i<lenw1 or j<lenw2:
            if i<lenw1:
                word.append(word1[i])
                i=i+1
            if j<lenw2:
                word.append(word2[j])
                j=j+1
        return "".join(word)
        
        