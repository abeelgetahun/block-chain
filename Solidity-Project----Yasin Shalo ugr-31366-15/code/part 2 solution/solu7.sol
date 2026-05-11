// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    function withdraw() public {
        require(msg.sender == owner, "Not owner");

        (bool success, ) = payable(owner).call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }

    receive() external payable {}
}