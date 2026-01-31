class Solution:
    def selfDividingNumbers(self, left: int, right: int) -> List[int]:
        res = []

        for num in range(left, right + 1):
            s = str(num)
            if '0' in s:
                continue

            if all(num % int(d) == 0 for d in s):
                res.append(num)

        return res