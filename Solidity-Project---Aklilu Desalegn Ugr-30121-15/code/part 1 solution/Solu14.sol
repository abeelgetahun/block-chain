// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    // The account that sends the funds to the contract
    address public depositor;

    // The account that will receive the funds once conditions are met
    address public beneficiary;

    // The trusted third party who approves the transfer
    address public arbiter;
}