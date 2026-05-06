// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 4 - Voting: a proposal stores the call to make plus tallied votes
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
}
