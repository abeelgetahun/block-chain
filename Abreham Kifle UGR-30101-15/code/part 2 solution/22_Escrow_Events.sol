// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 2 - Escrow: emit an Approved event when the funds are released
contract Escrow {
    event Approved(uint amount);

    address public depositor;
    address public beneficiary;
    address public arbiter;

    error Forbidden();

    constructor(address _arbiter, address _beneficiary) payable {
        depositor   = msg.sender;
        arbiter     = _arbiter;
        beneficiary = _beneficiary;
    }

    function approve() external {
        if (msg.sender != arbiter) {
            revert Forbidden();
        }

        uint256 amount = address(this).balance;
        (bool ok, ) = beneficiary.call{value: amount}("");
        require(ok);

        emit Approved(amount);
    }
}
