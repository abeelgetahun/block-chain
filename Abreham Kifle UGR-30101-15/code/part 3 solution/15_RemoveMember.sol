// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 3 - Mappings: removing a member is just resetting the slot to false
contract Contract {
    mapping(address => bool) public members;

    function addMember(address who) external {
        members[who] = true;
    }

    function isMember(address who) external view returns (bool) {
        return members[who];
    }

    function removeMember(address who) external {
        members[who] = false;
    }
}
