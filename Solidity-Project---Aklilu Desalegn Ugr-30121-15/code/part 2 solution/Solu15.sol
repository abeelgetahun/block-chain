// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    /**
     * @dev Initializes the escrow and accepts an initial deposit.
     * @param _arbiter The address of the trusted third party.
     * @param _beneficiary The address receiving the funds.
     */
    constructor(address _arbiter, address _beneficiary) payable {
        // The deployer is the depositor
        depositor = msg.sender;

        arbiter = _arbiter;
        beneficiary = _beneficiary;
        
        // Note: The Ether sent during deployment is now stored 
        // in this contract's balance automatically.
    }
}