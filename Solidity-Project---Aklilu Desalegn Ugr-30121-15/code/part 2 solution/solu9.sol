// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IHero {
    function alert() external;
}

contract Sidekick {
    /**
     * @dev Sends an alert to the hero contract
     * @param heroAddress The address of the deployed Hero contract
     */
    function sendAlert(address heroAddress) external {
        // 1. Wrap the address in the interface: IHero(heroAddress)
        // 2. Call the alert() function defined in that interface
        IHero(heroAddress).alert();
    }
}