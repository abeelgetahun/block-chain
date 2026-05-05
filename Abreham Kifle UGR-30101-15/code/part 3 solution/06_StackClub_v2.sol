// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Arrays: only existing members can grow or shrink the list
contract StackClub {
    address[] public members;

    error Forbidden();

    constructor() {
        members.push(msg.sender);
    }

    function isMember(address who) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == who) {
                return true;
            }
        }
        return false;
    }

    modifier onlyMember() {
        if (!isMember(msg.sender)) {
            revert Forbidden();
        }
        _;
    }

    function addMember(address who) external onlyMember {
        members.push(who);
    }

    function removeLastMember() external onlyMember {
        members.pop();
    }
}
