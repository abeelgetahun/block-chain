// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {

    receive() external payable {
        console.log(msg.value);
    }
}