// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 3 - Mappings: track members with a mapping
contract Contract {
    mapping(address => bool) public members;

    function addMember(address who) external {
        members[who] = true;
    }
}
