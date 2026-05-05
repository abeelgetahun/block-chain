// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    mapping(address => bool) public members;

    function addMember(address _addr) external {
        members[_addr] = true;
    }
}
