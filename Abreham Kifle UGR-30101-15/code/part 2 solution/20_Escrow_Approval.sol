// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 2 - Escrow: anyone can release funds (security comes in the next step)
contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address _beneficiary) payable {
        depositor   = msg.sender;
        arbiter     = _arbiter;
        beneficiary = _beneficiary;
    }

    function approve() external {
        uint256 amount = address(this).balance;
        (bool ok, ) = beneficiary.call{value: amount}("");
        require(ok);
    }
}
