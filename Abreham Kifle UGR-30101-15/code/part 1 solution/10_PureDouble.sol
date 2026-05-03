// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 1 - Functions: pure function with named return value
contract Contract {
    function double(uint value) external pure returns (uint result) {
        result = value * 2;
    }
}
