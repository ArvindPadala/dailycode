class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        pos=0
        for i in range(len(nums)):
            if nums[i]!=val:
                if i!=pos:
                    nums[pos],nums[i]=nums[i],nums[pos]
                pos=pos+1
        return pos