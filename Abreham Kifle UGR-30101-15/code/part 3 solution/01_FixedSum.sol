// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Arrays: sum of a fixed-size array of 5 uints
contract Contract {
    function sum(uint[5] calldata values) external pure returns (uint) {
        uint total;
        for (uint i = 0; i < values.length; i++) {
            total += values[i];
        }
        return total;
    }
}
