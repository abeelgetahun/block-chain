// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Calldata: Hero remembers when an unknown selector hit the fallback
contract Hero {
    struct Ambush {
        bool alerted;
        uint enemies;
        bool armed;
    }

    Ambush public ambush;
    uint public lastContact;

    function alert(uint enemies, bool armed) external {
        ambush = Ambush(true, enemies, armed);
    }

    fallback() external {
        lastContact = block.timestamp;
    }
}
