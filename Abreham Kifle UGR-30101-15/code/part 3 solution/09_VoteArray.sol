// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Structs: collect every vote that gets cast into a dynamic array
contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices choice) external {
        votes.push(Vote(choice, msg.sender));
    }
}
