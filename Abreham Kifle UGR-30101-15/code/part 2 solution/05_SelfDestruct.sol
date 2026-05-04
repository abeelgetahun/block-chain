// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 2 - Sending Ether: donate by destroying the contract
contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner   = msg.sender;
        charity = _charity;
    }

    receive() external payable {}

    function tip() external payable {
        (bool ok, ) = owner.call{value: msg.value}("");
        require(ok);
    }

    function donate() external {
        selfdestruct(payable(charity));
    }
}
