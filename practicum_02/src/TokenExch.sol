// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract TokenExch  {
    
   



    function changeToken(address fromToken, address toToken, uint256 amount) public returns(bool){
        bool s = IERC20(fromToken).transferFrom(msg.sender, address(this), amount);
        require(s);
        if (IERC20(toToken).balanceOf(address(this)) > 0)
        {
            IERC20(toToken).transfer( msg.sender, amount/2);
        }

        return true;

    }
}