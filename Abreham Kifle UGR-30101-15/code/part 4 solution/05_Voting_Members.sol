// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 4 - Voting: only the configured members can propose or vote
contract Voting {
    event ProposalCreated(uint id);
    event VoteCast(uint id, address voter);

    enum Vote { NOT_CAST, YES, NO }

    struct Proposal {
        address target;
        bytes   data;
        uint    yesCount;
        uint    noCount;
    }

    Proposal[] public proposals;
    mapping(uint => mapping(address => Vote)) public votes;
    mapping(address => bool) public members;

    error Forbidden();

    constructor(address[] memory _members) {
        members[msg.sender] = true;
        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    modifier onlyMember() {
        if (!members[msg.sender]) {
            revert Forbidden();
        }
        _;
    }

    function newProposal(address target, bytes calldata data) external onlyMember {
        proposals.push(Proposal(target, data, 0, 0));
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint id, bool support) external onlyMember {
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
        emit VoteCast(id, msg.sender);
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
