// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    /**
     * @dev Sends the contract's balance to the beneficiary.
     * Only the arbiter is allowed to call this.
     */
    function approve() external {
        // Only the arbiter address is allowed to proceed
        require(msg.sender == arbiter, "Only the arbiter can approve the transfer.");

        uint balance = address(this).balance;

        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer failed.");
    }
}