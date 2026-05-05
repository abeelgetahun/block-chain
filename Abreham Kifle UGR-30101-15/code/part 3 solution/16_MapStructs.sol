// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 3 - Mappings: each address maps to a User struct
contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    error UserAlreadyCreated();

    function createUser() external {
        if (users[msg.sender].isActive) {
            revert UserAlreadyCreated();
        }
        users[msg.sender] = User(100, true);
    }
}
