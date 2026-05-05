// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Sidekick {
    /**
     * @dev Alerts the hero with specific details about the enemies
     * @param heroAddress The address of the Hero contract
     * @param enemies The number of enemies (uint256)
     * @param armed Whether the enemies are armed (bool)
     */
    function sendAlert(address heroAddress, uint256 enemies, bool armed) external {
        // We use the full type name 'uint256' instead of 'uint'
        bytes memory payload = abi.encodeWithSignature(
            "alert(uint256,bool)", 
            enemies, 
            armed
        );

        // Perform the low-level call using the encoded payload
        (bool success, ) = heroAddress.call(payload);

        require(success, "The alert call failed!");
    }
}