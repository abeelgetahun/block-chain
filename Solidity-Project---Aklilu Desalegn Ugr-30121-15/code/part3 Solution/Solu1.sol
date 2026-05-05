pragma solidity ^0.8.0;

contract Contract {
    function sum(uint[5] calldata arr) external pure returns (uint) {
        uint total = 0;
        for(uint i = 0; i < arr.length; i++) {
            total += arr[i];
        }
        return total;
    }
}