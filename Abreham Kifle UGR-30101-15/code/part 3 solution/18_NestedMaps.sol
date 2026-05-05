// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 3 - Mappings: a nested mapping models a relationship graph
contract Contract {
    enum ConnectionTypes { Unacquainted, Friend, Family }

    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address other, ConnectionTypes connectionType) external {
        connections[msg.sender][other] = connectionType;
    }
}
