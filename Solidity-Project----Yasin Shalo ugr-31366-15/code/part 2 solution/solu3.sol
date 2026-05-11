// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // sends ETH to owner
    function tip() public payable {
        (bool success, ) = payable(owner).call{value: msg.value}("");
        require(success);
    }

    // 👇 REQUIRED for testSendEther()
    receive() external payable {}
}