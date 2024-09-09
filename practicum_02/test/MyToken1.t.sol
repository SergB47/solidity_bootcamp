// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import  "../src/MyToken1.sol";


contract tokenTest is Test { 
    MyToken1 tokenOne;
    MyToken1 tokenTwo;


    function setUp() public {
        tokenOne = new MyToken1("MTKN1", "MT2", 18);
        tokenTwo = new MyToken1("MTKN2", "MT2", 18);
    }

    function test_name() public view {
        assertEq("MTKN1", tokenOne.name());
        assertEq("MTKN2", tokenTwo.name());
    }

    function test_totalSupply() public view {
        console.log(tokenOne.totalSupply());
    }

    
    

}
