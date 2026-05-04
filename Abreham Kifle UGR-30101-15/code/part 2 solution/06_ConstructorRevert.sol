// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Reverting Transactions: refuse deployments below 1 ether
contract Contract {
    error DepositTooLow();

    constructor() payable {
        if (msg.value < 1 ether) {
            revert DepositTooLow();
        }
    }
}
