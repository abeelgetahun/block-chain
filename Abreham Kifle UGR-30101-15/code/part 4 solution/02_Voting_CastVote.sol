// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 4 - Voting: bump yes/no count for a given proposal id
contract Voting {
    struct Proposal {
        address target;
        bytes   data;
        uint    yesCount;
        uint    noCount;
    }

    Proposal[] public proposals;

    function newProposal(address target, bytes calldata data) external {
        proposals.push(Proposal(target, data, 0, 0));
    }

    function castVote(uint id, bool support) external {
        if (support) {
            proposals[id].yesCount++;
        } else {
            proposals[id].noCount++;
        }
    }
}
