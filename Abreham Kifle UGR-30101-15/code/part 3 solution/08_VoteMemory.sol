// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Structs: build a struct in memory and return it (no storage write)
contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    function createVote(Choices choice) external view returns (Vote memory) {
        return Vote(choice, msg.sender);
    }
}
