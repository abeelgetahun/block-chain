// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    /// @notice Returns the sum of a dynamic array of unsigned integers.
    /// @param arr Dynamic array of uints.
    /// @return total The sum of the array elements.
    function sum(uint[] calldata arr) external pure returns (uint total) {
        for (uint i = 0; i < arr.length; i++) {
            total += arr[i];
        }
    }
}