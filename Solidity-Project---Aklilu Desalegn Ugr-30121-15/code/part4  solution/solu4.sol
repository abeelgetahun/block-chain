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

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    function newProposal(address target, bytes calldata data) external {
        proposals.push(Proposal(target, data, 0, 0));
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool _supports) external {
        require(proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[proposalId];
        
        if (!hasVoted[proposalId][msg.sender]) {
            // First time voting
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
                // Change vote
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
            // If same vote, no changes to counts
        }
        emit VoteCast(proposalId, msg.sender);
    }
}