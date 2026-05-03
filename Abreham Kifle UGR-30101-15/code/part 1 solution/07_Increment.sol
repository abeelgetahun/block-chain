// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 1 - Functions: external state-changing function
contract Contract {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }

    function increment() external {
        x = x + 1;
    }
}
