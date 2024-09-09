// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import "../src/MyToken1.sol";
import "../src/TokenExch.sol";


contract TokenExchTest is Test{
    MyToken1 tokenOne;
    MyToken1 tokenTwo;

    TokenExch tokenExch;

    address Alice = vm.addr(0x1);
    address Bob = vm.addr(0x2);

    function setUp() public {
        tokenOne = new MyToken1("MTKN1", "MT2", 18);
        tokenTwo = new MyToken1("MTKN2", "MT2", 18);
        tokenExch = new TokenExch();
    }

    function test_Exchange () public{
        
        tokenOne.mint(Alice, 100e18);
        tokenTwo.mint(Alice, 200e18);

        vm.startPrank(Alice);
        console.log("Alice address:", address(Alice));
        console.log("tokenExch address", address(tokenExch));
        console.log("address this:", address(this));

        tokenTwo.transfer(address(tokenExch), 50e18);
        tokenTwo.balanceOf(address(tokenExch));
        tokenOne.approve(address(tokenExch), 10e18);
        console.log(tokenOne.allowance(address(Alice), address(tokenExch)));

        tokenExch.changeToken(address(tokenOne), address(tokenTwo), 10e18);
        console.log("Alice Balance After:",tokenTwo.balanceOf(address(Alice)));

        vm.startPrank(Bob);
        vm.deal(Bob,10 ether);
        console.log("Ether balance Bob:", address(Bob).balance);
        tokenTwo.mint(address(tokenExch),100e18);
        tokenExch.changeEther{value: 1 ether}(address(tokenTwo));
        console.log("Bob balance tokenTwo:", IERC20(tokenTwo).balanceOf(address(Bob)));
        


    }

}