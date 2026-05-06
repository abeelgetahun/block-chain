// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 4 - Inheritance: extract a reusable Ownable base and inherit it

contract Ownable {
    address public owner;

    error Forbidden();

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert Forbidden();
        }
        _;
    }
}

contract Collectible is Ownable {
    uint public price;

    function markPrice(uint _price) external onlyOwner {
        price = _price;
    }
}
