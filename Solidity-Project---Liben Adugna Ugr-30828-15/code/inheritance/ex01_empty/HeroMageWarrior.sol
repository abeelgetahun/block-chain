// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hero {
    uint public health;

    constructor() {
        health = 100;
    }
}

contract Mage is Hero {}

contract Warrior is Hero {}
