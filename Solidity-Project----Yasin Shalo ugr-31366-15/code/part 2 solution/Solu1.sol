// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    // public state variable to store owner
    address public owner;

    // constructor runs once at deployment
    constructor() {
        owner = msg.sender;
    }
}