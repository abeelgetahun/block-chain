// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 4 - Inheritance: Collectible inherits both Ownable and Transferable

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

contract Transferable is Ownable {
    function transfer(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }
}

contract Collectible is Ownable, Transferable {
    uint public price;

    function markPrice(uint _price) external onlyOwner {
        price = _price;
    }
}
