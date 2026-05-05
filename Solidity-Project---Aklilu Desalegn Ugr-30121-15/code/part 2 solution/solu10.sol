// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Sidekick {
    /**
     * @dev Manually alerts the hero by sending the function selector
     * @param heroAddress The address of the Hero contract
     */
    function sendAlert(address heroAddress) external {
        // The signature of the function we want to call
        bytes4 selector = bytes4(keccak256("alert()"));

        // Sending the manual call with the function selector as calldata
        (bool success, ) = heroAddress.call(abi.encodePacked(selector));

        require(success, "The call to the hero failed!");
    }
}