// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Structs: look up a voter's choice by walking the votes array
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

    function hasVoted(address who) external view returns (bool) {
        Vote memory v = _findVote(who);
        return v.voter == who;
    }

    function findChoice(address who) external view returns (Choices) {
        Vote memory v = _findVote(who);
        if (v.voter == who) {
            return v.choice;
        }
        // default fallback when the address never voted
        return Choices.No;
    }

    function _findVote(address who) internal view returns (Vote memory) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == who) {
                return votes[i];
            }
        }
        return Vote(Choices(0), address(0));
    }
}
