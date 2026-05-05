// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Structs: store a single Vote in storage
contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote public vote;

    function createVote(Choices choice) external {
        vote = Vote(choice, msg.sender);
    }
}
