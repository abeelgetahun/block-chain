// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Enemy {
    function takeAttack(AttackTypes at) external;
}

enum AttackTypes {
    Spell,
    Brawl
}

contract Hero {
    uint public health;

    constructor(uint _health) {
        health = _health;
    }

    function attack(Enemy _enemy) public virtual {
        unchecked {
            health -= 10;
        }
    }
}
