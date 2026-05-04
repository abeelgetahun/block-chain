// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    int8 public a = 20;     // positive
    int8 public b = -15;    // negative

    int16 public difference = a - b;  // 20 - (-15) = 35

}