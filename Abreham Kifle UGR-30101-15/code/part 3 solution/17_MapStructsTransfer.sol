// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 3 - Mappings: a tiny token-style transfer between two active users
contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    error UserAlreadyCreated();
    error UserNotActive();
    error NotEnoughFunds();

    function createUser() external {
        if (users[msg.sender].isActive) {
            revert UserAlreadyCreated();
        }
        users[msg.sender] = User(100, true);
    }

    function transfer(address to, uint amount) external {
        if (!users[msg.sender].isActive || !users[to].isActive) {
            revert UserNotActive();
        }
        if (users[msg.sender].balance < amount) {
            revert NotEnoughFunds();
        }
        users[msg.sender].balance -= amount;
        users[to].balance         += amount;
    }
}
