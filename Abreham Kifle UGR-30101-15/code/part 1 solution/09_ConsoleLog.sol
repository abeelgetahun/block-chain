// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

// Chapter 1 - Functions: using forge-std console.log to read a hidden hint
contract Contract {
    function winningNumber(string calldata secretMessage) external view returns (uint) {
        console.log(secretMessage);
        // value chosen after reading the log line printed by forge test -vv
        return 794;
    }
}
