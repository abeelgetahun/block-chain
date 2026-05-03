// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 1 - Functions: constructor with arguments
contract Contract {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }
}
