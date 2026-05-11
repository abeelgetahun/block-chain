// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StackClub {
    address[] public members;

    constructor() {
        members.push(msg.sender);
    }

    modifier onlyMember() {
        require(isMember(msg.sender), "Not a member");
        _;
    }

    function addMember(address newMember) external onlyMember {
        members.push(newMember);
    }

    function removeLastMember() external onlyMember {
        require(members.length > 0, "No members to remove");
        members.pop();
    }

    function isMember(address account) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == account) {
                return true;
            }
        }
        return false;
    }
}