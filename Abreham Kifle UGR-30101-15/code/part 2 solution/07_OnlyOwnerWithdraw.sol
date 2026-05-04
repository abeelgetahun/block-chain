// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Reverting Transactions: only the owner can withdraw
contract Contract {
    address public owner;

    error DepositTooLow();
    error Forbidden();

    constructor() payable {
        if (msg.value < 1 ether) {
            revert DepositTooLow();
        }
        owner = msg.sender;
    }

    function withdraw() external {
        if (msg.sender != owner) {
            revert Forbidden();
        }
        (bool ok, ) = owner.call{value: address(this).balance}("");
        require(ok);
    }
}
