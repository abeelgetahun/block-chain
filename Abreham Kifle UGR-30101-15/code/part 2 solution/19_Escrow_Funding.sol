// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 2 - Escrow: payable constructor so the depositor funds it on deploy
contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address _beneficiary) payable {
        depositor   = msg.sender;
        arbiter     = _arbiter;
        beneficiary = _beneficiary;
    }
}
