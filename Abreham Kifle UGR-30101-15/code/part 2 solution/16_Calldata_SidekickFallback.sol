// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Calldata: trigger the Hero's fallback by sending a selector that doesn't exist
contract Sidekick {
    function makeContact(address hero) external {
        (bool ok, ) = hero.call(
            abi.encodeWithSignature("greet(uint256)", 5)
        );
        require(ok);
    }
}
