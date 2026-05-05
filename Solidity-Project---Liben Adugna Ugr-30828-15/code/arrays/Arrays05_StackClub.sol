// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StackClub {
    address[] public members;

    function addMember(address _newMember) external {
        members.push(_newMember);
    }

    function isMember(address _addr) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == _addr) {
                return true;
            }
        }
        return false;
    }
}
