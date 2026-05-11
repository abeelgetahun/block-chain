// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    // First function (single parameter)
    function double(uint x) public pure returns (uint) {
        return x * 2;
    }

    // Overloaded function (two parameters)
    function double(uint x, uint y) external pure returns (uint, uint) {
        return (x * 2, y * 2);
    }
}