// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 4 - Inheritance: Hero is the base, Mage and Warrior inherit from it
contract Hero {
    uint public health = 100;

    function takeDamage(uint damage) public {
        health -= damage;
    }
}

contract Mage is Hero {}
contract Warrior is Hero {}
