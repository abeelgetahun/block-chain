// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Calldata: build the 4-byte function selector by hand
contract Sidekick {
    function sendAlert(address hero) external {
        bytes4 selector = bytes4(keccak256("alert()"));
        (bool ok, ) = hero.call(abi.encodePacked(selector));
        require(ok);
    }
}
