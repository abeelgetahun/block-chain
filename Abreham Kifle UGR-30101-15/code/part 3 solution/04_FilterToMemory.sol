// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Chapter 3 - Arrays: build a memory array because dynamic-length arrays in
// memory must have their size known at allocation time
contract Contract {
    function filterEven(uint[] calldata values) external pure returns (uint[] memory) {
        uint count;
        for (uint i = 0; i < values.length; i++) {
            if (values[i] % 2 == 0) {
                count++;
            }
        }

        uint[] memory result = new uint[](count);
        uint idx;
        for (uint i = 0; i < values.length; i++) {
            if (values[i] % 2 == 0) {
                result[idx++] = values[i];
            }
        }
        return result;
    }
}
