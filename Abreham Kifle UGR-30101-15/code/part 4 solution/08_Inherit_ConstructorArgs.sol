// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 4 - Inheritance: subclasses pass different starting health into Hero's constructor
contract Hero {
    uint public health;

    constructor(uint _health) {
        health = _health;
    }

    function takeDamage(uint damage) public {
        health -= damage;
    }
}

contract Mage    is Hero(50)  {}
contract Warrior is Hero(200) {}
