// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Arrays: a simple membership list backed by an address[] array
contract StackClub {
    address[] public members;

    function addMember(address who) external {
        members.push(who);
    }

    function isMember(address who) external view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == who) {
                return true;
            }
        }
        return false;
    }
}
