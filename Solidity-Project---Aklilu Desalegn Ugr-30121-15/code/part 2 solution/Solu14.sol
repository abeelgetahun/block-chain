// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    /**
     * @dev Initializes the escrow contract with the arbiter and beneficiary.
     * @param _arbiter The address of the trusted third party.
     * @param _beneficiary The address receiving the funds.
     */
    constructor(address _arbiter, address _beneficiary) {
        // The deployer of the contract is the depositor
        depositor = msg.sender;

        // Assign the passed arguments to our storage variables
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }
}