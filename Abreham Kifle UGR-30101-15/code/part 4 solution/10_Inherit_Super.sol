// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 4 - Inheritance: super.attack() lets subclasses extend, not replace, the parent

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

contract Hero {
    uint public health;
    uint public energy = 10;

    constructor(uint _health) {
        health = _health;
    }

    enum AttackTypes { Brawl, Spell }

    function attack(Enemy) public virtual {
        energy--;
    }
}

contract Mage is Hero(50) {
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Spell);
        super.attack(enemy);
    }
}

contract Warrior is Hero(200) {
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Brawl);
        super.attack(enemy);
    }
}
