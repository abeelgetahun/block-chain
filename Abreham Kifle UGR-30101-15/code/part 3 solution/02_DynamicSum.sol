// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Arrays: same idea, but now the array length is dynamic
contract Contract {
    function sum(uint[] calldata values) external pure returns (uint) {
        uint total;
        for (uint i = 0; i < values.length; i++) {
            total += values[i];
        }
        return total;
    }
}
