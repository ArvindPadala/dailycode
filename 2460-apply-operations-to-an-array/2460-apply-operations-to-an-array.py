class Solution:
    def applyOperations(self, nums: List[int]) -> List[int]:
        l=len(nums)
        i = 0
        while i < l-1:
            if nums[i] == nums[i+1]:
                nums[i] *= 2
                nums[i+1] = 0
                i += 2          # actually skip next
            else:
                i += 1
        pos=0
        for i in range(l):
            if nums[i]!=0:
                if i!=pos:
                    nums[pos],nums[i]=nums[i],nums[pos]
                pos=pos+1
        return nums
