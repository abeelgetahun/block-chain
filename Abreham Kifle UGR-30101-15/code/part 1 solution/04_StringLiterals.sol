// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 1 - Basic Data Types: String Literals
// short messages can fit in bytes32, longer ones must use string
contract Contract {
    bytes32 public msg1 = "Hello World";
    string  public msg2 = "Greetings from Abreham - this string is way longer than 32 bytes";
}
