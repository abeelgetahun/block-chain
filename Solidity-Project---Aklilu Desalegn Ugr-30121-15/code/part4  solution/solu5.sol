// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;
    
    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public votedYes;
    mapping(address => bool) public isMember;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    constructor(address[] memory _members) {
        isMember[msg.sender] = true;
        for (uint i = 0; i < _members.length; i++) {
            isMember[_members[i]] = true;
        }
    }

    modifier onlyMember() {
        require(isMember[msg.sender], "Not a member");
        _;
    }

    function newProposal(address target, bytes calldata data) external onlyMember {
        proposals.push(Proposal(target, data, 0, 0));
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool _supports) external onlyMember {
        require(proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[proposalId];
        
        if (!hasVoted[proposalId][msg.sender]) {
            if (_supports) {
                proposal.yesCount++;
                votedYes[proposalId][msg.sender] = true;
            } else {
                proposal.noCount++;
                votedYes[proposalId][msg.sender] = false;
            }
            hasVoted[proposalId][msg.sender] = true;
        } else {
            bool previousVote = votedYes[proposalId][msg.sender];
            if (previousVote != _supports) {
                if (previousVote) {
                    proposal.yesCount--;
                } else {
                    proposal.noCount--;
                }
                if (_supports) {
                    proposal.yesCount++;
                    votedYes[proposalId][msg.sender] = true;
                } else {
                    proposal.noCount++;
                    votedYes[proposalId][msg.sender] = false;
                }
            }
        }
        emit VoteCast(proposalId, msg.sender);
    }
}