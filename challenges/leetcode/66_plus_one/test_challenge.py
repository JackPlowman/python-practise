from __future__ import annotations

import pytest

from challenge import Solution  # type: ignore[import]


@pytest.mark.parametrize(
    ("function_input", "expected_output"),
    [
        ([1, 2, 3], [1, 2, 4]),
        ([4, 3, 2, 1], [4, 3, 2, 2]),
        ([9], [1, 0]),
        ([9, 9], [1, 0, 0]),
        ([9, 9, 9, 9, 9], [1, 0, 0, 0, 0, 0]),
    ],
)
def test_solution__plus_one(
    function_input: list[int], expected_output: list[int]
) -> None:
    # Act
    output = Solution().plusOne(function_input)
    # Assert
    assert expected_output == output
