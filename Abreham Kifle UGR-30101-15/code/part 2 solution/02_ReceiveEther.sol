// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Sending Ether: accept plain ether transfers
contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}
}
