class Solution:
    def getRow(self, rowIndex: int) -> List[int]:
        arr=[]
        for i in range(0,rowIndex+1):
            subarr=[1]
            if i>0:
                prev=arr[-1]
                for j in range(1,i):
                    subarr.append(prev[j-1]+prev[j])
                subarr.append(1)
            arr.append(subarr)
        if rowIndex==0:
            return [1]
        else:
            return arr[-1]