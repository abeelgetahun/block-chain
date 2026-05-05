// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Sidekick {
    /**
     * @dev Relays arbitrary calldata to the hero contract
     * @param heroAddress The address of the Hero contract
     * @param data The pre-encoded calldata (payload) to be sent
     */
    function relay(address heroAddress, bytes memory data) external {
        // We use the low-level .call() and pass the 'data' bytes directly.
        // This 'data' already contains the function selector and arguments.
        (bool success, ) = heroAddress.call(data);

        // Always check if the external call was successful
        require(success, "The relayed call failed!");
    }
}