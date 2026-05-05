// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "User already active");
        users[msg.sender] = User(100, true);
    }

    function transfer(address recipient, uint amount) external {
        User storage sender = users[msg.sender];
        User storage receiver = users[recipient];

        require(sender.isActive, "Sender not active");
        require(receiver.isActive, "Recipient not active");
        require(sender.balance >= amount, "Insufficient balance");

        sender.balance -= amount;
        receiver.balance += amount;
    }
}