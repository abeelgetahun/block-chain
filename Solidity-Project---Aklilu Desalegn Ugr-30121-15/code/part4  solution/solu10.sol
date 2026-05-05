// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Hero.sol";

contract Warrior is Hero(200) {
    function attack(Enemy enemy) public override {
        super.attack(enemy); // Decrement energy from hero
        enemy.takeAttack(AttackTypes.Brawl);
    }
}

contract Mage is Hero(50) {
    function attack(Enemy enemy) public override {
        super.attack(enemy); // Decrement energy from hero
        enemy.takeAttack(AttackTypes.Spell);
    }
}