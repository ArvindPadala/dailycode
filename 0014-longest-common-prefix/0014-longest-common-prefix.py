class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if len(strs)==0:
            return ""
        
        first_word=strs[0]
        for i in range(len(first_word)):
            char=first_word[i]
            for j in range(1,len(strs)):
                if i<len(strs[j]) and char==strs[j][i]:
                    continue
                else:
                    return first_word[0:i]
        return first_word

