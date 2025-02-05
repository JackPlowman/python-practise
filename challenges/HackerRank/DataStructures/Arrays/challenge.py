# https://www.hackerrank.com/challenges/arrays-ds/problem?isFullScreen=true#

import os

#
# Complete the 'reverseArray' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY a as parameter.
#


def reverseArray(a: list) -> None:
    a.reverse()


if __name__ == "__main__":
    fptr = open(os.environ["OUTPUT_PATH"], "w")

    arr_count = int(input().strip())

    arr = list(map(int, input().rstrip().split()))

    reverseArray(arr)

    fptr.write(" ".join(list(map(str, arr))))
    fptr.write("\n")

    fptr.close()
