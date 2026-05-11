// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public arbiter;
    address public beneficiary;

    event Approved(uint256 balance);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    function approve() public {
        uint256 balance = address(this).balance;

        emit Approved(balance);

        payable(beneficiary).transfer(balance);
    }
}