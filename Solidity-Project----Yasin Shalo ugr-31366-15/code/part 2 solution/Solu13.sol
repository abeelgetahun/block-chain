// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Sidekick {
    /**
     * @dev Sends unrecognized data to the Hero to trigger its fallback function
     * @param heroAddress The address of the Hero contract
     */
    function makeContact(address heroAddress) external {
        // We can send any random data that doesn't match a function selector.
        // Even a single byte or a string that isn't a function name works!
        (bool success, ) = heroAddress.call(abi.encodePacked("poking the hero"));

        require(success, "The call failed!");
    }
}