class Solution:
    def canPlaceFlowers(self, flowerbed: List[int], n: int) -> bool:
        i=0
        count=0
        while i<len(flowerbed):
            left=flowerbed[i-1] if i>0 else 0
            right=flowerbed[i+1] if i<len(flowerbed)-1 else 0
            current=flowerbed[i]
            if (left,right,current)==(0,0,0):
                flowerbed[i]=1
                count=count+1
                i=i+2
            else:
                i=i+1
        return True if count>=n else False
                        