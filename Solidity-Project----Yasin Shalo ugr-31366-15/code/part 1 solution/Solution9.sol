// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {

    function winningNumber(string calldata message) external view returns (uint) {
        // Print the hidden message
        console.log(message);

        // Return the correct winning number
        return 794;
    }
}