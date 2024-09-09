// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../src/MyERC20.sol";

contract MyToken1 is MyERC20 {
    constructor(string memory name_, string memory symbol_, uint8 decimals_) MyERC20(name_, symbol_, decimals_){

    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount*10**18);
    }
}