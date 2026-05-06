// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 4 - Voting: each address can change their vote without double-counting
contract Voting {
    enum Vote { NOT_CAST, YES, NO }

    struct Proposal {
        address target;
        bytes   data;
        uint    yesCount;
        uint    noCount;
    }

    Proposal[] public proposals;
    mapping(uint => mapping(address => Vote)) public votes;

    function newProposal(address target, bytes calldata data) external {
        proposals.push(Proposal(target, data, 0, 0));
    }

    function castVote(uint id, bool support) external {
        if (_hasVoted(id, msg.sender)) {
            _reduceVote(id, votes[id][msg.sender]);
        }

        if (support) {
            proposals[id].yesCount++;
            votes[id][msg.sender] = Vote.YES;
        } else {
            proposals[id].noCount++;
            votes[id][msg.sender] = Vote.NO;
        }
    }

    function _hasVoted(uint id, address who) private view returns (bool) {
        return votes[id][who] != Vote.NOT_CAST;
    }

    function _reduceVote(uint id, Vote previous) private {
        if (previous == Vote.YES) {
            proposals[id].yesCount--;
        } else {
            proposals[id].noCount--;
        }
    }
}
