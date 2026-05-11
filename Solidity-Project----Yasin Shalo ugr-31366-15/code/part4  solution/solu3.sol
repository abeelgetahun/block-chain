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
    
    // Track which addresses have voted on which proposal and their choice (true = yes, false = no)
    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public votedYes;

    function newProposal(address target, bytes calldata data) external {
        proposals.push(Proposal(target, data, 0, 0));
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
            // Changing vote
            bool previousVote = votedYes[proposalId][msg.sender];
            if (previousVote == _supports) {
                // No change, just return (or could revert, but we'll ignore)
                return;
            }
            
            // Remove previous vote
            if (previousVote) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
            
            // Add new vote
            if (_supports) {
                proposal.yesCount++;
                votedYes[proposalId][msg.sender] = true;
            } else {
                proposal.noCount++;
                votedYes[proposalId][msg.sender] = false;
            }
        }
    }
}