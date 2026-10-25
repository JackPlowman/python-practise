from __future__ import annotations


class Solution:
    """Solution to Plus One."""

    def plusOne(self, digits: list[int]) -> list[int]:
        """Plus One."""
        last_digit = digits[-1]
        if last_digit == 9:
            for index in range(len(digits) - 1, -1, -1):
                if digits[index] + 1 != 10:
                    digits[index] += 1
                    return digits
                digits[index] = 0
                if index == 0:
                    return [1, *digits]
        else:
            last_digit += 1
            digits[-1] = last_digit
        return digits


if __name__ == "__main__":
    solution = Solution()
    digits = [1, 2, 3]
    print(solution.plusOne(digits))
