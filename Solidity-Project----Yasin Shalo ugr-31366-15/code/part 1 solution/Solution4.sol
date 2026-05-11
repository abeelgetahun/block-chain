// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    // fits within 32 bytes
    bytes32 public msg1 = "Hello World";

    // longer than 32 bytes
    string public msg2 = "This is a long string that is definitely more than thirty-two bytes!";

}