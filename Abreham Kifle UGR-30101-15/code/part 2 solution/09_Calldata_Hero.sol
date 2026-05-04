// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Calldata: the Hero contract receiving alerts
contract Hero {
    bool public alerted;

    function alert() external {
        alerted = true;
    }
}
