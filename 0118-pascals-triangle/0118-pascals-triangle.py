class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        arr=[]
        for i in range(numRows):
            subarr=[1]
            if i>0:
                prev=arr[-1]
                for j in range(1,i):
                    subarr.append(prev[j-1]+prev[j])
                subarr.append(1)
            arr.append(subarr)
        return arr
