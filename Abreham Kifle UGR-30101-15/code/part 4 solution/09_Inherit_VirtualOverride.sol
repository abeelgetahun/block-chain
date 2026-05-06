// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 4 - Inheritance: abstract Hero forces every subclass to define attack()

contract Enemy {
    uint public health = 100;

    function takeAttack(Hero.AttackTypes attackType) external {
        if (attackType == Hero.AttackTypes.Brawl) {
            health -= 50;
        } else if (attackType == Hero.AttackTypes.Spell) {
            health -= 80;
        }
    }
}

abstract contract Hero {
    uint public health;

    constructor(uint _health) {
        health = _health;
    }

    function takeDamage(uint damage) public {
        health -= damage;
    }

    enum AttackTypes { Brawl, Spell }
    function attack(Enemy enemy) public virtual;
}

contract Mage is Hero(50) {
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Spell);
    }
}

contract Warrior is Hero(200) {
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Brawl);
    }
}
