// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Structs: allow a voter to update an already-casted vote
contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;
    // sentinel returned by _findVote when the voter has nothing yet
    Vote internal NULL_VOTE = Vote(Choices(0), address(0));

    error VoteAlreadyCasted();
    error VoteNotFound();

    function createVote(Choices choice) external {
        if (hasVoted(msg.sender)) {
            revert VoteAlreadyCasted();
        }
        votes.push(Vote(choice, msg.sender));
    }

    function changeVote(Choices choice) external {
        Vote storage v = _findVote(msg.sender);
        if (v.voter != msg.sender) {
            revert VoteNotFound();
        }
        v.choice = choice;
    }

    function hasVoted(address who) public view returns (bool) {
        Vote storage v = _findVote(who);
        return v.voter == who;
    }

    function findChoice(address who) external view returns (Choices) {
        Vote storage v = _findVote(who);
        if (v.voter == who) {
            return v.choice;
        }
        return Choices.No;
    }

    function _findVote(address who) internal view returns (Vote storage) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == who) {
                return votes[i];
            }
        }
        return NULL_VOTE;
    }
}
