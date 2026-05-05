// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Arrays: keep only the even numbers and push them into storage
contract Contract {
    uint[] public evenNumbers;

    function filterEven(uint[] calldata values) external {
        for (uint i = 0; i < values.length; i++) {
            if (values[i] % 2 == 0) {
                evenNumbers.push(values[i]);
            }
        }
    }
}
