// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Calldata: Hero recording structured ambush data
contract Hero {
    struct Ambush {
        bool alerted;
        uint enemies;
        bool armed;
    }

    Ambush public ambush;

    function alert(uint enemies, bool armed) external {
        ambush = Ambush(true, enemies, armed);
    }
}
