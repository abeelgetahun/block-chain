// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Reverting Transactions: a reusable onlyOwner modifier
contract Contract {
    uint    private configA;
    uint    private configB;
    uint    private configC;
    address private owner;

    error Forbidden();

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert Forbidden();
        }
        _;
    }

    function setA(uint v) public onlyOwner { configA = v; }
    function setB(uint v) public onlyOwner { configB = v; }
    function setC(uint v) public onlyOwner { configC = v; }
}
