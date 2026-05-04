// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Calldata: encode args with abi.encodeWithSignature
contract Sidekick {
    function sendAlert(address hero, uint enemies, bool armed) external {
        (bool ok, ) = hero.call(
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed)
        );
        require(ok);
    }
}
