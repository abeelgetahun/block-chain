// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Sending Ether: forward tips to the owner using a low-level call
contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function tip() external payable {
        (bool ok, ) = owner.call{value: msg.value}("");
        require(ok, "tip transfer failed");
    }
}
