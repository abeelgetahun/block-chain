// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Hero.sol";

contract Warrior is Hero(200) {
    // Warrior starts with 200 health
}

contract Mage is Hero(50) {
    // Mage starts with 50 health
}