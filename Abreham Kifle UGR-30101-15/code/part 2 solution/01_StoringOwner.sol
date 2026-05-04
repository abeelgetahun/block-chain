// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Sending Ether: store the deployer as the owner
contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
}
