// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 1 - Functions: a view function returning a computed value
contract Contract {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }

    function increment() external {
        x = x + 1;
    }

    function add(uint y) external view returns (uint) {
        return x + y;
    }
}
