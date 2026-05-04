// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Calldata: forward arbitrary calldata that the caller already prepared
contract Sidekick {
    function relay(address hero, bytes memory data) external {
        (bool ok, ) = hero.call(data);
        require(ok);
    }
}
