class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        s=set()
        l=len(nums)
        for i in range(l):
            for j in range(i+1, l):
                if nums[i]+nums[j]==target:
                    s.add(i)
                    s.add(j)
        return list(s)
        