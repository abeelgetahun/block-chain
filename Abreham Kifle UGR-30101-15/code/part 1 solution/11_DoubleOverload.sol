// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 1 - Functions: function overloading
contract Contract {
    function double(uint value) public pure returns (uint) {
        return value * 2;
    }

    function double(uint v1, uint v2) external pure returns (uint, uint) {
        return (double(v1), double(v2));
    }
}
