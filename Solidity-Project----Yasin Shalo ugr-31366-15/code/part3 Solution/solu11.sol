// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    enum Choices { Yes, No, Abstain }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;
    mapping(address => bool) public hasVoted;  // Track if an address has already voted

    function createVote(Choices choice) external {
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        votes.push(Vote(choice, msg.sender));
    }

    function findChoice(address voter) external view returns (Choices) {
        // Since each voter can only vote once, we can use the mapping to find the vote efficiently.
        // However, we still need to retrieve the choice from the votes array or store separately.
        // For simplicity, iterate through votes to find the matching address (limited by number of votes).
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return votes[i].choice;
            }
        }
        revert("No vote found");
    }
}